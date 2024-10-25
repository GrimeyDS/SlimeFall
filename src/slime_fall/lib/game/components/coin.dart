import 'package:flame/components.dart';
import 'package:flame/collisions.dart';
import 'package:slime_fall/game/slime_fall_game.dart';

class Coin extends SpriteAnimationComponent with HasGameRef<SlimeFallGame> {

  @override
  Future<void> onLoad() async {
    final sprites = [1, 2, 3, 4, 5, 6 ,7 ,8, 9, 10]
        .map((i) => Sprite.load('coin_$i.png'));


    animation = SpriteAnimation.spriteList(
      await Future.wait(sprites),
      stepTime: 0.1,
      loop: true,
    );

    size = Vector2(32, 32);
    
    add(CircleHitbox());
  }
}
