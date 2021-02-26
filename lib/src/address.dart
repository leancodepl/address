class Address {
  const Address({
    this.fullName,
    this.company,
    this.city,
    this.postalCode,
    this.zone,
    this.address1,
    this.address2,
    this.phone,
    required this.country,
  });

  /// Full personal name.
  final String? fullName;

  /// Company name.
  final String? company;

  /// City, town, village, etc.
  final String? city;

  /// Postal code, ZIP code, post office code, etc.
  final String? postalCode;

  /// Country zone like state or province. ISO 3166-2.
  final String? zone;

  /// First line of the address, usually street name with other data.
  final String? address1;

  /// Second line of the address.
  final String? address2;

  /// Phone number.
  final String? phone;

  /// Country. ISO 3166-1 alpha-2.
  final String country;
}
