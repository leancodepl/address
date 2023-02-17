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

import 'package:address/src/address_format.dart';
import 'package:address/src/common_labels.dart';
import 'package:address/src/display.dart';
import 'package:address/src/form.dart';

class AuAddressFormat extends AddressFormat {
  @override
  String get country => 'AU';

  @override
  Map<String, String> get countryName => countryAustralia;

  @override
  Map<String, List<List<DisplayAddressPiece>>> get displayFormat => {
        'en': [
          [DisplayAddressPiece(part: DisplayAddressPart.fullName)],
          [DisplayAddressPiece(part: DisplayAddressPart.address1)],
          [DisplayAddressPiece(part: DisplayAddressPart.address2)],
          [
            DisplayAddressPiece(part: DisplayAddressPart.cityUppercase),
            DisplayAddressPiece(text: ' '),
            DisplayAddressPiece(part: DisplayAddressPart.zone),
            DisplayAddressPiece(text: ' '),
            DisplayAddressPiece(part: DisplayAddressPart.postalCode),
          ],
        ],
      };

  @override
  bool get displayCountryUppercase => true;

  @override
  List<AddressFormField> get formFormat => [
        AddressFormField.fullName,
        AddressFormField.addressLine1,
        AddressFormField.addressLine2,
        AddressFormField.postalCode,
        AddressFormField.city,
        AddressFormField.zone,
      ];

  @override
  bool get isZoneObligatory => true;

  @override
  Map<String, Map<String, String>> get zoneNames => {
        'NSW': {'en': 'New South Wales'},
        'QLD': {'en': 'Queensland'},
        'SA': {'en': 'South Australia'},
        'TAS': {'en': 'Tasmania'},
        'VIC': {'en': 'Victoria'},
        'WA': {'en': 'Western Australia'},
        'ACT': {'en': 'Australian Capital Territory'},
        'NT': {'en': 'Northern Territory'},
      };

  @override
  Map<AddressFormField, Map<String, String>> get customFieldLabels => {
        AddressFormField.city: {'en': 'Suburb'},
        AddressFormField.zone: {'en': 'State/Territory'},
        AddressFormField.postalCode: postcodeLabel,
      };

  @override
  Map<AddressFormField, Map<String, String>> get fieldDescriptions => {
        AddressFormField.addressLine1: streetAddressPoBoxCoDescription,
        AddressFormField.addressLine2: apartmentSuiteEtcDescription,
      };
}
