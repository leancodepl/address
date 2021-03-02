import '../address_format.dart';
import '../display.dart';
import '../form.dart';

class PlAddressFormat extends AddressFormat {
  @override
  String get country => 'PL';

  @override
  Map<String, List<List<DisplayAddressPiece>>> get displayFormat => {
        'pl': [
          [DisplayAddressPiece(part: DisplayAddressPart.fullName)],
          [DisplayAddressPiece(part: DisplayAddressPart.address1)],
          [DisplayAddressPiece(part: DisplayAddressPart.address2)],
          [
            DisplayAddressPiece(part: DisplayAddressPart.postalCode),
            DisplayAddressPiece(text: ' '),
            DisplayAddressPiece(part: DisplayAddressPart.city),
          ],
        ],
      };

  @override
  List<AddressFormField> get formFormat => [
        AddressFormField.fullName,
        AddressFormField.addressLine1,
        AddressFormField.addressLine2,
        AddressFormField.postalCode,
        AddressFormField.city,
      ];
}
