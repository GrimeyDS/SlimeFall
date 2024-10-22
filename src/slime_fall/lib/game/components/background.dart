import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import 'package:slime_fall/game/constants/assets.dart';
import 'package:flame/parallax.dart';
import 'package:slime_fall/game/constants/configuration.dart';
import 'package:slime_fall/game/slime_fall_game.dart';

class Background extends ParallaxComponent<SlimeFallGame> { 

  @override
  Future<void> onLoad() async{
      parallax = await game.loadParallax(
      [
        ParallaxImageData(Assets.background),
      ],
      // Make sure to repeat on y-axis or a black background will persist after the first scrolling
      repeat: ImageRepeat.repeatY,
      // Set Speed
      baseVelocity: Vector2(0, Config.backgroundScrollSpeed),
    );
  }
}