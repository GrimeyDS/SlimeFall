import 'package:flutter/material.dart';
import 'package:slime_fall/class%20library/game/slime_fall_game.dart';

class DashCooldownOverlay extends StatelessWidget {
  final Color foreGroundColor = Colors.white;
  final Color backgroundColor = Colors.blue;
  final SlimeFallGame game;

  const DashCooldownOverlay({super.key, required this.game});

  @override
  Widget build(BuildContext context) {
     final postioned = Positioned(
      top: 20,
      right: 20,
      child: Stack(
        alignment: Alignment.center,
        children: [
          SizedBox(
            width: 60,
            height: 60,
            child: CircularProgressIndicator(
              value: game.slime.cooldownPercent,
              strokeWidth: 5,
              backgroundColor: backgroundColor,
              valueColor: AlwaysStoppedAnimation(foreGroundColor),
            ),
          )
        ]
      ),
    ); 
    return postioned;
  }
}