import 'dart:async';
import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:slime_fall/class%20library/game/slime_fall_game.dart';

class TopHitbox extends RectangleComponent with HasGameRef<SlimeFallGame> {
  @override
  FutureOr<void> onLoad() async {
    final double width = gameRef.size.x;
    size = Vector2(width, 2);
    position = Vector2(0, 0);
    opacity = 0;

    add(RectangleHitbox());
  }
}