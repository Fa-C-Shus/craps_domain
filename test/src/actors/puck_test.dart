/*
 * Project: actors
 * Created Date: Tuesday April 18th 2023 11:31:58 am
 * Author: Fa C Shus (paul@facshus.com)
 * -----
 * Last Modified: Tuesday, 18th April 2023 11:31:58 am
 * Modified By: Fa C Shus (paul@facshus.com)
 * -----
 * Copyright (c) 2021 - 2023 FaCShus Systems
 * License: GNU GPL
 */

import 'package:craps_domain/craps_domain.dart';
import 'package:test/test.dart';

void main() {
  group('Puck success', () {
    test('can be instantiated', () {
      // Arrange

      // Act
      final puck = Puck();

      // Assert
      expect(
        puck,
        isNotNull,
      );
      expect(puck.off, isTrue);
      expect(puck.on, isFalse);
    });
    test('reset initializes values', () {
      // Arrange
      final puck = Puck()..pointSet(5);

      // Act
      final _ = puck.reset();

      // Assert
      expect(
        puck.point,
        0,
      );
      expect(
        puck.pointStr,
        'OFF',
      );
    });
    test('sevenOut initializes values', () {
      // Arrange
      final puck = Puck()..pointSet(5);

      // Act
      final _ = puck.sevenOut();

      // Assert
      expect(
        puck.point,
        0,
      );
      expect(
        puck.pointStr,
        'OFF',
      );
    });
    test('pointMade initializes values', () {
      // Arrange
      final puck = Puck()..pointSet(5);

      // Act
      final _ = puck.pointMade();

      // Assert
      expect(
        puck.point,
        0,
      );
      expect(
        puck.pointStr,
        'OFF',
      );
    });
    test('set point to 5', () {
      // Arrange
      const p = 5;
      final puck = Puck();

      // Act
      final _ = puck.pointSet(p);

      // Assert
      expect(
        puck.point,
        p,
      );
      expect(
        puck.pointStr,
        p.toString(),
      );
    });
    test('set crapless point to 2', () {
      // Arrange
      const p = 2;
      final puck = Puck(crapless: true);

      // Act
      final _ = puck.pointSet(p);

      // Assert
      expect(
        puck.point,
        p,
      );
      expect(
        puck.pointStr,
        p.toString(),
      );
    });
  });

  group('puck exceptions', () {
    test('cannot set point to 7', () {
      // Arrange
      final puck = Puck();
      final clPuck = Puck(crapless: true);

      // Act
      // Assert
      expect(
        () => puck.pointSet(7),
        throwsA(const TypeMatcher<AssertionError>()),
      );
      expect(
        () => puck.pointSet(2),
        throwsA(const TypeMatcher<AssertionError>()),
      );
      expect(
        () => clPuck.pointSet(7),
        throwsA(const TypeMatcher<AssertionError>()),
      );
    });
    test('cannot make point if point is not set', () {
      // Arrange
      final puck = Puck();

      // Act
      // Assert
      expect(
        puck.pointMade,
        throwsA(const TypeMatcher<AssertionError>()),
      );
    });
    test('cannot seven out if point is not set', () {
      // Arrange
      final puck = Puck();

      // Act
      // Assert
      expect(
        puck.sevenOut,
        throwsA(const TypeMatcher<AssertionError>()),
      );
    });
  });
  group('test the evalRoll', () {
    test('puck is off roll a point', () {
      // Arrange
      const p = 6;
      final puck = Puck();

      // Act
      final _ = puck.evalRoll(p);

      // Assert
      expect(puck.point, p);
    });
    test('puck is off roll a natural on basic table', () {
      // Arrange
      const crapsOrRed = {2, 3, 7, 11, 12};
      final puck = Puck();

      // Act & Assert
      for (final element in crapsOrRed) {
        puck.evalRoll(element);
        expect(puck.point, 0);
      }
    });
    test('puck is off roll a natural on crapless table', () {
      // Arrange
      const crapsOrRed = {7};
      final puck = Puck(crapless: true);

      // Act & Assert
      for (final element in crapsOrRed) {
        puck.evalRoll(element);
        expect(puck.point, 0);
      }
    });
    test('point = 6 make point', () {
      // Arrange
      const p = 6;
      final puck = Puck()..evalRoll(p);
      final puckC = Puck(crapless: true)..evalRoll(p);
      expect(puck.point, p);
      expect(puckC.point, p);

      // Act
      puck.evalRoll(p);
      puckC.evalRoll(p);

      // Assert
      expect(puck.point, 0);
      expect(puckC.point, 0);
    });
    test('point = 6 seven out', () {
      // Arrange
      const p = 6;
      final puck = Puck()..evalRoll(p);
      final puckC = Puck(crapless: true)..evalRoll(p);
      expect(puck.point, p);
      expect(puckC.point, p);

      // Act
      puck.evalRoll(7);
      puckC.evalRoll(7);

      // Assert
      expect(puck.point, 0);
      expect(puckC.point, 0);
    });
    test('point = 6 ignore 2,3,4,5,8,9,10,11,12', () {
      // Arrange
      const p = 6;
      const rolls = {2, 3, 4, 5, 8, 9, 10, 11, 12};
      final puck = Puck()..evalRoll(p);
      final puckC = Puck(crapless: true)..evalRoll(p);
      expect(puck.point, p);
      expect(puckC.point, p);

      // Act & Assert
      for (final e in rolls) {
        puck.evalRoll(e);
        puckC.evalRoll(e);
        expect(puck.point, p);
        expect(puckC.point, p);
      }
    });
    test('eval a bad roll throws exeption', () {
      // Arrange
      final puck = Puck();

      // Act
      // Assert
      expect(
        () => puck.evalRoll(13),
        throwsA(const TypeMatcher<AssertionError>()),
      );
    });
  });
}
