/*
 * Project: models
 * Created Date: Monday April 17th 2023 10:16:53 pm
 * Author: Fa C Shus (paul@facshus.com)
 * -----
 * Last Modified: Monday, 17th April 2023 10:16:53 pm
 * Modified By: Fa C Shus (paul@facshus.com)
 * -----
 * Copyright (c) 2021 - 2023 FaCShus Systems
 * License: GNU GPL
 */

import 'package:craps_domain/craps_domain.dart';
import 'package:test/test.dart';

void main() {
  group('die histogram', () {
    test(
      'should return an empty histogram when creating new histogram',
      () async {
        // arrange
        final history = <int>[];

        // act
        final dh = DieHistogram(history: history);

        // assert
        expect(dh.one, 0);
        expect(dh.two, 0);
        expect(dh.three, 0);
        expect(dh.four, 0);
        expect(dh.five, 0);
        expect(dh.six, 0);
        expect(dh.getFace(1), 0);
      },
    );

    test(
      'should return a histogram with frequency of 1 for all faces',
      () async {
        // arrange
        final history = <int>[1, 2, 3, 4, 5, 6];

        // act
        final dh = DieHistogram(history: history);

        // assert
        expect(dh.one, 1);
        expect(dh.two, 1);
        expect(dh.three, 1);
        expect(dh.four, 1);
        expect(dh.five, 1);
        expect(dh.six, 1);
        expect(dh.getFace(1), 1);
      },
    );

    test(
      'should return a histogram with frequency of 2 for all faces',
      () async {
        // arrange
        final history = <int>[1, 2, 3, 4, 5, 6, 1, 2, 3, 4, 5, 6];

        // act
        final dh = DieHistogram(history: history);

        // assert
        expect(dh.one, 2);
        expect(dh.two, 2);
        expect(dh.three, 2);
        expect(dh.four, 2);
        expect(dh.five, 2);
        expect(dh.six, 2);
        expect(dh.getFace(2), 2);
      },
    );

    test(
      'should return percentages 1/6 for each face',
      () async {
        // arrange
        final history = <int>[1, 2, 3, 4, 5, 6];

        // act
        final dh = DieHistogram(history: history);

        // assert
        for (var i = 1; i < 7; i++) {
          expect(dh.getFacePercentage(i), 1 / 6);
        }
      },
    );
  });
}
