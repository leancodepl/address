// Copyright 2021 LeanCode Sp. z o.o.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

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

  /// If the field can contain only a closed set of values, [availableValues]
  /// is this set.
  ///
  /// See also:
  /// - [isList]
  final Map<String, String>? availableValues;

  /// Whether this field accept values only from the [availableValues].
  bool get isList => availableValues != null;
}
