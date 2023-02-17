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

class ItAddressFormat extends AddressFormat {
  @override
  String get country => 'IT';

  @override
  Map<String, String> get countryName => countryItaly;

  @override
  Map<String, List<List<DisplayAddressPiece>>> get displayFormat => {
        'it': [
          [DisplayAddressPiece(part: DisplayAddressPart.fullName)],
          [DisplayAddressPiece(part: DisplayAddressPart.address2)],
          [DisplayAddressPiece(part: DisplayAddressPart.address1)],
          [
            DisplayAddressPiece(part: DisplayAddressPart.postalCode),
            DisplayAddressPiece(text: ' '),
            DisplayAddressPiece(part: DisplayAddressPart.city),
            DisplayAddressPiece(text: ' '),
            DisplayAddressPiece(part: DisplayAddressPart.zone),
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
        'AG': {'it': 'Agrigento'},
        'AL': {'it': 'Alessandira'},
        'AN': {'it': 'Ancona'},
        'AO': {'it': 'Aosta'},
        'AR': {'it': 'Arezzo'},
        'AP': {'it': 'Ascoli Piceno'},
        'AT': {'it': 'Asti'},
        'AV': {'it': 'Avellino'},
        'BA': {'it': 'Bari'},
        'BT': {'it': 'Barletta-Andria-Trani'},
        'BL': {'it': 'Belluno'},
        'BN': {'it': 'Benevento'},
        'BG': {'it': 'Bargamo'},
        'BI': {'it': 'Biella'},
        'BO': {'it': 'Bologna'},
        'BS': {'it': 'Brescia'},
        'BR': {'it': 'Brindisi'},
        'CA': {'it': 'Cagliari'},
        'CL': {'it': 'Caltanissetta'},
        'CB': {'it': 'Campobasso'},
        'CE': {'it': 'Caserta'},
        'CT': {'it': 'Catania'},
        'CZ': {'it': 'Catanzaro'},
        'CH': {'it': 'Chieti'},
        'CO': {'it': 'Como'},
        'CS': {'it': 'Cosenza'},
        'CR': {'it': 'Cremona'},
        'KR': {'it': 'Crotone'},
        'CN': {'it': 'Cuneo'},
        'EN': {'it': 'Enna'},
        'FM': {'it': 'Fermo'},
        'FE': {'it': 'Ferrara'},
        'FI': {'it': 'Florence'},
        'FG': {'it': 'Foggia'},
        'FC': {'it': 'Forlì-Cesena'},
        'FR': {'it': 'Frosinone'},
        'GE': {'it': 'Genoa'},
        'GO': {'it': 'Gorizia'},
        'GR': {'it': 'Grosseto'},
        'IM': {'it': 'Imperia'},
        'IS': {'it': 'Isernia'},
        'SP': {'it': 'La Spezia'},
        'AQ': {'it': "L'Aquila"},
        'LT': {'it': 'Latina'},
        'LE': {'it': 'Lecce'},
        'LC': {'it': 'Lecco'},
        'LI': {'it': 'Livorno'},
        'LO': {'it': 'Lodi'},
        'LU': {'it': 'Lucca'},
        'MC': {'it': 'Macerata'},
        'MN': {'it': 'Mantua'},
        'MS': {'it': 'Massa-Carrara'},
        'MT': {'it': 'Matera'},
        'ME': {'it': 'Messina'},
        'MI': {'it': 'Milano'},
        'MO': {'it': 'Modena'},
        'MB': {'it': 'Monza e Brianza'},
        'NA': {'it': 'Napoli'},
        'NO': {'it': 'Novara'},
        'NU': {'it': 'Nuoro'},
        'OR': {'it': 'Oristano'},
        'PD': {'it': 'Padova'},
        'PA': {'it': 'Palermo'},
        'PR': {'it': 'Parma'},
        'PV': {'it': 'Pavia'},
        'PG': {'it': 'Perugia'},
        'PU': {'it': 'Pesaro e Urbino'},
        'PE': {'it': 'Pescara'},
        'PC': {'it': 'Piacenza'},
        'PI': {'it': 'Pisa'},
        'PT': {'it': 'Pistoia'},
        'PN': {'it': 'Pordenone'},
        'PZ': {'it': 'Potenza'},
        'PO': {'it': 'Prato'},
        'RG': {'it': 'Ragusa'},
        'RA': {'it': 'Ravenna'},
        'RC': {'it': 'Reggio Calabria'},
        'RE': {'it': 'Reggio Emillia'},
        'RI': {'it': 'Rieti'},
        'RN': {'it': 'Rimini'},
        'RM': {'it': 'Roma'},
        'RO': {'it': 'Rovigo'},
        'SA': {'it': 'Salerno'},
        'SS': {'it': 'Sassari'},
        'SV': {'it': 'Savona'},
        'SI': {'it': 'Siena'},
        'SO': {'it': 'Sondrio'},
        'SU': {'it': 'Sud Sardegna'},
        'BZ': {'it': 'Bolzano'},
        'SR': {'it': 'Siracusa'},
        'TA': {'it': 'Taranto'},
        'TE': {'it': 'Teramo'},
        'TR': {'it': 'Terni'},
        'TP': {'it': 'Trapani'},
        'TN': {'it': 'Trento'},
        'TV': {'it': 'Treviso'},
        'TS': {'it': 'Trieste'},
        'TO': {'it': 'Torino'},
        'UD': {'it': 'Udine'},
        'VA': {'it': 'Varese'},
        'VE': {'it': 'Venezia'},
        'VB': {'it': 'Verbano-Cusio-Ossola'},
        'VC': {'it': 'Vercelli'},
        'VR': {'it': 'Verona'},
        'VV': {'it': 'Vibo Valentia'},
        'VI': {'it': 'Vicenza'},
        'VT': {'it': 'Viterbo'},
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
