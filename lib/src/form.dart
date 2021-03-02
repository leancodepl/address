enum AddressFormField {
  fullName,
  city,
  postalCode,
  zone,
  addressLine1,
  addressLine2,
}

/// Localized description of an address form field.
class AddressFormFieldInformation {
  AddressFormFieldInformation(
    this.language,
    this.type, {
    required this.label,
    this.description,
    this.obligatory = false,
    this.availableValues,
  }) : assert(availableValues == null || availableValues.isNotEmpty);

  /// Language to which this field information is localized.
  final String language;

  /// Type of the field.
  final AddressFormField type;

  /// Human readable label for the field.
  final String label;

  /// Human readable description for the field, usually a helper text below
  /// the field or a placeholder.
  final String? description;

  /// Whether this field must not be left empty to produce a valid address.
  final bool obligatory;

  /// If the field can contain only a closed set of values, [availableValuess]
  /// is this set.
  ///
  /// See also:
  /// - [isList]
  final Map<String, String>? availableValues;

  /// Whether this field accept values only from the [availableValues].
  bool get isList => availableValues != null;
}
