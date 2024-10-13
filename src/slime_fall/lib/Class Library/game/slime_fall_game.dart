import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:slime_fall/Constants/configuration.dart';
import 'package:slime_fall/class%20library/components/background.dart';
import 'package:slime_fall/class%20library/components/platform_group.dart';
import 'package:slime_fall/class%20library/components/slime.dart';

class SlimeFallGame extends FlameGame {
  // Interval to repeat platform spawning.
  Timer interval = Timer(Config.platformInterval, repeat: true);

  @override
  Future<void> onLoad() async {
    addAll([
      Background(),
      Slime(),
      // Added manual platforms for initial spawns.
      PlatformGroup(400),
      PlatformGroup(520),
      PlatformGroup(640),
      PlatformGroup(760),
      PlatformGroup(880),
    ]);

    // Spawn new platform
    interval.onTick = () => add(PlatformGroup(null));
  }

  @override
  void update(double dt) {
    super.update(dt);
    // Check if interval has surpassed on game ticks. If surpassed will call the function in onLoad
    interval.update(dt);
  }
}