/*
 * Project: models
 * Created Date: Tuesday April 18th 2023 10:11:33 am
 * Author: Fa C Shus (paul@facshus.com)
 * -----
 * Last Modified: Tuesday, 18th April 2023 10:11:33 am
 * Modified By: Fa C Shus (paul@facshus.com)
 * -----
 * Copyright (c) 2021 - 2023 FaCShus Systems
 * License: GNU GPL
 */

import 'package:craps_domain/craps_domain.dart';
import 'package:test/test.dart';

void main() {
  group('RollResult results', () {
    const firstDie = 2;
    const secondDie = 3;
    const expectedResult = 5;
    test('can be instantiated', () {
      // Arrange

      // Act
      final result = RollResult(
        firstDie: firstDie,
        secondDie: secondDie,
      );

      // Assert
      expect(
        result,
        isNotNull,
      );
    });
    test('returns expected value', () {
      // Arrange

      // Act
      final result = RollResult(
        firstDie: firstDie,
        secondDie: secondDie,
      );

      // Assert
      expect(
        result.value,
        expectedResult,
      );
    });
    test('returns isHard=True', () {
      // Arrange
      const secondDie = 2;

      // Act
      final result = RollResult(
        firstDie: firstDie,
        secondDie: secondDie,
      );

      // Assert
      expect(
        result.isHard(),
        true,
      );
    });
    test('returns isHard=False', () {
      // Arrange

      // Act
      final result = RollResult(
        firstDie: firstDie,
        secondDie: secondDie,
      );

      // Assert
      expect(
        result.isHard(),
        false,
      );
    });
  });

  group('RollResult operators', () {
    test(
      'should return true when the results are equal',
      () async {
        // arrange
        final origResult = RollResult(firstDie: 2, secondDie: 3);
        final cmpResult = RollResult(firstDie: 3, secondDie: 2);

        // act

        // assert
        expect(origResult == cmpResult, isTrue);
      },
    );

    test(
      'should return appropriate string from toString',
      () async {
        // arrange
        final result = RollResult(firstDie: 3, secondDie: 3);
        const expected = 'Roll: 6 - <3, 3>';

        // act
        final actual = result.toString();

        // assert
        expect(actual, expected);
      },
    );
    test(
      'should return false when the results are not equal',
      () async {
        // arrange
        final origResult = RollResult(firstDie: 3, secondDie: 3);
        final cmpResult = RollResult(firstDie: 3, secondDie: 2);

        // act

        // assert
        expect(origResult == cmpResult, isFalse);
      },
    );

    test(
      'should return 604030963 hashCode for constructor (3, 3)',
      () async {
        // arrange
        const hStr = '3';
        final hCode = hStr.hashCode;
        final result = RollResult(firstDie: 3, secondDie: 3);

        // act
        final retVal = result.hashCode;

        // assert
        expect(retVal, hCode);
      },
    );

    test(
      'should return 604030963 hashCode for constructor (3, 2)',
      () async {
        // arrange
        const hStr = '2-3';
        final hCode = hStr.hashCode;
        final result = RollResult(firstDie: 3, secondDie: 2);
        final resultReversed = RollResult(firstDie: 2, secondDie: 3);

        // act
        final retVal = result.hashCode;
        final retValReversed = resultReversed.hashCode;

        // assert
        expect(retVal, hCode);
        expect(retValReversed, hCode);
      },
    );
  });

  group('RollResult exceptions', () {
    test('Should throw error if face is not in 1-6', () {
      // Arrange
      const firstDie = 7;
      const secondDie = 3;

      // Act

      // Assert
      expect(
        () => RollResult(
          firstDie: firstDie,
          secondDie: secondDie,
        ),
        throwsA(const TypeMatcher<AssertionError>()),
      );
    });
  });
//
}
