import 'dart:ui';
import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:slime_fall/game/constants/assets.dart';
import 'package:slime_fall/game/constants/configuration.dart';
import 'package:slime_fall/game/constants/position.dart';
import 'package:slime_fall/game/slime_fall_game.dart';

class Spike extends SpriteComponent with HasGameRef<SlimeFallGame> {
  final Position spikePosition;
  final double positionY;
  
  Spike({required this.spikePosition, required this.positionY});

  @override
  Future<void> onLoad() async {
    size = Config.spikeSize;
    position.y = positionY;

    switch (spikePosition) {
      case Position.left:
        final Image leftSpike = await Flame.images.load(Assets.leftSpike);
        sprite = Sprite(leftSpike);
        
        position.x = 0;
        break;
      case Position.right:
        final Image rightSpike = await Flame.images.load(Assets.rightSpike);
        sprite = Sprite(rightSpike);

        final double positionX = gameRef.size.x - size.x;
        position.x = positionX;
        break;
    }

    // Collision hitbox
    add(RectangleHitbox());
  }
}