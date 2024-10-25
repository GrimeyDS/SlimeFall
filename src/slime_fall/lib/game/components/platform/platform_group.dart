import 'dart:math';
import 'package:flame/components.dart';
import 'package:slime_fall/game/constants/configuration.dart';
import 'package:slime_fall/game/constants/position.dart';
import 'package:slime_fall/game/components/platform/platform.dart';
import 'package:slime_fall/game/slime_fall_game.dart';

class PlatformGroup extends PositionComponent with HasGameRef<SlimeFallGame> {
  final int startingPosition;
  
  PlatformGroup(this.startingPosition);

  @override
  Future<void> onLoad() async {
    // Set position to edge of bottom
    if (startingPosition == 0) {
      position.y = gameRef.size.y * 1.5;
    }
    else {
      position.y = startingPosition.toDouble();
    }

    final double screenWidth = gameRef.size.x;
    final double gapPosition = getRandomGapPosition(screenWidth);

    // This is the width from the left edge of the screen to the start of the gap (calculated as the center of the gap minus half the gap spacing).
    final double leftPlatformWidth = gapPosition - Config.platformSpacing / 2;
    // This is the width from the end of the gap (center of the gap plus half the gap spacing) to the right edge of the screen. 
    final double rightPlatformWidth = screenWidth - (gapPosition + Config.platformSpacing / 2);

    addAll([
      Platform(width: leftPlatformWidth, platformPosition: Position.left),
      Platform(width: rightPlatformWidth, platformPosition: Position.right)
    ]);
  }

  @override
  void update(double dt) {
    super.update(dt);
    // Position of the group will change with the speed of the game. dt => ticks from the Flame Game.
    position.y -= Config.scrollSpeed * dt;

    if (position.y < - 10) removeFromParent();
  }
}

double getRandomGapPosition(double screenWidth) {
  final Random random = Random();

  // Minimum and maximum positions for the center of the gap
  final double minPosition = Config.platformSpacing / 2;
  final double maxPosition = screenWidth - Config.platformSpacing / 2;

  // Calculate the center of the gap randomly
  return minPosition + random.nextDouble() * (maxPosition - minPosition);
}