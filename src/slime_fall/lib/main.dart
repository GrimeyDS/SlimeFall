import 'package:flame/flame.dart';
import 'package:flutter/material.dart';
import 'package:slime_fall/app_state.dart';

void main() {
  runApp(const GameApp());

  
/*   runApp(MaterialApp(
    title: 'Slime Fall',
    home: Scaffold(
      body: GameWidget(
        game: SlimeFallGame(),
        overlayBuilderMap: { 
          Config.dashCooldownOverlay: (_, SlimeFallGame game) => DashCooldownOverlay(game: game),
          Config.scoreOverlay: (_, SlimeFallGame game) => ScoreOverlay(game: game),
        }
      ),
    )
  )); */

  Flame.device.fullScreen();
  Flame.device.setPortraitUpOnly();
}

class GameApp extends StatefulWidget {
  const GameApp({super.key});

  @override
  AppState createState() => AppState();
}


