import 'package:address/src/formats.dart';

import 'address.dart';
import 'address_format.dart';
import 'display.dart';

class AddressFormatter {
  const AddressFormatter([this._language = 'en']);

  static final _defaultAddressFormat = addressFormats['us']!;
  final String _language;

  /// Format [Address] to the correct format for its country for display
  /// purposes.
  List<String> formatDisplay(Address address) {
    final addressFormat = _getAddressFormat(address);

    final displayFormat = addressFormat.displayFormat[_language] ??
        addressFormat.displayFormat[addressFormat.displayFormat.keys.first]!;

    final lines = <String>[];
    for (final line in displayFormat) {
      final lineBuffer = StringBuffer();

      for (final part in line) {
        if (part.text != null) {
          lineBuffer.write(part.text!);
        } else {
          lineBuffer.write(_mapAddressPart(address, part.part!) ?? '');
        }
      }

      if (lineBuffer.isNotEmpty) {
        lines.add(lineBuffer.toString());
      }
    }

    return lines;
  }

  AddressFormat _getAddressFormat(Address address) =>
      addressFormats[address.country] ?? _defaultAddressFormat;

  String? _mapAddressPart(Address address, DisplayAddressPart part) {
    switch (part) {
      case DisplayAddressPart.fullName:
        return address.fullName;
      case DisplayAddressPart.fullNameUppercase:
        return address.fullName?.toUpperCase();
      case DisplayAddressPart.city:
        return address.city;
      case DisplayAddressPart.cityUppercase:
        return address.city?.toUpperCase();
      case DisplayAddressPart.postalCode:
        return address.postalCode;
      case DisplayAddressPart.zone:
        return address.zone;
      case DisplayAddressPart.fullZone:
        return _fullZoneName(address);
      case DisplayAddressPart.address1:
        return address.address1;
      case DisplayAddressPart.address1Uppercase:
        return address.address1?.toUpperCase();
      case DisplayAddressPart.address2:
        return address.address2;
      case DisplayAddressPart.address2Uppercase:
        return address.address2?.toUpperCase();
      default:
        return null;
    }
  }

  String? _fullZoneName(Address address) {
    final addressFormat = _getAddressFormat(address);
    final names = addressFormat.zoneNames[address.zone];
    if (names == null) {
      return address.zone;
    }

    return names[_language] ?? names[names.keys.first];
  }
}
