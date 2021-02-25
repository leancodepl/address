import 'package:address/src/country_addresses.dart';

import 'address.dart';
import 'country_address.dart';

class AddressFormatter {
  const AddressFormatter([this._language = 'en']);

  static const _defaultCountryAddress = 'us';

  final String _language;

  String formatDisplay(Address address) {
    final countryAddress = countryAddresses[address.country] ??
        countryAddresses[_defaultCountryAddress]!;

    final displayFormat = countryAddress.displayFormat[_language] ??
        countryAddress.displayFormat[countryAddress.displayFormat.keys.first]!;

    final buffer = StringBuffer();
    for (final line in displayFormat) {
      final lineBuffer = StringBuffer();

      for (final part in line) {
        if (part is String) {
          lineBuffer.write(part);
        } else if (part is DisplayAddressPart) {
          lineBuffer
              .write(_mapAddressPart(countryAddress, address, part) ?? '');
        }
      }

      if (lineBuffer.isNotEmpty) {
        buffer.writeln(lineBuffer);
      }
    }

    return buffer.toString().trimRight();
  }

  String? _mapAddressPart(
    CountryAddress countryAddress,
    Address address,
    DisplayAddressPart part,
  ) {
    switch (part) {
      case DisplayAddressPart.firstName:
        return address.firstName;
      case DisplayAddressPart.lastName:
        return address.lastName;
      case DisplayAddressPart.company:
        return address.company;
      case DisplayAddressPart.city:
        return address.city;
      case DisplayAddressPart.postalCode:
        return address.postalCode;
      case DisplayAddressPart.zone:
        return address.zone;
      case DisplayAddressPart.fullZone:
        return _fullZoneName(countryAddress, address);
      case DisplayAddressPart.address1:
        return address.address1;
      case DisplayAddressPart.address2:
        return address.address2;
      case DisplayAddressPart.phone:
        return address.phone;
      default:
        return null;
    }
  }

  String? _fullZoneName(CountryAddress countryAddress, Address address) {
    final names = countryAddress.zoneNames[address.zone];
    if (names == null) {
      return address.zone;
    }

    return names[_language] ?? names[names.keys.first];
  }
}
