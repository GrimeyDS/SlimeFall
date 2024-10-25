import 'package:flutter/material.dart';
import 'package:slime_fall/pages/components/game_title.dart';
import 'package:slime_fall/pages/components/submit_button.dart';

class StartScreenOverlay extends StatelessWidget {
  final VoidCallback onStart;

  const StartScreenOverlay({super.key, required this.onStart});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
      Positioned.fill(
        child: Image.asset(
        'assets/images/background.png',
        fit: BoxFit.cover,
        ),
      ),
      Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const GameTitle(title: 'Start Game'),
          const SizedBox(height: 30),
          SubmitButton(text: 'Start', onPressed: onStart)
        ],
      ),
    )]);
  }
}