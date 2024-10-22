import 'dart:async';
import 'dart:ui';
import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:slime_fall/game/constants/assets.dart';
import 'package:slime_fall/game/constants/configuration.dart';
import 'package:slime_fall/game/constants/position.dart';
import 'package:slime_fall/game/slime_fall_game.dart';

class Platform extends SpriteComponent with HasGameRef<SlimeFallGame>  {

  // Constructor with required parameters
  Platform({
    required this.width,
    required this.platformPosition
  });

  @override
  // Properties
  final double width;
  final Position platformPosition;

  @override
  Future<void> onLoad() async {
    final Image platform = await Flame.images.load(Assets.platform);

    sprite = Sprite(platform);
    size = Vector2(width, Config.platformHeight);
    
    switch (platformPosition) {
      case Position.left:
        position.x = 0;
        break;
      case Position.right:
        // Look for right screen position with gameRef and subtract the x size of the platform to get the correct position.
        final double positionX = gameRef.size.x - size.x;
        position.x = positionX;
        break;
    }

    // Collision hitbox
    add(RectangleHitbox());
  }
}
