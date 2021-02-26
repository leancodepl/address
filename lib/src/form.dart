enum FormAddressPart {
  fullName,
  company,
  city,
  postalCode,
  zone,
  address1,
  address2,
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
