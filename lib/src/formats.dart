import 'formats/au.dart';
import 'formats/ca.dart';
import 'formats/es.dart';
import 'formats/fr.dart';
import 'formats/it.dart';
import 'formats/pl.dart';
import 'formats/unknown.dart';
import 'formats/us.dart';

final addressFormats = {
  'AU': AuAddressFormat(),
  'CA': CaAddressFormat(),
  'ES': EsAddressFormat(),
  'FR': FrAddressFormat(),
  'IT': ItAddressFormat(),
  'PL': PlAddressFormat(),
  'US': UsAddressFormat(),
  'XX': UnknownAddressFormat(),
};
