import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:slime_fall/Constants/assets.dart';
import 'package:slime_fall/class%20library/game/slime_fall_game.dart';

class Background extends SpriteComponent with HasGameRef<SlimeFallGame> { 

  // constructor
  Background();

  @override
  Future<void> onLoad() async{
    final background = await Flame.images.load(Assets.background);

    // Haalt de grote van scherm uit de game reference mixin (HasGameRef<SlimeFallGame>). 
    // Deze mixin zal ons toegang geven tot verschillende properties van de game.
    size = gameRef.size;
    sprite = Sprite(background);
  }
}