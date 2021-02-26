import 'package:meta/meta.dart';

import 'common_labels.dart';
import 'display.dart';
import 'form.dart';

abstract class AddressFormat {
  /// ISO 3166-1 alpha-2 code.
  abstract final String country;

  /// Dictionary of a language to 2D list of address pieces describing how
  /// the address should be represented in text.
  ///
  /// First language in the map is used as a fallback.
  final Map<String, List<List<DisplayAddressPiece>>> displayFormat = {};

  /// 2D list of address parts describing how the form for a given country's
  /// address should be layed out.
  final List<List<AddressFormField>> formFormat = [];

  /// If country uses zones (province, state, etc.) this is a dictionary of its
  /// ISO 3166-2 code to the dictionary of language => full name.
  ///
  /// First language in the map is used as a fallback.
  final Map<String, Map<String, String>> zoneNames = {};

  static const Map<AddressFormField, Map<String, String>> _defaultFieldLabels =
      {
    AddressFormField.fullName: fullNameLabel,
    AddressFormField.company: companyLabel,
    AddressFormField.address1: address1Label,
    AddressFormField.address2: address2Label,
    AddressFormField.city: cityLabel,
    AddressFormField.zone: regionLabel,
    AddressFormField.postalCode: postalCodeLabel,
  };

  /// Custom names for fields like `postalCode` or `zone`. Dictionary of
  /// an [AddressFormField] to a map of language to field name.
  ///
  /// First language in the map is used as a fallback.
  @protected
  final Map<AddressFormField, Map<String, String>> customFieldLabels = {};

  /// Names of the address fields.
  Map<AddressFormField, Map<String, String>> get fieldLabels =>
      {..._defaultFieldLabels, ...customFieldLabels};
}
