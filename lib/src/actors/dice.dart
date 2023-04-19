/*
 * Project: actors
 * Created Date: Tuesday April 18th 2023 9:51:43 am
 * Author: Fa C Shus (paul@facshus.com)
 * -----
 * Last Modified: Tuesday, 18th April 2023 9:51:43 am
 * Modified By: Fa C Shus (paul@facshus.com)
 * -----
 * Copyright (c) 2021 - 2023 FaCShus Systems
 * License: GNU GPL
 */

import 'package:craps_domain/craps_domain.dart';

/// This class simulates a pair of dice
class Dice {
  /// constructor
  Dice({
    required this.firstDie,
    required this.secondDie,
  });

  /// Constructor with default values
  factory Dice.generic() => Dice(
        firstDie: Die(name: 'first'),
        secondDie: Die(name: 'second'),
      );

  /// first die of the pair
  final Die firstDie;

  /// second die of the pair
  final Die secondDie;

  /// history of the rolls for this die
  final List<RollResult> _history = [];

  /// How many times have these dice been rolled
  int get rollCount => _history.length;

  /// history of the rolls for these dice
  /// read-only
  List<RollResult> get rolls {
    return _history;
  }

  /// return the most recent roll
  RollResult? get currentRoll => _history.isEmpty ? null : _history.last;

  /// return the previous roll
  RollResult? get previousRoll =>
      _history.length < 2 ? null : _history.elementAt(_history.length - 2);

  /// roll the dice
  ///   randomly if you don't supply values
  ///   manually/exxplicitly when you do provide values
  RollResult roll({
    int manual1 = -1,
    int manual2 = -1,
  }) {
    assert(
      manual1 == -1 || VALID_DIE_FACES.contains(manual1),
      'Invalid roll; Die value must be in {1, 2, 3, 4, 5, 6}',
    );
    assert(
      manual2 == -1 || VALID_DIE_FACES.contains(manual2),
      'Invalid roll; Die value must be in {1, 2, 3, 4, 5, 6}',
    );
    final firstDieValue = manual1 == -1 ? firstDie.roll() : manual1;
    final secondDieValue = manual2 == -1 ? secondDie.roll() : manual2;
    final retVal = RollResult(
      firstDie: firstDieValue,
      secondDie: secondDieValue,
    );
    _history.add(retVal);

    // 'Roll: ${retVal.value} <${retVal.firstDie},${retVal.secondDie}>'.log();
    return retVal;
  }
}
