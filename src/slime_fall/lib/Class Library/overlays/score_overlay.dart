import 'package:flutter/material.dart';
import 'package:slime_fall/class%20library/game/slime_fall_game.dart';

class ScoreOverlay extends StatelessWidget {
  final SlimeFallGame game;

  const ScoreOverlay({super.key, required this.game});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 20,
      left: 20,
      child: Text(
        'Score: ${game.score}',
        style: const TextStyle(
          fontSize: 15,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}