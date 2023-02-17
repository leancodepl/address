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

import 'package:address/src/formats/au.dart';
import 'package:address/src/formats/ca.dart';
import 'package:address/src/formats/es.dart';
import 'package:address/src/formats/fr.dart';
import 'package:address/src/formats/it.dart';
import 'package:address/src/formats/pl.dart';
import 'package:address/src/formats/unknown.dart';
import 'package:address/src/formats/us.dart';

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
