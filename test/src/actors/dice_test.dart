/*
 * Project: actors
 * Created Date: Tuesday April 18th 2023 11:23:34 am
 * Author: Fa C Shus (paul@facshus.com)
 * -----
 * Last Modified: Tuesday, 18th April 2023 11:23:35 am
 * Modified By: Fa C Shus (paul@facshus.com)
 * -----
 * Copyright (c) 2021 - 2023 FaCShus Systems
 * License: GNU GPL
 */

import 'package:craps_domain/craps_domain.dart';
import 'package:test/test.dart';

void main() {
  group('Dice constructor success', () {
    test('can be instantiated (empty)', () {
      // Arrange

      // Act
      final dice = Dice.generic();

      // Assert
      expect(
        dice,
        isNotNull,
      );
    });
    test('can be instantiated (empty)', () {
      // Arrange
      final d1 = Die(name: 'one');
      final d2 = Die(name: 'due');

      // Act
      final dice = Dice(
        firstDie: d1,
        secondDie: d2,
      );

      // Assert
      expect(
        dice,
        isNotNull,
      );
    });
  });

  group('Dice methods success', () {
    test('test initial settings', () {
      // Arrange
      final dice = Dice.generic();

      // Act

      //Assert
      expect(dice.rollCount, 0);
      expect(dice.currentRoll, isNull);
      expect(dice.previousRoll, isNull);
      expect(dice.firstDie, isNotNull);
      expect(dice.secondDie, isNotNull);
      expect(dice.rolls, isEmpty);
    });
    test('test first roll', () {
      // Arrange
      final dice = Dice.generic();

      // Act
      final roll = dice.roll();

      //Assert
      expect(dice.rollCount, 1);
      expect(dice.currentRoll, isNotNull);
      expect(dice.currentRoll, roll);
      expect(dice.previousRoll, isNull);
      expect(dice.rolls, isNotEmpty);
    });
    test('test second roll', () {
      // Arrange
      final dice = Dice.generic();

      // Act
      final _ = dice.roll();
      final roll = dice.roll();

      //Assert
      expect(dice.rollCount, 2);
      expect(dice.currentRoll, isNotNull);
      expect(dice.currentRoll, roll);
      expect(dice.previousRoll, isNotNull);
      expect(dice.rolls, isNotEmpty);
    });
    test('test manual roll', () {
      // Arrange
      final dice = Dice.generic();
      const d1 = 2;
      const d2 = 3;
      final expected = RollResult(firstDie: d1, secondDie: d2);

      // Act
      final roll = dice.roll(manual1: d1, manual2: d2);

      //Assert
      expect(dice.rollCount, 1);
      expect(dice.currentRoll, expected);
      expect(dice.currentRoll.hashCode, expected.hashCode);
      expect(dice.currentRoll, roll);
   });
  });
  group('Dice roll exceptions', () {
    test('Should throw error if face is not in 1-6', () {
      // Arrange
      final dice = Dice.generic();
      const firstDie = 7;
      const secondDie = 3;

      // Act

      // Assert
      expect(
          () => dice.roll(
                manual1: firstDie,
                manual2: secondDie,
              ),
          throwsA(const TypeMatcher<AssertionError>()),);
    });
  });
}
