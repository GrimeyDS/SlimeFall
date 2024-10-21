import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:slime_fall/Class%20Library/overlays/dash_cooldown_overlay.dart';
import 'package:slime_fall/Constants/configuration.dart';
import 'package:slime_fall/class%20library/game/slime_fall_game.dart';
import 'package:slime_fall/class%20library/overlays/score_overlay.dart';
import 'firebase_options.dart';

final slimeGame = SlimeFallGame();

void main() {
  //runApp(GameWidget(game: slimeGame),);
  runApp(MaterialApp(
    home: Scaffold(
      body: GameWidget(
        game: SlimeFallGame(),
        overlayBuilderMap: { 
          Config.dashCooldownOverlay: (_, SlimeFallGame game) => DashCooldownOverlay(game: game),
          Config.scoreOverlay: (_, SlimeFallGame game) => ScoreOverlay(game: game),
        }
      ),
    )
  ));

  Flame.device.fullScreen();
  Flame.device.setPortraitUpOnly();
}

