import '../address_format.dart';
import '../display.dart';
import '../form.dart';

class PlAddressFormat extends AddressFormat {
  @override
  String get country => 'pl';

  @override
  Map<String, List<List<DisplayAddressPiece>>> get displayFormat => {
        'pl': [
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
            DisplayAddressPiece(part: DisplayAddressPart.postalCode),
            DisplayAddressPiece(text: ' '),
            DisplayAddressPiece(part: DisplayAddressPart.city),
          ],
        ],
      };

  @override
  List<List<AddressFormField>> get formFormat => [
        [AddressFormField.fullName],
        [AddressFormField.company],
        [AddressFormField.address1],
        [AddressFormField.postalCode, AddressFormField.city],
      ];
}
