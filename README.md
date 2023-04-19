# 🎲 🎲 Craps Domain

[![Pub](https://img.shields.io/pub/v/craps_domain.svg)](https://pub.dev/packages/craps_domain)
[![coverage](https://raw.githubusercontent.com/Fa-C-Shus/craps_domain/main/coverage_badge.svg)](https://github.com/Fa-C-Shus/craps_domain/actions)
[![License: MIT](https://img.shields.io/badge/license-MIT-purple.svg)](https://opensource.org/licenses/MIT)
[![style: very good analysis][very_good_analysis_badge]][very_good_analysis_link]

---

Core Craps Logic

Craps library that provides the components and game play for craps, the casino game. This is intended to be the core elements that allows creators to make the craps UI without having to build out the components

## Installation 💻

Add `craps_domain` to your `pubspec.yaml`:

```yaml
dependencies:
  craps_domain:
```

Install it:

```sh
dart pub get
```

---

## Running Tests 🧪

To run all unit tests:

```sh
dart pub global activate coverage 1.2.0
dart test --coverage=coverage
dart pub global run coverage:format_coverage --packages=.dart_tool/package_config.json --check-ignore --report-on=lib --lcov -o ./coverage/lcov.info -i ./coverage
```

To view the generated coverage report you can use [lcov](https://github.com/linux-test-project/lcov).

```sh
# Generate Coverage Report
genhtml -o ./coverage/report ./coverage/lcov.info

# Open Coverage Report
open ./coverage/report/index.html
```

## Simulate 10 rolls 🎲 🎲

```dart
import 'package:craps_domain/craps_domain.dart';

void main() {
  final dice = Dice.generic();
  final puck = Puck();

  for (var i = 1; i < 11; i++) {
    final roll = dice.roll();
    roll.log();
    puck.evalRoll(roll.value);
  }
}
```

...should return ...

```sh
Connecting to VM Service at http://127.0.0.1:64072/P2Op5b6-B1s=/
[log] Roll: 7 - <5, 2>
[log] Front line Winner!
[log] Roll: 4 - <3, 1>
[log] (4); Mark the point
[log] Roll: 7 - <4, 3>
[log] Seven out; take the line; pay behind
[log] Roll: 6 - <2, 4>
[log] (6); Mark the point
[log] Roll: 6 - <3, 3>
[log] Point Made (6); pay the line
[log] Roll: 11 - <6, 5>
[log] Front line Winner!
[log] Roll: 6 - <5, 1>
[log] (6); Mark the point
[log] Roll: 7 - <4, 3>
[log] Seven out; take the line; pay behind
[log] Roll: 11 - <6, 5>
[log] Front line Winner!
[log] Roll: 5 - <2, 3>
[log] (5); Mark the point
Exited
```

[dart_install_link]: https://dart.dev/get-dart
[github_actions_link]: https://docs.github.com/en/actions/learn-github-actions
[license_badge]: https://img.shields.io/badge/license-MIT-blue.svg
[license_link]: https://opensource.org/licenses/MIT
[logo_black]: https://raw.githubusercontent.com/VGVentures/very_good_brand/main/styles/README/vgv_logo_black.png#gh-light-mode-only
[logo_white]: https://raw.githubusercontent.com/VGVentures/very_good_brand/main/styles/README/vgv_logo_white.png#gh-dark-mode-only
[mason_link]: https://github.com/felangel/mason
[very_good_analysis_badge]: https://img.shields.io/badge/style-very_good_analysis-B22C89.svg
[very_good_analysis_link]: https://pub.dev/packages/very_good_analysis
[very_good_coverage_link]: https://github.com/marketplace/actions/very-good-coverage
[very_good_ventures_link]: https://verygood.ventures
[very_good_ventures_link_light]: https://verygood.ventures#gh-light-mode-only
[very_good_ventures_link_dark]: https://verygood.ventures#gh-dark-mode-only
[very_good_workflows_link]: https://github.com/VeryGoodOpenSource/very_good_workflows
