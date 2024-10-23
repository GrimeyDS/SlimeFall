import 'package:flutter/material.dart';
import 'package:slime_fall/pages/components/game_title.dart';
import 'package:slime_fall/pages/components/submit_button.dart';

class GameOverOverlay extends StatelessWidget {
  final VoidCallback onReset;
  final VoidCallback onShowHighScores;

  const GameOverOverlay({
    super.key,
    required this.onReset,
    required this.onShowHighScores,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const GameTitle(title: 'Game Over'),
          const SizedBox(height: 30),
          SubmitButton(text: 'Restart', onPressed: onReset),
          const SizedBox(height: 20),
          SubmitButton(text: 'Highscores', onPressed: onShowHighScores)
        ],
      ),
    );
  }
}
