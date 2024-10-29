import 'package:flutter/material.dart';
import 'package:slime_fall/pages/components/game_title.dart';
import 'package:slime_fall/pages/components/submit_button.dart';
import 'package:slime_fall/services/authentication/authentication_constants.dart';

class StartScreenOverlay extends StatelessWidget {
  final VoidCallback onStart;

  const StartScreenOverlay({super.key, required this.onStart});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
      Positioned.fill(
        child: Image.asset(
        AuthConstants.background,
        fit: BoxFit.cover,
        ),
      ),
      Center(
      child: Column(
        // The column will only take as much space as it needs depending on children
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
