/*
 * Project: actors
 * Created Date: Monday April 17th 2023 2:06:07 pm
 * Author: Fa C Shus (paul@facshus.com)
 * -----
 * Last Modified: Monday, 17th April 2023 2:06:07 pm
 * Modified By: Fa C Shus (paul@facshus.com)
 * -----
 * Copyright (c) 2021 - 2023 FaCShus Systems
 * License: GNU GPL
 */

import 'dart:math';

import 'package:craps_domain/craps_domain.dart';

/// This is a die with ability to roll
/// a random value and record history
class Die {
  /// constructor
  Die({
    this.name = 'Die',
  });

  final Random _random = Random();

  /// Name for the die
  final String name;

  /// history of the rolls for this die
  final List<int> _history = [];

  /// history of the rolls for this die
  /// read-only
  List<int> get history {
    return _history;
  }

  /// Roll this die
  int roll() {
    final retVal = 1 + _random.nextInt(6);
    _history.add(retVal);
    return retVal;
  }

  /// return a histogram of the die's roll history
  DieHistogram get histogram => DieHistogram(history: _history);
}
