/*
 * Project: extensions
 * Created Date: Tuesday April 18th 2023 7:34:58 pm
 * Author: Fa C Shus (paul@facshus.com)
 * -----
 * Last Modified: Tuesday, 18th April 2023 7:34:58 pm
 * Modified By: Fa C Shus (paul@facshus.com)
 * -----
 * Copyright (c) 2021 - 2023 FaCShus Systems
 * License: GNU GPL
 */

import 'package:craps_domain/craps_domain.dart';
import 'package:test/test.dart';

void main() {
  group('extensions', () {
    test(
      'should execute log method',
      () async {
        // arrange
        final die = Die();

        // act
        final _ = die.log();
        die.debug();

        // assert
      },
    );
  });
}
