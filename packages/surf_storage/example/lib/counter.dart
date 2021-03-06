// Copyright (c) 2019-present,  SurfStudio LLC
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

class Counter {
  const Counter([this.value = 0]);

  // ignore: prefer_constructors_over_static_methods
  static Counter fromJson(Map<String, dynamic> json) {
    final counterValue = json[_key] as int;
    return Counter(counterValue);
  }

  static const _key = 'counterValue';

  final int value;

  Map<String, dynamic> toJson() => <String, Object>{_key: value};

  Counter getIncremented() => Counter(value + 1);
}
