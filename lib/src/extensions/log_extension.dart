// coverage:ignore-file

/*
 * Project: extensions
 * Created Date: Monday April 17th 2023 3:39:05 pm
 * Author: Fa C Shus (paul@facshus.com)
 * -----
 * Last Modified: Monday, 17th April 2023 3:39:05 pm
 * Modified By: Fa C Shus (paul@facshus.com)
 * -----
 * Copyright (c) 2021 - 2023 FaCShus Systems
 * License: GNU GPL
 */

import 'dart:developer' as devtools;

/// Extension to allow logging objects
extension Log on Object {
  /// method that implements logging
  void log() => devtools.log(toString());

  /// method that implements logging
  void debug() => devtools.log(level: 2000, toString());
}
