import '../address_format.dart';
import '../display.dart';

class FrAddressFormat extends AddressFormat {
  @override
  String get country => 'fr';

  @override
  Map<String, List<List<DisplayAddressPiece>>> get displayFormat => {
        'fr': [
          [
            DisplayAddressPiece(part: DisplayAddressPart.company),
          ],
          [
            DisplayAddressPiece(part: DisplayAddressPart.fullName),
          ],
          [
            DisplayAddressPiece(part: DisplayAddressPart.address1),
          ],
          [
            DisplayAddressPiece(part: DisplayAddressPart.postalCode),
            DisplayAddressPiece(text: ' '),
            DisplayAddressPiece(part: DisplayAddressPart.cityUppercase),
          ],
        ],
      };
}
