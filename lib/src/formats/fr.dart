import '../address_format.dart';
import '../display.dart';
import '../form.dart';

class FrAddressFormat extends AddressFormat {
  @override
  String get country => 'fr';

  @override
  Map<String, List<List<DisplayAddressPiece>>> get displayFormat => {
        'fr': [
          [DisplayAddressPiece(part: DisplayAddressPart.fullName)],
          [DisplayAddressPiece(part: DisplayAddressPart.address1)],
          [DisplayAddressPiece(part: DisplayAddressPart.address2)],
          [
            DisplayAddressPiece(part: DisplayAddressPart.postalCode),
            DisplayAddressPiece(text: ' '),
            DisplayAddressPiece(part: DisplayAddressPart.cityUppercase),
          ],
        ],
      };

  @override
  List<List<AddressFormField>> get formFormat => [
        [AddressFormField.fullName],
        [AddressFormField.address1],
        [AddressFormField.address2],
        [AddressFormField.city],
        [AddressFormField.postalCode],
      ];
}
