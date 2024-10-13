import 'package:flame/components.dart';
import 'package:slime_fall/Constants/assets.dart';
import 'package:slime_fall/Constants/configuration.dart';
import 'package:slime_fall/Constants/slime_movement.dart';
import 'package:slime_fall/class%20library/game/slime_fall_game.dart';

class Slime extends SpriteGroupComponent<SlimeMovement> with HasGameRef<SlimeFallGame> {

  @override
  Future<void> onLoad() async {
    // Retrieve sprites.
    final slimeIdle = await gameRef.loadSprite(Assets.slimeIdle);
    final slimeWalkLeft = await gameRef.loadSprite(Assets.slimeWalkLeft);
    final slimeWalkRight = await gameRef.loadSprite(Assets.slimeWalkRight);
    final slimeInAir = await gameRef.loadSprite(Assets.slimeInAir);

    size = Config.birdSize;

    // Assign the sprites to the group component.
    sprites =  {
      SlimeMovement.idle: slimeIdle,
      SlimeMovement.left: slimeWalkLeft,
      SlimeMovement.right: slimeWalkRight,
      SlimeMovement.up: slimeInAir,
      SlimeMovement.down: slimeInAir
    };

    // Default state.
    current = SlimeMovement.idle;

    // Half of screen - bird x size
    final xStartingPosistion = gameRef.size.x / 2 - size.x /2;
    position = Vector2(xStartingPosistion, 100);
  }
}