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
