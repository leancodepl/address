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

enum DisplayAddressPart {
  fullName,
  fullNameUppercase,

  city,
  cityUppercase,

  postalCode,

  zone,
  fullZone,

  address1,
  address1Uppercase,

  address2,
  address2Uppercase,
}

class DisplayAddressPiece {
  DisplayAddressPiece({this.part, this.text})
      : assert((part != null) != (text != null));

  final DisplayAddressPart? part;
  final String? text;
}
