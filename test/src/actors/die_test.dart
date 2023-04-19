/*
 * Project: actors
 * Created Date: Monday April 17th 2023 2:07:58 pm
 * Author: Fa C Shus (paul@facshus.com)
 * -----
 * Last Modified: Monday, 17th April 2023 2:07:58 pm
 * Modified By: Fa C Shus (paul@facshus.com)
 * -----
 * Copyright (c) 2021 - 2023 FaCShus Systems
 * License: GNU GPL
 */

import 'package:craps_domain/craps_domain.dart';
import 'package:test/test.dart';

void main() {
  group('Die success', () {
    test('can be instantiated', () {
      // Arrange

      // Act
      final actual = Die();

      // Assert
      expect(
        actual,
        isNotNull,
      );
    });
    test('roll creates history', () {
      // Arrange
      const expected = 1;
      final die = Die();

      // Act
      final result = die.roll();

      // Assert
      expect(
        die.history.length,
        expected,
      );
      expect(
        die.history,
        [result],
      );
    });
    test('roll creates valid value', () {
      // Arrange
      final die = Die();

      for (var i = 0; i <= 25; i++) {
        // Act
        final result = die.roll();

        // Assert
        expect(
          VALID_DIE_FACES.contains(result),
          true,
        );
      }
    });
  });

  group('die histogram', () {
    test(
      'should return an empty histogram after instantiation',
      () async {
        // arrange
        final die = Die();

        // act
        final histogram = die.histogram;

        // assert
        expect(histogram.one, 0);
        expect(histogram.two, 0);
        expect(histogram.three, 0);
        expect(histogram.four, 0);
        expect(histogram.five, 0);
        expect(histogram.six, 0);
        expect(histogram.getFace(1), 0);
      },
    );

    test(
      'should return a populated histogram after instantiation',
      () async {
        // arrange
        final die = Die();

        // act
        final _ = die.roll();
        final histogram = die.histogram;
        var rolls = 0;
        for (var i = 1; i < 7; i++) {
          rolls += histogram.getFace(i);
        }

        // assert
        expect(rolls, 1);
      },
    );
  });
}
