enum DisplayAddressPart {
  fullName,
  fullNameUppercase,

  company,
  companyUppercase,

  city,
  cityUppercase,

  postalCode,

  zone,
  fullZone,

  address1,
  address1Uppercase,

  address2,
  address2Uppercase,
}

class DisplayAddressPiece {
  DisplayAddressPiece({this.part, this.text})
      : assert((part != null) != (text != null));

  final DisplayAddressPart? part;
  final String? text;
}
