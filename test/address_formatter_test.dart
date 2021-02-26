import 'package:address/address.dart';
import 'package:address/src/form.dart';
import 'package:test/test.dart';

void main() {
  group('format display', () {
    test('Polish address to display in English', () {
      const address = Address(
        fullName: 'Grzegorz Brzęczyszczykiewicz',
        address1: 'al. Jerozolimskie 13A/2',
        city: 'Warszawa',
        postalCode: '00-111',
        country: 'PL',
      );

      const addressFormatter = AddressFormatter();
      final displayFormatted = addressFormatter.formatDisplay(address);

      expect(displayFormatted, [
        'Grzegorz Brzęczyszczykiewicz',
        'al. Jerozolimskie 13A/2',
        '00-111 Warszawa',
      ]);
    });

    group('Canadian address', () {
      const address = Address(
        fullName: 'Nicole Martin',
        address1: '123 Sherbrooke St',
        city: 'Montreal',
        zone: 'QC',
        postalCode: 'H3G 2A6',
        country: 'CA',
      );

      test('to display in English', () {
        const addressFormatter = AddressFormatter();
        final displayFormatted = addressFormatter.formatDisplay(address);

        expect(displayFormatted, [
          'NICOLE MARTIN',
          '123 SHERBROOKE ST',
          'MONTREAL QC  H3G 2A6',
        ]);
      });

      test('to display in French', () {
        const addressFormatter = AddressFormatter('fr');
        final displayFormatted = addressFormatter.formatDisplay(address);

        expect(displayFormatted, [
          'Nicole Martin',
          '123 Sherbrooke St',
          'Montreal (Québec)  H3G 2A6',
        ]);
      });
    });

    test('Spanish address to display in English', () {
      const address = Address(
        fullName: 'Sr. Francisco Ansó García',
        address1: 'Paseo de la Castellana, 185, 5ºB',
        city: 'Madrid',
        postalCode: '29001',
        zone: 'M',
        country: 'ES',
      );

      const addressFormatter = AddressFormatter();
      final displayFormatted = addressFormatter.formatDisplay(address);

      expect(displayFormatted, [
        'Sr. Francisco Ansó García',
        'Paseo de la Castellana, 185, 5ºB',
        '29001 Madrid',
        'Madrid',
      ]);
    });
  });

  group('format form', () {
    group('with Polish address', () {
      const country = 'PL';

      test('in Polish', () {
        const addressFormatter = AddressFormatter('pl');

        final formFormat = addressFormatter.formatForm(country);

        expect(
          formFormat,
          equals([
            isA<AddressFormFieldInformation>()
                .having((i) => i.language, 'language', 'pl')
                .having((i) => i.type, 'type', AddressFormField.fullName)
                .having((i) => i.label, 'label', 'Imię i nazwisko i/lub firma')
                .having((i) => i.description, 'description', isNull)
                .having((i) => i.obligatory, 'obligatory', isTrue)
                .having((i) => i.availableValues, 'availableValues', isNull),
            isA<AddressFormFieldInformation>()
                .having((i) => i.language, 'language', 'pl')
                .having((i) => i.type, 'type', AddressFormField.address1)
                .having((i) => i.label, 'label', '1 linia adresu')
                .having((i) => i.description, 'description', isNull)
                .having((i) => i.obligatory, 'obligatory', isTrue)
                .having((i) => i.availableValues, 'availableValues', isNull),
            isA<AddressFormFieldInformation>()
                .having((i) => i.language, 'language', 'pl')
                .having((i) => i.type, 'type', AddressFormField.address2)
                .having((i) => i.label, 'label', '2 linia adresu')
                .having((i) => i.description, 'description', isNull)
                .having((i) => i.obligatory, 'obligatory', isFalse)
                .having((i) => i.availableValues, 'availableValues', isNull),
            isA<AddressFormFieldInformation>()
                .having((i) => i.language, 'language', 'pl')
                .having((i) => i.type, 'type', AddressFormField.postalCode)
                .having((i) => i.label, 'label', 'Kod pocztowy')
                .having((i) => i.description, 'description', isNull)
                .having((i) => i.obligatory, 'obligatory', isTrue)
                .having((i) => i.availableValues, 'availableValues', isNull),
            isA<AddressFormFieldInformation>()
                .having((i) => i.language, 'language', 'pl')
                .having((i) => i.type, 'type', AddressFormField.city)
                .having((i) => i.label, 'label', 'Miasto')
                .having((i) => i.description, 'description', isNull)
                .having((i) => i.obligatory, 'obligatory', isTrue)
                .having((i) => i.availableValues, 'availableValues', isNull),
          ]),
        );
      });

      test('in English', () {
        const addressFormatter = AddressFormatter();

        final formFormat = addressFormatter.formatForm(country);

        expect(
          formFormat,
          equals([
            isA<AddressFormFieldInformation>()
                .having((i) => i.language, 'language', 'en')
                .having((i) => i.type, 'type', AddressFormField.fullName)
                .having((i) => i.label, 'label', 'Full name and/or company')
                .having((i) => i.description, 'description', isNull),
            isA<AddressFormFieldInformation>()
                .having((i) => i.language, 'language', 'en')
                .having((i) => i.type, 'type', AddressFormField.address1)
                .having((i) => i.label, 'label', 'Address line 1')
                .having((i) => i.description, 'description', isNull),
            isA<AddressFormFieldInformation>()
                .having((i) => i.language, 'language', 'en')
                .having((i) => i.type, 'type', AddressFormField.address2)
                .having((i) => i.label, 'label', 'Address line 2')
                .having((i) => i.description, 'description', isNull),
            isA<AddressFormFieldInformation>()
                .having((i) => i.language, 'language', 'en')
                .having((i) => i.type, 'type', AddressFormField.postalCode)
                .having((i) => i.label, 'label', 'Postal code')
                .having((i) => i.description, 'description', isNull),
            isA<AddressFormFieldInformation>()
                .having((i) => i.language, 'language', 'en')
                .having((i) => i.type, 'type', AddressFormField.city)
                .having((i) => i.label, 'label', 'City')
                .having((i) => i.description, 'description', isNull),
          ]),
        );
      });
    });

    test('with United States address in English', () {
      const addressFormatter = AddressFormatter();

      final formFormat = addressFormatter.formatForm('US');

      expect(
        formFormat,
        equals([
          isA<AddressFormFieldInformation>()
              .having((i) => i.language, 'language', 'en')
              .having((i) => i.type, 'type', AddressFormField.fullName)
              .having((i) => i.label, 'label', 'Full name and/or company')
              .having((i) => i.description, 'description', isNull)
              .having((i) => i.obligatory, 'obligatory', isTrue)
              .having((i) => i.availableValues, 'availableValues', isNull),
          isA<AddressFormFieldInformation>()
              .having((i) => i.language, 'language', 'en')
              .having((i) => i.type, 'type', AddressFormField.address1)
              .having((i) => i.label, 'label', 'Address line 1')
              .having(
                (i) => i.description,
                'description',
                'Street address, P.O. box, c/o',
              )
              .having((i) => i.obligatory, 'obligatory', isTrue)
              .having((i) => i.availableValues, 'availableValues', isNull),
          isA<AddressFormFieldInformation>()
              .having((i) => i.language, 'language', 'en')
              .having((i) => i.type, 'type', AddressFormField.address2)
              .having((i) => i.label, 'label', 'Address line 2')
              .having(
                (i) => i.description,
                'description',
                'Apartment, suite, unit, building, floor, etc.',
              )
              .having((i) => i.obligatory, 'obligatory', isFalse)
              .having((i) => i.availableValues, 'availableValues', isNull),
          isA<AddressFormFieldInformation>()
              .having((i) => i.language, 'language', 'en')
              .having((i) => i.type, 'type', AddressFormField.city)
              .having((i) => i.label, 'label', 'City')
              .having((i) => i.description, 'description', isNull)
              .having((i) => i.obligatory, 'obligatory', isTrue)
              .having((i) => i.availableValues, 'availableValues', isNull),
          isA<AddressFormFieldInformation>()
              .having((i) => i.language, 'language', 'en')
              .having((i) => i.type, 'type', AddressFormField.zone)
              .having((i) => i.label, 'label', 'State')
              .having((i) => i.description, 'description', isNull)
              .having((i) => i.obligatory, 'obligatory', isTrue)
              .having(
                (i) => i.availableValues,
                'availableValues',
                containsPair('TX', 'Texas'),
              ),
          isA<AddressFormFieldInformation>()
              .having((i) => i.language, 'language', 'en')
              .having((i) => i.type, 'type', AddressFormField.postalCode)
              .having((i) => i.label, 'label', 'ZIP code')
              .having((i) => i.description, 'description', isNull)
              .having((i) => i.obligatory, 'obligatory', isTrue)
              .having((i) => i.availableValues, 'availableValues', isNull),
        ]),
      );
    });
  });
}
