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

import '../address_format.dart';
import '../common_labels.dart';
import '../display.dart';
import '../form.dart';

class CaAddressFormat extends AddressFormat {
  @override
  String get country => 'CA';

  @override
  Map<String, List<List<DisplayAddressPiece>>> get displayFormat => {
        'en': [
          [DisplayAddressPiece(part: DisplayAddressPart.fullNameUppercase)],
          [DisplayAddressPiece(part: DisplayAddressPart.address1Uppercase)],
          [DisplayAddressPiece(part: DisplayAddressPart.address2Uppercase)],
          [
            DisplayAddressPiece(part: DisplayAddressPart.cityUppercase),
            DisplayAddressPiece(text: ' '),
            DisplayAddressPiece(part: DisplayAddressPart.zone),
            DisplayAddressPiece(text: '  '),
            DisplayAddressPiece(part: DisplayAddressPart.postalCode),
          ],
        ],
        'fr': [
          [DisplayAddressPiece(part: DisplayAddressPart.fullName)],
          [DisplayAddressPiece(part: DisplayAddressPart.address1)],
          [DisplayAddressPiece(part: DisplayAddressPart.address2)],
          [
            DisplayAddressPiece(part: DisplayAddressPart.city),
            DisplayAddressPiece(text: ' ('),
            DisplayAddressPiece(part: DisplayAddressPart.fullZone),
            DisplayAddressPiece(text: ')  '),
            DisplayAddressPiece(part: DisplayAddressPart.postalCode),
          ],
        ],
      };

  @override
  List<AddressFormField> get formFormat => [
        AddressFormField.fullName,
        AddressFormField.addressLine1,
        AddressFormField.addressLine2,
        AddressFormField.city,
        AddressFormField.zone,
        AddressFormField.postalCode,
      ];

  @override
  bool get isZoneObligatory => true;

  @override
  Map<String, Map<String, String>> get zoneNames => {
        'AB': {
          'en': 'Alberta',
          'fr': 'Alberta',
        },
        'BC': {
          'en': 'British Columbia',
          'fr': 'Colombie-Britannique',
        },
        'MB': {
          'en': 'Manitoba',
          'fr': 'Manitoba',
        },
        'NB': {
          'en': 'New Brunswick',
          'fr': 'Nouveau-Brunswick',
        },
        'NL': {
          'en': 'Newfoundland and Labrador',
          'fr': 'Terre-Neuve-et-Labrador',
        },
        'NS': {
          'en': 'Nova Scotia',
          'fr': 'Nouvelle-Écosse',
        },
        'ON': {
          'en': 'Ontario',
          'fr': 'Ontario',
        },
        'PE': {
          'en': 'Prince Edward Island',
          'fr': 'Île-du-Prince-Édouard',
        },
        'QC': {
          'en': 'Quebec',
          'fr': 'Québec',
        },
        'SK': {
          'en': 'Saskatchewan',
          'fr': 'Saskatchewan',
        },
        'NT': {
          'en': 'Northwest Territories',
          'fr': 'Territoires du Nord-Ouest',
        },
        'NU': {
          'en': 'Nunavut',
          'fr': 'Nunavut',
        },
        'YT': {
          'en': 'Yukon',
          'fr': 'Yukon',
        },
      };

  @override
  Map<AddressFormField, Map<String, String>> get customFieldLabels => {
        AddressFormField.postalCode: postalCodeLabel,
        AddressFormField.zone: provinceLabel,
      };

  @override
  Map<AddressFormField, Map<String, String>> get fieldDescriptions => {
        AddressFormField.addressLine1: streetAddressPoBoxCoDescription,
        AddressFormField.addressLine2: apartmentSuiteEtcDescription,
      };
}
