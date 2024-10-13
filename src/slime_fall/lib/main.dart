import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:slime_fall/class%20library/game/slime_fall_game.dart';

final slimeGame = SlimeFallGame();

void main() {

  runApp(GameWidget(game: slimeGame),);
  Flame.device.fullScreen();
  Flame.device.setPortraitUpOnly();
}

