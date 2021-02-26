import 'formats/au.dart';
import 'formats/ca.dart';
import 'formats/es.dart';
import 'formats/fr.dart';
import 'formats/it.dart';
import 'formats/pl.dart';
import 'formats/us.dart';

final addressFormats = {
  'au': AuAddressFormat(),
  'ca': CaAddressFormat(),
  'es': EsAddressFormat(),
  'fr': FrAddressFormat(),
  'it': ItAddressFormat(),
  'pl': PlAddressFormat(),
  'us': UsAddressFormat(),
};
