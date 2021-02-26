import '../address_format.dart';
import '../common_labels.dart';
import '../display.dart';
import '../form.dart';

class AuAddressFormat extends AddressFormat {
  @override
  String get country => 'au';

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
            DisplayAddressPiece(part: DisplayAddressPart.cityUppercase),
            DisplayAddressPiece(text: ' '),
            DisplayAddressPiece(part: DisplayAddressPart.zone),
            DisplayAddressPiece(text: ' '),
            DisplayAddressPiece(part: DisplayAddressPart.postalCode),
          ],
        ],
      };

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
  Map<FormAddressPart, Map<String, String>> get customFieldLabels => {
        FormAddressPart.city: {'en': 'Locality'},
        FormAddressPart.zone: stateLabel,
        FormAddressPart.postalCode: postcodeLabel,
      };
}
