import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:slime_fall/class%20library/game/SlimeFallGame.dart';

void main() {
  runApp(GameWidget(game: slimeGame),);
}

final slimeGame = Slimefallgame();