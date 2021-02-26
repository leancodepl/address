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
  List<List<AddressFormField>> get formFormat => [
        [AddressFormField.fullName],
        [AddressFormField.address1],
        [AddressFormField.address2],
        [AddressFormField.postalCode],
        [AddressFormField.city],
        [AddressFormField.zone],
      ];

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
}
