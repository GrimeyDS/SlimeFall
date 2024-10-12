import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:slime_fall/Class%20Lib/Game/SlimeFallGame.dart';

void main() {
  runApp(GameWidget(game: slimeGame),);
}

final slimeGame = Slimefallgame();