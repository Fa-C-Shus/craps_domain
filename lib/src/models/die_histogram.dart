/*
 * Project: models
 * Created Date: Monday April 17th 2023 7:57:58 pm
 * Author: Fa C Shus (paul@facshus.com)
 * -----
 * Last Modified: Monday, 17th April 2023 7:57:58 pm
 * Modified By: Fa C Shus (paul@facshus.com)
 * -----
 * Copyright (c) 2021 - 2023 FaCShus Systems
 * License: GNU GPL
 */

/// Dta structure that holds a histogram for a die
class DieHistogram {
  /// constructor
  DieHistogram({required List<int> history}) {
    for (final item in history) {
      if (!_map.containsKey(item)) {
        _map[item] = 1;
      } else {
        _map[item] = _map[item]! + 1;
      }
    }
  }
  final Map<int, int> _map = {};

  /// get face frequency by value
  int getFace(int face) {
    return _map[face] ?? 0;
  }

  /// How many 1s were there?
  int get one => getFace(1);

  /// How many 2s were there?
  int get two => getFace(2);

  /// How many 3s were there?
  int get three => getFace(3);

  /// How many 4s were there?
  int get four => getFace(4);

  /// How many 5s were there?
  int get five => getFace(5);

  /// How many 6s were there?
  int get six => getFace(6);

  /// get face frequency percentage by value
  double getFacePercentage(int face) {
    return _map.isEmpty ? 0 : getFace(face) / _numberOfRolls;
  }

  int get _numberOfRolls {
    var retVal = 0;
    _map.forEach((key, value) {
      retVal += value;
    });
    return retVal;
  }
}
