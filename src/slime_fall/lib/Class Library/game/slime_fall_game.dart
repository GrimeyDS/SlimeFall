import 'dart:async';
import 'package:flame/components.dart';
import 'package:flame/extensions.dart';
import 'package:flame/game.dart';
import 'package:slime_fall/Class%20Library/components/top_hitbox.dart';
import 'package:slime_fall/Constants/configuration.dart';
import 'package:slime_fall/Constants/position.dart';
import 'package:slime_fall/class%20library/components/background.dart';
import 'package:slime_fall/class%20library/components/platform_group.dart';
import 'package:slime_fall/class%20library/components/slime.dart';
import 'package:slime_fall/class%20library/components/spike_group.dart';
import 'package:sensors_plus/sensors_plus.dart';

class SlimeFallGame extends FlameGame with HasCollisionDetection {
  // Interval to repeat platform spawning.
  Timer interval = Timer(Config.platformInterval, repeat: true);
  final Slime slime = Slime();
  double gyroX = 0;
  double gyroY = 0;

  @override
  Future<void> onLoad() async {
    final int fullSize = (size.y * 1.55).toInt();
    const int initialSpawnPoint = 280;
    const int spawnInterval = 120;

    final int amountOfInitialPlatforms = ((fullSize - initialSpawnPoint) / spawnInterval).toInt();

    addAll([
      Background(),
      slime,
      SpikeGroup(Position.left),
      SpikeGroup(Position.right),
      TopHitbox(),
    ]);

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
    final StreamSubscription _gyroscopeSubscription = gyroscopeEventStream().listen((GyroscopeEvent event) {
      gyroX += event.y * Config.slimeSensitivity; // event.y is rotation around the y-axis (left-right)
      //gyroY += event.x; // event.x is rotation around the x-axis (up-down)
    });
  }

  @override
  void update(double dt) {
    super.update(dt);
    // Check if interval has surpassed on game ticks. If surpassed will call the function in onLoad
    interval.update(dt);

    slime.position.x += gyroX * dt;
  }
}