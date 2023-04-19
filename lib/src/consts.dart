// ignore_for_file: constant_identifier_names, non_constant_identifier_names

/*
 * Project: src
 * Created Date: Monday April 17th 2023 1:21:14 pm
 * Author: Fa C Shus (paul@facshus.com)
 * -----
 * Last Modified: Monday, 17th April 2023 1:21:15 pm
 * Modified By: Fa C Shus (paul@facshus.com)
 * -----
 * Copyright (c) 2021 - 2023 FaCShus Systems
 * License: GNU GPL
 */

/// Valid inside numbers
const INSIDE_NUMBERS = {5, 6, 8, 9};

/// Valid outside numbers
const OUTSIDE_NUMBERS = {4, 10};

/// Valid inside numbers
const POINT_NUMBERS = {4, 5, 6, 8, 9, 10};

/// Valid inside numbers
const POINT_NUMBERS_CRAPLESS = {2, 34, 5, 6, 8, 9, 10, 11, 12};

/// Valid values for a single die
const VALID_DIE_FACES = {1, 2, 3, 4, 5, 6};

///Valid values for a pair of dice
const VALID_ROLLS = {2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12};

/// Set of front-line natural winners
const NATURAL_WINNERS = {7, 11};

/// Set of front-line natural losers
const NATURAL_LOSERS = {2, 3, 12};

/// CRAPS alias for front-line natural losers
const CRAPS = NATURAL_LOSERS;
