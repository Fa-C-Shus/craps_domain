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
