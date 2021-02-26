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
  List<List<AddressPartField>> get formFormat => [
        [FormAddressPart.fullName.field()],
        [FormAddressPart.company.field()],
        [FormAddressPart.address1.field()],
        [FormAddressPart.postalCode.field(), FormAddressPart.city.field(2)],
      ];
}
