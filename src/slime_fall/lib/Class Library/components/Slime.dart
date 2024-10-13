import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:slime_fall/Constants/assets.dart';
import 'package:slime_fall/Constants/configuration.dart';
import 'package:slime_fall/Constants/slime_movement.dart';
import 'package:slime_fall/class%20library/game/slime_fall_game.dart';

class Slime extends SpriteGroupComponent<SlimeMovement> 
  with HasGameRef<SlimeFallGame>, CollisionCallbacks {
  bool isOnPlatform = false;
  
  @override
  Future<void> onLoad() async {
    // Retrieve sprites.
    final Sprite slimeIdle = await gameRef.loadSprite(Assets.slimeIdle);
    final Sprite slimeWalkLeft = await gameRef.loadSprite(Assets.slimeWalkLeft);
    final Sprite slimeWalkRight = await gameRef.loadSprite(Assets.slimeWalkRight);
    final Sprite slimeInAir = await gameRef.loadSprite(Assets.slimeInAir);

    size = Config.slimeSize;

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
    final double xStartingPosistion = gameRef.size.x / 2 - size.x /2;
    position = Vector2(xStartingPosistion, 100);

    add(CircleHitbox());
  }

  @override
  void update(double dt) {
    super.update(dt);
    

    // Add gravity to slime
    if (!isOnPlatform) {
      position.y += Config.velocity.y * dt;
    }
    else {
      position.y -= Config.scrollSpeed * dt;
    }
  }

  @override
  void onCollisionStart(Set<Vector2> intersectionPoints, PositionComponent other) {
    super.onCollisionStart(intersectionPoints, other);
    isOnPlatform = true;
  }

  @override 
  void onCollisionEnd(PositionComponent other) {
    super.onCollisionEnd(other);
    isOnPlatform = false;
  }
}