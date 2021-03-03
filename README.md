# address

[![Pub Version][pub-badge]][pub-link]
[![GitHub test workflow status][build-badge]][build-link]

Addresses internationalization library.

## Usage

### Formatting address to display

Given you have some address:

```dart
final address = Address(
  fullName: 'Nicole Martin',
  addressLine1: '123 Sherbrooke St',
  city: 'Montreal',
  zone: 'QC',
  postalCode: 'H3G 2A6',
  country: 'CA',
);
```

You can format it to your desired format:

```dart
final englishFormatter = AddressFormatter('en');
print(englishFormatter.formatDisplay(address));

// [
//   'NICOLE MARTIN',
//   '123 SHERBROOKE ST',
//   'MONTREAL QC  H3G 2A6'
// ]

final frenchFormatter = AddressFormatter('fr');
print(frenchFormatter.formatDisplay(address));

// [
//   'Nicole Martin',
//   '123 Sherbrooke St',
//   'Montreal (Québec)  H2G 2A6'
// ]
```

## Address form layout

You can also get localized format of an address form with all obligatory and optional fields along with their labels and descriptions.

```dart
final addressFormatter = AddressFormatter('en');
final formFormat = addressFormatter.formatForm('US');

// formFormat = [
//   // other fields: full name, addressLine1, addressLine2, city
//   AddressFormFieldInformation(
//     label: 'State',
//     obligatory: true,
//     availableValues: {
//       // (...)
//       'TX': 'Texas',
//       // (...)
//     },
//   ),
//   // other fields: zip code
// ]
```

You can use this information to build e.g. a Flutter form. You can see how to do this by looking into the [example][example].

[pub-link]: https://pub.dev/packages/address
[pub-badge]: https://img.shields.io/pub/v/address
[build-link]: https://github.com/leancodepl/address/actions/workflows/test.yml
[build-badge]: https://img.shields.io/github/workflow/status/leancodepl/address/Test
[example]: example
