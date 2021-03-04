// Copyright 2021 LeanCode Sp. z o.o.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

import 'package:address/src/form.dart';
import 'package:address/src/formats.dart';

import 'address.dart';
import 'address_format.dart';
import 'display.dart';

class AddressFormatter {
  /// `_language` is an ISO 639-1 language code.
  const AddressFormatter([this._language = 'en']);

  static const _defaultAddressCountry = 'XX';
  static final _defaultAddressFormat = addressFormats[_defaultAddressCountry]!;

  final String _language;

  /// Format [Address] to the correct format for its country for display
  /// purposes.
  List<String> formatDisplay(Address address, {bool includeCountry = true}) {
    final addressFormat = _getAddressFormat(address.country);

    final displayFormat = addressFormat.displayFormat[_language] ??
        addressFormat.displayFormat[addressFormat.displayFormat.keys.first]!;

    final lines = <String>[];
    for (final line in displayFormat) {
      final lineBuffer = StringBuffer();

      for (final part in line) {
        if (part.text != null) {
          lineBuffer.write(part.text);
        } else {
          lineBuffer.write(_mapAddressPart(address, part.part!) ?? '');
        }
      }

      if (lineBuffer.isNotEmpty) {
        lines.add(lineBuffer.toString());
      }
    }

    if (includeCountry) {
      final countryNames = addressFormat.countryName;
      final countryName =
          countryNames[_language] ?? countryNames[countryNames.keys.first]!;

      if (addressFormat.displayCountryUppercase) {
        lines.add(countryName.toUpperCase());
      } else {
        lines.add(countryName);
      }
    }

    return lines;
  }

  /// Returns a 2D list of form fields
  ///
  /// `country` is an ISO 3166-1 alpha-2 country code.
  List<AddressFormFieldInformation> formatForm(String country) {
    final fields = <AddressFormFieldInformation>[];

    final addressFormat = _getAddressFormat(country);
    for (final field in addressFormat.formFormat) {
      final labels = addressFormat.fieldLabels[field]!;
      final label = labels[_language] ?? labels[labels.keys.first]!;

      final descriptions = addressFormat.fieldDescriptions[field];
      final description =
          descriptions?[_language] ?? descriptions?[descriptions.keys.first];

      Map<String, String>? availableValues;
      if (field == AddressFormField.zone &&
          addressFormat.zoneNames.isNotEmpty) {
        availableValues = addressFormat.zoneNames.map((zoneCode, names) {
          final zoneName = names[_language] ?? names[names.keys.first]!;

          return MapEntry(zoneCode, zoneName);
        });
      }

      fields.add(AddressFormFieldInformation(
        _language,
        field,
        label: label,
        description: description,
        obligatory: addressFormat.obligatoryFormFields.contains(field),
        availableValues: availableValues,
      ));
    }

    return fields;
  }

  AddressFormat _getAddressFormat(String country) =>
      addressFormats[country] ?? _defaultAddressFormat;

  String? _mapAddressPart(Address address, DisplayAddressPart part) {
    switch (part) {
      case DisplayAddressPart.fullName:
        return address.fullName;
      case DisplayAddressPart.fullNameUppercase:
        return address.fullName?.toUpperCase();
      case DisplayAddressPart.city:
        return address.city;
      case DisplayAddressPart.cityUppercase:
        return address.city?.toUpperCase();
      case DisplayAddressPart.postalCode:
        return address.postalCode;
      case DisplayAddressPart.zone:
        return address.zone;
      case DisplayAddressPart.fullZone:
        return _fullZoneName(address);
      case DisplayAddressPart.address1:
        return address.addressLine1;
      case DisplayAddressPart.address1Uppercase:
        return address.addressLine1?.toUpperCase();
      case DisplayAddressPart.address2:
        return address.addressLine2;
      case DisplayAddressPart.address2Uppercase:
        return address.addressLine2?.toUpperCase();
      default:
        return null;
    }
  }

  String? _fullZoneName(Address address) {
    final addressFormat = _getAddressFormat(address.country);
    final names = addressFormat.zoneNames[address.zone];
    if (names == null) {
      return address.zone;
    }

    return names[_language] ?? names[names.keys.first];
  }
}
