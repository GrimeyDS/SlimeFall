import 'package:flutter/material.dart';

class ScoreText extends Text {
  const ScoreText({super.key, required String text,}) : super(
    text,
    style: const TextStyle(
      color: Colors.white,
      fontSize: 24,
      fontWeight: FontWeight.bold,
    ),
  );
}

class AchievedScoreText extends Text {
  AchievedScoreText({super.key, required String score, required Color? color}) : super(
    score,
    style: TextStyle(
      color: color,
      fontSize: 40,
      fontWeight: FontWeight.bold,
      shadows: const [
        Shadow(
          blurRadius: 10.0,
          color: Colors.black,
          offset: Offset(3, 3),
        ),
      ],
    ),
  );
}