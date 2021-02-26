import '../address_format.dart';
import '../common_labels.dart';
import '../display.dart';
import '../form.dart';

class UnknownAddressFormat extends AddressFormat {
  @override
  String get country => 'XX';

  @override
  Map<String, List<List<DisplayAddressPiece>>> get displayFormat => {
        'en': [
          [DisplayAddressPiece(part: DisplayAddressPart.fullName)],
          [DisplayAddressPiece(part: DisplayAddressPart.address1)],
          [DisplayAddressPiece(part: DisplayAddressPart.address2)],
          [
            DisplayAddressPiece(part: DisplayAddressPart.city),
            DisplayAddressPiece(text: ' '),
            DisplayAddressPiece(part: DisplayAddressPart.postalCode),
          ],
          [DisplayAddressPiece(part: DisplayAddressPart.zone)],
        ],
      };

  @override
  List<AddressFormField> get formFormat => [
        AddressFormField.fullName,
        AddressFormField.address1,
        AddressFormField.address2,
        AddressFormField.city,
        AddressFormField.postalCode,
        AddressFormField.zone,
      ];

  @override
  Map<AddressFormField, Map<String, String>> get customFieldLabels => {
        AddressFormField.postalCode: postalCodeLabel,
        AddressFormField.zone: regionLabel,
      };

  @override
  Map<AddressFormField, Map<String, String>> get fieldDescriptions => {
        AddressFormField.address1: streetAddressPoBoxCoDescription,
        AddressFormField.address2: apartmentSuiteEtcDescription,
      };
}
