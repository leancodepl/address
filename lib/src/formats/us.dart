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

class UsAddressFormat extends AddressFormat {
  @override
  String get country => 'US';

  @override
  Map<String, String> get countryName => countryUnitedStates;

  @override
  Map<String, List<List<DisplayAddressPiece>>> get displayFormat => {
        'en': [
          [DisplayAddressPiece(part: DisplayAddressPart.fullName)],
          [DisplayAddressPiece(part: DisplayAddressPart.address1)],
          [DisplayAddressPiece(part: DisplayAddressPart.address2)],
          [
            DisplayAddressPiece(part: DisplayAddressPart.city),
            DisplayAddressPiece(text: ', '),
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
        AddressFormField.city,
        AddressFormField.zone,
        AddressFormField.postalCode,
      ];

  @override
  bool get isZoneObligatory => true;

  @override
  Map<String, Map<String, String>> get zoneNames => {
        'AL': {'en': 'Alabama'},
        'AK': {'en': 'Alaska'},
        'AZ': {'en': 'Arizona'},
        'AR': {'en': 'Arkansas'},
        'CA': {'en': 'California'},
        'CO': {'en': 'Colorado'},
        'CT': {'en': 'Connecticut'},
        'DE': {'en': 'Delaware'},
        'FL': {'en': 'Florida'},
        'GA': {'en': 'Georgia'},
        'HI': {'en': 'Hawaii'},
        'ID': {'en': 'Idaho'},
        'IL': {'en': 'Illinois'},
        'IN': {'en': 'Indiana'},
        'IA': {'en': 'Iowa'},
        'KS': {'en': 'Kansas'},
        'KY': {'en': 'Kentucky'},
        'LA': {'en': 'Louisiana'},
        'ME': {'en': 'Maine'},
        'MD': {'en': 'Maryland'},
        'MA': {'en': 'Massachusetts'},
        'MI': {'en': 'Michigan'},
        'MN': {'en': 'Minnesota'},
        'MS': {'en': 'Mississippi'},
        'MO': {'en': 'Missouri'},
        'MT': {'en': 'Montana'},
        'NE': {'en': 'Nebraska'},
        'NV': {'en': 'Nevada'},
        'NH': {'en': 'New Hampshire'},
        'NJ': {'en': 'New Jersey'},
        'NM': {'en': 'New Mexico'},
        'NY': {'en': 'New York'},
        'NC': {'en': 'North Carolina'},
        'ND': {'en': 'North Dakota'},
        'OH': {'en': 'Ohio'},
        'OK': {'en': 'Oklahoma'},
        'OR': {'en': 'Oregon'},
        'PA': {'en': 'Pennsylvania'},
        'RI': {'en': 'Rhode Island'},
        'SC': {'en': 'South Carolina'},
        'SD': {'en': 'South Dakota'},
        'TN': {'en': 'Tennessee'},
        'TX': {'en': 'Texas'},
        'UT': {'en': 'Utah'},
        'VT': {'en': 'Vermont'},
        'VA': {'en': 'Virginia'},
        'WA': {'en': 'Washington'},
        'WV': {'en': 'West Virginia'},
        'WI': {'en': 'Wisconsin'},
        'WY': {'en': 'Wyoming'},
        'DC': {'en': 'District of Columbia'},
      };

  @override
  Map<AddressFormField, Map<String, String>> get customFieldLabels => {
        AddressFormField.postalCode: zipCodeLabel,
        AddressFormField.zone: stateLabel,
      };

  @override
  Map<AddressFormField, Map<String, String>> get fieldDescriptions => {
        AddressFormField.addressLine1: streetAddressPoBoxCoDescription,
        AddressFormField.addressLine2: apartmentSuiteEtcDescription,
      };
}
