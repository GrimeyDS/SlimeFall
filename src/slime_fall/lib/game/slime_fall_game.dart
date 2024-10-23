import 'dart:async';
import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:slime_fall/game/components/top_hitbox.dart';
import 'package:slime_fall/game/constants/configuration.dart';
import 'package:slime_fall/game/constants/position.dart';
import 'package:slime_fall/game/components/background.dart';
import 'package:slime_fall/game/components/platform/platform_group.dart';
import 'package:slime_fall/game/components/spike/spike_group.dart';
import 'package:slime_fall/game/components/player/slime.dart';
import 'package:sensors_plus/sensors_plus.dart';

class SlimeFallGame extends FlameGame with HasCollisionDetection, TapDetector {
  // Interval to repeat platform spawning.
  Timer interval = Timer(Config.platformInterval, repeat: true);
  final Slime slime = Slime();
  double gyroX = 0;
  double gyroY = 0;
  int score = 0;
  bool isGameStarted = false;
  bool isGameOver = false;

  @override
  Future<void> onLoad() async {
    final int fullSize = (size.y * 1.55).toInt();
    const int initialSpawnPoint = 280;
    const int spawnInterval = 120;

    // ~/ is used to return an integer.
    final int amountOfInitialPlatforms = (fullSize - initialSpawnPoint) ~/ spawnInterval;

    addAll([
      Background(),
      slime,
      SpikeGroup(Position.left),
      SpikeGroup(Position.right),
      TopHitbox(),
    ]);

    mainMenuOpen();

    // Added manual platforms for initial spawns.
    for (int platform = 1; platform <= amountOfInitialPlatforms; platform++)
    {
      add(PlatformGroup(initialSpawnPoint + (spawnInterval * platform)));
    }

    // Spawn new platform
    interval.onTick = () => add(PlatformGroup(0));
    startGyroscopeListener();
  }

  void startGyroscopeListener() {
    gyroscopeEventStream().listen((GyroscopeEvent event) {
      gyroX += event.y * Config.slimeSensitivity; // event.y is rotation around the y-axis (left-right)

      // NOT IN USE
      //gyroY += event.x; // event.x is rotation around the x-axis (up-down)
    },
    onError: (e) {
          showDialog(
              context: e,
              builder: (context) {
                return const AlertDialog(
                  title: Text(Config.sensorNotFound),
                  content: Text(
                      Config.gyroNotFound),
                );
              });
        },);
  }

  @override void onTap() {
    super.onTap();
    slime.dash();
  }

  @override
  void update(double dt) {
    super.update(dt);
    // Check if interval has surpassed on game ticks. If surpassed will call the function in onLoad
    interval.update(dt);
    slime.changePosition(gyroX * dt);
    updateScore(dt);
  }


  void updateScore(dt) {
    overlays.remove(Config.scoreOverlay);
    score += (interval.current * 1.1).toInt(); // Score is based on how many platforms have been spawned.
    overlays.add(Config.scoreOverlay);
  }

    void resetGame() {
    isGameStarted = true;
    isGameOver = false;
    overlays.remove(Config.startScreenOverlay);
    overlays.remove(Config.gameOverOverlay);
    resumeEngine();
  }

  void mainMenuOpen() {
    isGameStarted = false;
    overlays.add(Config.startScreenOverlay);
    pauseEngine();
  }

  void endGame() {
    isGameStarted = false;
    isGameOver = true;
    overlays.add(Config.gameOverOverlay);
  }
}