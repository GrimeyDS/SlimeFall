import 'dart:ui';
import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:slime_fall/Constants/assets.dart';
import 'package:slime_fall/Constants/configuration.dart';
import 'package:slime_fall/Constants/position.dart';
import 'package:slime_fall/class%20library/game/slime_fall_game.dart';

class Spike extends SpriteComponent with HasGameRef<SlimeFallGame> {
  final Position spikePosition;
  final double positionY;
  
  Spike({required this.spikePosition, required this.positionY});

  @override
  Future<void> onLoad() async {
    size = Config.spikeSize;
    position.y = positionY / 2;

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
  }
}