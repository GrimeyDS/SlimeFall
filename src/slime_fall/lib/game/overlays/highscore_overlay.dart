import 'package:flutter/material.dart';

class HighScoresOverlay extends StatelessWidget {
  final List<int> highScores;

  const HighScoresOverlay({
    super.key,
    required this.highScores,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        margin: const EdgeInsets.all(20),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'High Scores',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              ...highScores.map((score) {
                return Text(
                  score.toString(),
                  style: const TextStyle(
                    fontSize: 20,
                  ),
                );
              }),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Close the high scores overlay
                  Navigator.of(context).pop();
                },
                child: const Text('Close'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
