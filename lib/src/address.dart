class Address {
  const Address({
    required this.country,
    this.fullName,
    this.city,
    this.postalCode,
    this.zone,
    this.addressLine1,
    this.addressLine2,
  });

  /// Country. ISO 3166-1 alpha-2.
  final String country;

  /// Full personal name and/or company name.
  final String? fullName;

  /// City, town, village, etc.
  final String? city;

  /// Postal code, ZIP code, post office code, etc.
  final String? postalCode;

  /// Country zone like state or province. ISO 3166-2.
  final String? zone;

  /// First line of the address, usually street name with other data.
  final String? addressLine1;

  /// Second line of the address.
  final String? addressLine2;
}
