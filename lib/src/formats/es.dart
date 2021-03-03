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

import 'package:address/src/form.dart';

import '../address_format.dart';
import '../common_labels.dart';
import '../display.dart';

class EsAddressFormat extends AddressFormat {
  @override
  String get country => 'ES';

  @override
  Map<String, String> get countryName => countrySpain;

  @override
  Map<String, List<List<DisplayAddressPiece>>> get displayFormat => {
        'es': [
          [DisplayAddressPiece(part: DisplayAddressPart.fullName)],
          [DisplayAddressPiece(part: DisplayAddressPart.address1)],
          [DisplayAddressPiece(part: DisplayAddressPart.address2)],
          [
            DisplayAddressPiece(part: DisplayAddressPart.postalCode),
            DisplayAddressPiece(text: ' '),
            DisplayAddressPiece(part: DisplayAddressPart.city),
          ],
          [DisplayAddressPiece(part: DisplayAddressPart.fullZone)],
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
        'C': {'es': 'A Coruña'},
        'VI': {'es': 'Álava'},
        'AB': {'es': 'Albacete'},
        'A': {'es': 'Alicante'},
        'AL': {'es': 'Almería'},
        'O': {'es': 'Asturias'},
        'AV': {'es': 'Ávila'},
        'BA': {'es': 'Badajoz'},
        'B': {'es': 'Barcelona'},
        'BI': {'es': 'Bizkaia'},
        'BU': {'es': 'Burgos'},
        'CC': {'es': 'Cáceres'},
        'CA': {'es': 'Cádiz'},
        'S': {'es': 'Cantabria'},
        'CS': {'es': 'Castellón'},
        'CR': {'es': 'Ciudad Real'},
        'CO': {'es': 'Córdoba'},
        'CU': {'es': 'Cuenca'},
        'SS': {'es': 'Gipuzkoa'},
        'GI': {'es': 'Girona'},
        'GR': {'es': 'Granada'},
        'GU': {'es': 'Guadalajara'},
        'H': {'es': 'Huelva'},
        'HU': {'es': 'Huesca'},
        'PM': {'es': 'Illes Balears'},
        'J': {'es': 'Jaén'},
        'LO': {'es': 'La Rioja'},
        'GC': {'es': 'Las Palmas'},
        'LE': {'es': 'León'},
        'L': {'es': 'Lleida'},
        'LU': {'es': 'Lugo'},
        'M': {'es': 'Madrid'},
        'MA': {'es': 'Málaga'},
        'MU': {'es': 'Murcia'},
        'NA': {'es': 'Navarra'},
        'OR': {'es': 'Ourense'},
        'P': {'es': 'Palencia'},
        'PO': {'es': 'Pontevedra'},
        'SA': {'es': 'Salamanca'},
        'TF': {'es': 'Santa Crus de Tenerife'},
        'SG': {'es': 'Segovia'},
        'SE': {'es': 'Sevilla'},
        'SO': {'es': 'Soria'},
        'T': {'es': 'Tarragona'},
        'TE': {'es': 'Teruel'},
        'TO': {'es': 'Toledo'},
        'V': {'es': 'Valencia'},
        'VA': {'es': 'Valladolid'},
        'ZA': {'es': 'Zamora'},
        'Z': {'es': 'Zaragoza'},
      };

  @override
  Map<AddressFormField, Map<String, String>> get customFieldLabels => {
        AddressFormField.zone: provinceLabel,
      };

  @override
  Map<AddressFormField, Map<String, String>> get fieldDescriptions => {
        AddressFormField.addressLine1: streetAddressPoBoxCoDescription,
        AddressFormField.addressLine2: apartmentSuiteEtcDescription,
      };
}
