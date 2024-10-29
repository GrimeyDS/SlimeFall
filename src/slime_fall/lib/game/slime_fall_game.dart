import 'dart:async';
import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:flutter/material.dart';
import 'package:slime_fall/game/components/top_hitbox.dart';
import 'package:slime_fall/game/constants/assets.dart';
import 'package:slime_fall/game/constants/configuration.dart';
import 'package:slime_fall/game/constants/position.dart';
import 'package:slime_fall/game/components/background.dart';
import 'package:slime_fall/game/components/platform/platform_group.dart';
import 'package:slime_fall/game/components/spike/spike_group.dart';
import 'package:slime_fall/game/components/player/slime.dart';
import 'package:sensors_plus/sensors_plus.dart';
import 'package:slime_fall/main.dart';
import 'package:slime_fall/services/highscore/highscore_service_interface.dart';

class SlimeFallGame extends FlameGame with HasCollisionDetection, TapDetector {
  // Interval to repeat platform spawning.
  late Timer interval;
  late Slime slime;
  late double gyroX;
  late double gyroY;
  late int score;
  int highScore = 0;
  late IHighscoreService highScoreService = getIt<IHighscoreService>();

  @override
  Future<void> onLoad() async {
    mainMenuOpen();
    startGyroscopeListener();
    FlameAudio.bgm.play(Assets.backgroundMusic, volume: 0.2);
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

    if (score % 10 == 0) {
      Config.scrollSpeed += 0.2;
    }
  }

  void createGame() {
    Config.scrollSpeed = 150.0;
    interval = Timer(Config.platformInterval, repeat: true);
    slime = Slime();
    gyroX = 0;
    gyroY = 0;
    score = 0;

    addAll([
      Background(),
      slime,
      SpikeGroup(Position.left),
      SpikeGroup(Position.right),
      TopHitbox(),
    ]);

    // Spawn new platform
    interval.onTick = () {
      add(PlatformGroup(0));
      score += 1;
    };
  }

  void spawnInitialPlatforms() {
    final int fullSize = (size.y * 1.55).toInt();
    const int initialSpawnPoint = 280;
    const int spawnInterval = 145;

    // ~/ is used to return an integer.
    final int amountOfInitialPlatforms = (fullSize - initialSpawnPoint) ~/ spawnInterval;

        // Added manual platforms for initial spawns.
    for (int platform = 1; platform <= amountOfInitialPlatforms; platform++)
    {
      add(PlatformGroup(initialSpawnPoint + (spawnInterval * platform)));
    }
  }


  void updateScore(dt) {
    overlays.remove(Config.scoreOverlay);
    overlays.add(Config.scoreOverlay);
  }

  void resetGame() {
    removeAll(children);
    createGame();
    startGame();
  }

  void mainMenuOpen() {
    createGame();
    pauseEngine();
    overlays.add(Config.startScreenOverlay);
  }

  void startGame() {
    overlays.remove(Config.startScreenOverlay);
    overlays.remove(Config.gameOverOverlay);
    resumeEngine();
    spawnInitialPlatforms();
  }

  Future<void> endGame() async {
    pauseEngine();
    highScore = await highScoreService.getHighScore();
    overlays.add(Config.gameOverOverlay);

    if (score > highScore) {
      await highScoreService.saveHighScore(score);
    }
  }
}