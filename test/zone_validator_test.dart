import 'package:address/src/formats.dart';
import 'package:address/src/formats/unknown.dart';
import 'package:address/src/zone_validator.dart';
import 'package:test/test.dart';

void main() {
  group('ZoneValidator', () {
    group('when there is no zone in the form', () {
      const country = 'PL';

      test('and the zone is null, it passes', () {
        expect(ZoneValidator.valid(country, null), isTrue);
      });

      test('and the zone is empty, it fails', () {
        expect(ZoneValidator.valid(country, ''), isFalse);
      });

      test('and the zone has some value, it fails', () {
        expect(ZoneValidator.valid(country, 'TEST'), isFalse);
      });
    });

    group('when zone is optional and there is no list of values', () {
      const country = 'XX';

      test('and the zone is null, it passes', () {
        expect(ZoneValidator.valid(country, null), isTrue);
      });

      test('and the zone is empty, it passes', () {
        expect(ZoneValidator.valid(country, ''), isTrue);
      });

      test('and the zone is not empty, it passes', () {
        expect(ZoneValidator.valid(country, 'TEST'), isTrue);
      });
    });

    group('when zone is optional and there is a list of values', () {
      addressFormats['XA'] = _ZoneOptionalWithList();
      const country = 'XA';

      test('and the zone is null, it passes', () {
        expect(ZoneValidator.valid(country, null), isTrue);
      });

      test('and the zone is empty, it passes', () {
        expect(ZoneValidator.valid(country, ''), isTrue);
      });

      test('and the zone is not on the list, it fails', () {
        expect(ZoneValidator.valid(country, 'TEST'), isFalse);
      });

      test('and the zone is on the list, it passes', () {
        expect(ZoneValidator.valid(country, 'A'), isTrue);
      });
    });

    group('when zone is obligatory and there is no list of values', () {
      addressFormats['XB'] = _ZoneObligatoryWithoutList();
      const country = 'XB';

      test('and the zone is null, it fails', () {
        expect(ZoneValidator.valid(country, null), isFalse);
      });

      test('and the zone is empty, it fails', () {
        expect(ZoneValidator.valid(country, ''), isFalse);
      });

      test('and the zone is not empty, it passes', () {
        expect(ZoneValidator.valid(country, 'TEST'), isTrue);
      });
    });

    group('when zone is obligatory and there is a list of values', () {
      const country = 'US';

      test('and the zone is null, it fails', () {
        expect(ZoneValidator.valid(country, null), isFalse);
      });

      test('and the zone is empty, it fails', () {
        expect(ZoneValidator.valid(country, ''), isFalse);
      });

      test('and the zone is not on the list, it fails', () {
        expect(ZoneValidator.valid(country, 'TEST'), isFalse);
      });

      test('and the zone is on the list, it passes', () {
        expect(ZoneValidator.valid(country, 'TX'), isTrue);
      });
    });
  });
}

class _ZoneOptionalWithList extends UnknownAddressFormat {
  @override
  String get country => 'XA';

  @override
  Map<String, Map<String, String>> get zoneNames => {
        'A': {'en': 'This is test'},
      };
}

class _ZoneObligatoryWithoutList extends UnknownAddressFormat {
  @override
  String get country => 'XB';

  @override
  bool get isZoneObligatory => true;
}
