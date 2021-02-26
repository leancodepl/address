import 'package:address/address.dart';
import 'package:test/test.dart';

void main() {
  test('formats Polish address to display in English', () {
    const address = Address(
      fullName: 'Grzegorz Brzęczyszczykiewicz',
      address1: 'al. Jerozolimskie 13A/2',
      city: 'Warszawa',
      postalCode: '00-111',
      country: 'pl',
    );

    const addressFormatter = AddressFormatter();
    final displayFormatted = addressFormatter.formatDisplay(address);

    expect(displayFormatted, [
      'Grzegorz Brzęczyszczykiewicz',
      'al. Jerozolimskie 13A/2',
      '00-111 Warszawa',
    ]);
  });

  group('formats Canadian address', () {
    const address = Address(
      fullName: 'Nicole Martin',
      address1: '123 Sherbrooke St',
      city: 'Montreal',
      zone: 'QC',
      postalCode: 'H3G 2A6',
      country: 'ca',
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

  test('formats Spanish address to display in English', () {
    const address = Address(
      fullName: 'Sr. Francisco Ansó García',
      address1: 'Paseo de la Castellana, 185, 5ºB',
      city: 'Madrid',
      postalCode: '29001',
      zone: 'M',
      country: 'es',
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
}
