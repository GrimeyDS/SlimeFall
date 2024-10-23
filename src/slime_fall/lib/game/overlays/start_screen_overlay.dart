import 'package:flutter/material.dart';
import 'package:slime_fall/pages/components/submit_button.dart';

class StartScreenOverlay extends StatelessWidget {
  final VoidCallback onStart;

  const StartScreenOverlay({super.key, required this.onStart});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            'Slime Fall',
            style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 30),
          SubmitButton(text: 'Start', onPressed: onStart)
        ],
      ),
    );
  }
}