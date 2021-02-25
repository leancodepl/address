import 'package:address/address.dart';
import 'package:test/test.dart';

void main() {
  test('formats Polish address to display in English', () {
    const address = Address(
      firstName: 'Grzegorz',
      lastName: 'Brzęczyszczykiewicz',
      address1: 'al. Jerozolimskie 13A/2',
      city: 'Warszawa',
      postalCode: '00-111',
      country: 'pl',
    );

    final addressFormatter = AddressFormatter();
    final displayFormatted = addressFormatter.formatDisplay(address);

    expect(
      displayFormatted,
      'Grzegorz Brzęczyszczykiewicz\n'
      'al. Jerozolimskie 13A/2\n'
      '00-111 Warszawa',
    );
  });

  group('formats Canadian address', () {
    const address = Address(
      firstName: 'Nicole',
      lastName: 'Martin',
      address1: '123 Sherbrooke St',
      city: 'Montreal',
      zone: 'QC',
      postalCode: 'H3G 2A6',
      country: 'ca',
    );

    test('to display in English', () {
      final addressFormatter = AddressFormatter('en');
      final displayFormatted = addressFormatter.formatDisplay(address);

      expect(
        displayFormatted,
        'Nicole Martin\n'
        '123 Sherbrooke St\n'
        'Montreal QC  H3G 2A6',
      );
    });

    test('to display in French', () {
      final addressFormatter = AddressFormatter('fr');
      final displayFormatted = addressFormatter.formatDisplay(address);

      expect(
        displayFormatted,
        'Nicole Martin\n'
        '123 Sherbrooke St\n'
        'Montreal (Québec)  H3G 2A6',
      );
    });
  });
}
