import 'dart:math';
import 'package:flame/components.dart';
import 'package:slime_fall/Constants/configuration.dart';
import 'package:slime_fall/Constants/position.dart';
import 'package:slime_fall/class%20library/components/platform.dart';
import 'package:slime_fall/class%20library/game/slime_fall_game.dart';

class PlatformGroup extends PositionComponent with HasGameRef<SlimeFallGame> {
  double? startingPosition;
  
  PlatformGroup(double? positionY)
  {
    startingPosition = positionY;
  }

  @override
  Future<void> onLoad() async {
    // Set position to edge of bottom
    if (startingPosition == null) {
      position.y = gameRef.size.y;
    }
    else {
      position.y = startingPosition as double;
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