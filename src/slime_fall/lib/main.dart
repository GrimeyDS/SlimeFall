import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:slime_fall/Class%20Library/overlays/dash_cooldown_overlay.dart';
import 'package:slime_fall/Constants/configuration.dart';
import 'package:slime_fall/class%20library/game/slime_fall_game.dart';

final slimeGame = SlimeFallGame();

void main() {
  //runApp(GameWidget(game: slimeGame),);
  runApp(MaterialApp(
    home: Scaffold(
      body: GameWidget(
        game: SlimeFallGame(),
        overlayBuilderMap: { 
          Config.dashCooldownOverlay: (_, SlimeFallGame game) => DashCooldownOverlay(game: game),
        }
      ),
    )
  ));

  Flame.device.fullScreen();
  Flame.device.setPortraitUpOnly();
}

