import '../address.dart';

abstract class ZoneValidator {
  /// Validates whether the `zone` (ISO 3166-2) is a part of the `country`
  /// (ISO 3166-1 alpha-2).=
  static bool valid(String country, String? zone) {
    final addressFormat = AddressFormatter.getAddressFormat(country);

    final hasZoneInForm =
        addressFormat.formFormat.contains(AddressFormField.zone);
    final zoneObligatory =
        addressFormat.obligatoryFormFields.contains(AddressFormField.zone);
    final zones = addressFormat.zoneNames.keys;

    if (!hasZoneInForm) {
      // If there is no zone field in the form
      return zone == null;
    }

    if (zones.isEmpty) {
      // If zone can be any string

      if (zoneObligatory) {
        return zone != null && zone.isNotEmpty;
      }

      return true;
    }

    if (zones.contains(zone)) {
      return true;
    }

    if (!zoneObligatory && (zone == null || zone.isEmpty)) {
      return true;
    }

    return false;
  }
}
