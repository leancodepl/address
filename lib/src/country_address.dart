enum DisplayAddressPart {
  firstName,
  lastName,
  company,
  city,
  postalCode,
  zone,
  fullZone,
  address1,
  address2,
  phone,
}

enum FormAddressPart {
  firstName,
  lastName,
  company,
  city,
  postalCode,
  zone,
  address1,
  address2,
  phone,
}

class AddressPartField {
  const AddressPartField(this.part, [this.size = 1]);

  /// The [FormAddressPart] that the field describes.
  final FormAddressPart part;

  /// The size of a field, describing how big the field is relative to other
  /// fields on the same line.
  final int size;
}

extension AddressPartFieldExtension on FormAddressPart {
  AddressPartField field([int size = 1]) => AddressPartField(this, size);
}

class CountryAddress {
  CountryAddress(
    this.country, {
    this.displayFormat = const {},
    this.formFormat = const [],
    this.zoneNames = const {},
  }) : assert(displayFormat.values.every((lang) => lang.every((line) => line
            .every((part) => part is DisplayAddressPart || part is String))));

  /// ISO 3166-1 alpha-2 code.
  final String country;

  /// Dictionary of a language to 2D list of address parts describing how
  /// the address should be represented in text. The part can be
  /// either an [DisplayAddressPart] or a string.
  final Map<String, List<List<Object>>> displayFormat;

  /// 2D list of address parts describing how the form for a given country's
  /// address should be layed out.
  final List<List<AddressPartField>> formFormat;

  /// If country uses zones (province, state, etc.) this is a dictionary of its
  /// ISO 3166-2 code to the dictionary of language => full name.
  final Map<String, Map<String, String>> zoneNames;
}
