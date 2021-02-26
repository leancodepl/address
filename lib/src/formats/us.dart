import '../address_format.dart';
import '../common_labels.dart';
import '../display.dart';
import '../form.dart';

class UsAddressFormat extends AddressFormat {
  @override
  String get country => 'us';

  @override
  Map<String, List<List<DisplayAddressPiece>>> get displayFormat => {
        'en': [
          [
            DisplayAddressPiece(part: DisplayAddressPart.fullName),
          ],
          [
            DisplayAddressPiece(part: DisplayAddressPart.company),
          ],
          [
            DisplayAddressPiece(part: DisplayAddressPart.address1),
          ],
          [
            DisplayAddressPiece(part: DisplayAddressPart.address2),
          ],
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
  Map<FormAddressPart, Map<String, String>> get customFieldLabels => {
        FormAddressPart.postalCode: zipCodeLabel,
        FormAddressPart.zone: stateLabel,
      };
}