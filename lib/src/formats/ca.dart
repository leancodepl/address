import '../address_format.dart';
import '../common_labels.dart';
import '../display.dart';
import '../form.dart';

class CaAddressFormat extends AddressFormat {
  @override
  String get country => 'ca';

  @override
  Map<String, List<List<DisplayAddressPiece>>> get displayFormat => {
        'en': [
          [
            DisplayAddressPiece(part: DisplayAddressPart.fullNameUppercase),
          ],
          [
            DisplayAddressPiece(part: DisplayAddressPart.companyUppercase),
          ],
          [
            DisplayAddressPiece(part: DisplayAddressPart.address1Uppercase),
          ],
          [
            DisplayAddressPiece(part: DisplayAddressPart.cityUppercase),
            DisplayAddressPiece(text: ' '),
            DisplayAddressPiece(part: DisplayAddressPart.zone),
            DisplayAddressPiece(text: '  '),
            DisplayAddressPiece(part: DisplayAddressPart.postalCode),
          ],
        ],
        'fr': [
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
            DisplayAddressPiece(part: DisplayAddressPart.city),
            DisplayAddressPiece(text: ' ('),
            DisplayAddressPiece(part: DisplayAddressPart.fullZone),
            DisplayAddressPiece(text: ')  '),
            DisplayAddressPiece(part: DisplayAddressPart.postalCode),
          ],
        ],
      };

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
  Map<FormAddressPart, Map<String, String>> get customFieldLabels => {
        FormAddressPart.postalCode: postalCodeLabel,
        FormAddressPart.zone: provinceLabel,
      };
}
