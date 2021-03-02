import 'package:meta/meta.dart';

import 'common_labels.dart';
import 'display.dart';
import 'form.dart';

abstract class AddressFormat {
  /// ISO 3166-1 alpha-2 code.
  String get country;

  /// Dictionary of a language to 2D list of address pieces describing how
  /// the address should be represented in text.
  ///
  /// First language in the map is used as a fallback.
  Map<String, List<List<DisplayAddressPiece>>> get displayFormat;

  /// List of address parts describing how the form for a given country's
  /// address should be layed out.
  List<AddressFormField> get formFormat;

  @protected
  bool get isPostalCodeObligatory => true;

  @protected
  bool get isZoneObligatory => false;

  /// Form fields that are obligatory in form.
  List<AddressFormField> get obligatoryFormFields => [
        AddressFormField.fullName,
        AddressFormField.addressLine1,
        AddressFormField.city,
        if (isZoneObligatory) AddressFormField.zone,
        if (isPostalCodeObligatory) AddressFormField.postalCode,
      ];

  /// If country uses zones (province, state, etc.) this is a dictionary of its
  /// ISO 3166-2 code to the dictionary of language => full name.
  ///
  /// First language in the map is used as a fallback.
  Map<String, Map<String, String>> get zoneNames => {};

  static const _defaultFieldLabels = {
    AddressFormField.fullName: fullNameAndOrCompanyLabel,
    AddressFormField.addressLine1: address1Label,
    AddressFormField.addressLine2: address2Label,
    AddressFormField.city: cityLabel,
    AddressFormField.zone: regionLabel,
    AddressFormField.postalCode: postalCodeLabel,
  };

  /// Custom names for fields like `postalCode` or `zone`. Dictionary of
  /// an [AddressFormField] to a map of language to field name.
  ///
  /// First language in the map is used as a fallback.
  @protected
  Map<AddressFormField, Map<String, String>> get customFieldLabels => {};

  /// Names of the address fields.
  Map<AddressFormField, Map<String, String>> get fieldLabels =>
      {..._defaultFieldLabels, ...customFieldLabels};

  /// Descriptions for fields, usually served as a placeholder or helper text.
  /// Dictionary of an [AddressFormField] to a map of language to field name.
  ///
  /// First language in the map is used as a fallback.
  Map<AddressFormField, Map<String, String>> get fieldDescriptions => {};
}
