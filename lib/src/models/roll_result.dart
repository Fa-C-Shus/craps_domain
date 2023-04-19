/*
 * Project: models
 * Created Date: Tuesday April 18th 2023 9:57:24 am
 * Author: Fa C Shus (paul@facshus.com)
 * -----
 * Last Modified: Tuesday, 18th April 2023 9:57:24 am
 * Modified By: Fa C Shus (paul@facshus.com)
 * -----
 * Copyright (c) 2021 - 2023 FaCShus Systems
 * License: GNU GPL
 */

import 'package:craps_domain/src/consts.dart';
import 'package:meta/meta.dart';

/// This holds the results of the roll of dice
@immutable
class RollResult {
  /// Constructor
  RollResult({
    required this.firstDie,
    required this.secondDie,
    this.isCrapless = false,
  })  : assert(
          VALID_DIE_FACES.contains(firstDie),
          'Die value must be in {1, 2, 3, 4, 5, 6}',
        ),
        assert(
          VALID_DIE_FACES.contains(secondDie),
          'Die value must be in {1, 2, 3, 4, 5, 6}',
        );

  /// holds the value of the first die
  final int firstDie;

  /// holds the value of the seocnd die
  final int secondDie;

  /// determines if the roll shoold be evaluated against a crapless table
  final bool isCrapless;

  /// returns the result of the roll
  int get value {
    return firstDie + secondDie;
  }

  /// returns true if the roll is a hardway
  bool isHard() {
    return firstDie == secondDie && POINT_NUMBERS.contains(value);
  }

  @override
  bool operator ==(Object other) =>
      other is RollResult &&
      {other.firstDie, other.secondDie}.containsAll({firstDie, secondDie}) &&
      {firstDie, secondDie}.containsAll({other.firstDie, other.secondDie});

  @override
  int get hashCode {
    // force ordered list then hash
    final lst = <int>{firstDie, secondDie}.toList()..sort();
    final hashStr = lst.join('-');
    return hashStr.hashCode;
  }

  @override
  String toString() {
    return 'Roll: $value - <$firstDie, $secondDie>';
  }
}
