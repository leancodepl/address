import '../address_format.dart';
import '../common_labels.dart';
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

  @override
  Map<AddressFormField, Map<String, String>> get fieldDescriptions => {
        AddressFormField.address1: streetAddressPoBoxCompanyNameDescription,
        AddressFormField.address2: apartmentSuiteEtcDescription,
      };
}
