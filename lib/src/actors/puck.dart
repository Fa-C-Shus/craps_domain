/*
 * Project: actors
 * Created Date: Tuesday April 18th 2023 11:25:01 am
 * Author: Fa C Shus (paul@facshus.com)
 * -----
 * Last Modified: Tuesday, 18th April 2023 11:25:02 am
 * Modified By: Fa C Shus (paul@facshus.com)
 * -----
 * Copyright (c) 2021 - 2023 FaCShus Systems
 * License: GNU GPL
 */

import 'package:craps_domain/craps_domain.dart';

/// This class simulates a craps puck
class Puck {
  /// constructor
  Puck({
    this.state = false,
    this.crapless = false,
  });

  /// This determines if the puck is on (true) or off (false)
  bool state;

  /// This flag shows whether or not the puck
  /// should obey craplless rules
  bool crapless = false;

  int? _point;

  /// manage the puck based upon the roll
  void evalRoll(int roll) {
    assert(
      VALID_ROLLS.contains(roll),
      '$roll is not valid; roll must be 2 though 12.',
    );
    if (_point == roll) {
      pointMade();
    } else if (roll == 7 && point != 0) {
      sevenOut();
    } else if ((POINT_NUMBERS.contains(roll) && !state) ||
        (POINT_NUMBERS_CRAPLESS.contains(roll) && crapless && !state)) {
      pointSet(roll);
    } else {
      // who cares?
      //  Natural Winner or Loser
      //  or box # or craps
    }
  }

  /// force reset the puck to off
  void reset() {
    state = false;
    _point = null;
  }

  /// Returns the current point or 0 if puck is off
  int get point {
    return _point ?? 0;
  }

  /// convenience function for puck state
  bool get on => state;

  /// convenience function for puck state
  bool get off => !state;

  /// Get point as a String
  String get pointStr {
    return point == 0 ? 'OFF' : point.toString();
  }

  /// set the point
  void pointSet(int point) {
    if (crapless) {
      assert(
        POINT_NUMBERS_CRAPLESS.contains(point),
        '$point is not valid; point must be in $POINT_NUMBERS_CRAPLESS',
      );
    } else {
      assert(
        POINT_NUMBERS.contains(point),
        '$point is not valid; point must be in $POINT_NUMBERS',
      );
    }
    state = true;
    _point = point;
  }

  /// Seven out turn the puck off
  void sevenOut() {
    assert(state, "The puck is off; we can't seven out");
    state = false;
    _point = null;
  }

  /// Point made turn the puck off
  void pointMade() {
    assert(state, 'There is no point');
    state = false;
    _point = null;
  }
}
