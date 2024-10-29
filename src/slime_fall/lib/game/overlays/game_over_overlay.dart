import 'package:flutter/material.dart';
import 'package:slime_fall/pages/components/game_title.dart';
import 'package:slime_fall/pages/components/score_text.dart';
import 'package:slime_fall/pages/components/submit_button.dart';
import 'package:slime_fall/services/authentication/highscore/highscore_constants.dart';

class GameOverOverlay extends StatelessWidget {
  final VoidCallback onReset;
  final int score;
  final int highScore;

  const GameOverOverlay({
    super.key,
    required this.onReset,
    required this.score,
    required this.highScore,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        // The column will only take as much space as it needs depending on children
        mainAxisSize: MainAxisSize.min,
        children: [
          const GameTitle(title: HighscoreConstants.gameOver),
          const SizedBox(height: 30),
          AnimatedOpacity(
            opacity: 1.0,
            duration: const Duration(seconds: 1),
            child: Column(
              children: [
                const ScoreText(text: HighscoreConstants.score),
                const SizedBox(height: 10),
                AchievedScoreText(score: score.toString(), color: Colors.yellow),
                const SizedBox(height: 20),
                const ScoreText(text: HighscoreConstants.highScore),
                const SizedBox(height: 10),
                AchievedScoreText(score: highScore.toString(), color: Colors.blue)
              ],
            ),
          ),
          const SizedBox(height: 40),
          SubmitButton(text: HighscoreConstants.retry, onPressed: onReset)
        ],
      ),
    );
  }
}
