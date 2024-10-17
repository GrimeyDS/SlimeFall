import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:slime_fall/Constants/assets.dart';
import 'package:slime_fall/Constants/configuration.dart';
import 'package:slime_fall/Constants/slime_movement.dart';
import 'package:slime_fall/class%20library/components/platform/platform_group.dart';
import 'package:slime_fall/class%20library/game/slime_fall_game.dart';

class Slime extends SpriteGroupComponent<SlimeMovement> 
  with HasGameRef<SlimeFallGame>, CollisionCallbacks {
  bool isOnPlatform = false;
  double lastPosition = 0;
  
  @override
  Future<void> onLoad() async {
    // Retrieve sprites.
    final Sprite slimeIdle = await gameRef.loadSprite(Assets.slimeIdle);
    final Sprite slimeWalkLeft = await gameRef.loadSprite(Assets.slimeWalkLeft);
    final Sprite slimeWalkRight = await gameRef.loadSprite(Assets.slimeWalkRight);
    final Sprite slimeInAir = await gameRef.loadSprite(Assets.slimeInAir);

    size = Config.slimeSizeFalling;

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
    final double xStartingPosition = gameRef.size.x / 2 - size.x /2;
    position = Vector2(xStartingPosition, 100);
    lastPosition = xStartingPosition;

    // Collision hitbox
    add(CircleHitbox());
  }

  @override
  void update(double dt) {
    super.update(dt);
    
    updateSlimeState(dt);
  }

  void updateSlimeState(double dt) {
    if (!isOnPlatform) {
      // Set speed to gravity speed.
      position.y += Config.velocity.y * dt;
      setFallingSlime();
    }
    else {
      // Set to speed of the platforms so it stays on the platform it collided with.
      double newPosition = Config.scrollSpeed * dt;
      position.y -= newPosition;
      setPlatformSlime(newPosition);
      lastPosition = newPosition;
    }
  }

  void setFallingSlime() {
      current = SlimeMovement.down;
      size = Config.slimeSizeFalling;
  }

  void setPlatformSlime(double newPosition) {
      size = Config.slimeSize;

      // Change sprite image depending on movement.
      // A treshold that ensures the change between newPosition and lastPosition is significant enough before updating the movement state.
      double deathZoneMovement = 0.005;
      
      if (newPosition < lastPosition - deathZoneMovement) {
        current = SlimeMovement.left;
      }
      else if (newPosition > lastPosition + deathZoneMovement) {
        current = SlimeMovement.right;
      }
      else {
        current = SlimeMovement.idle;
      }
  }

  // Trigger collision:
  @override
  void onCollisionStart(Set<Vector2> intersectionPoints, PositionComponent other) {
    super.onCollisionStart(intersectionPoints, other);


    // Checking on type (eg. other is Platform) does not work due to group wrapper.
    final type = other.runtimeType.toString();

    switch (type) {
      case 'Platform':
        // Set slime position to platform group's y position so that slime always lands on platform instead of sometimes bugging out through platform.
        // We need to find the platform group's y position by retrieving the platform's parent and getting it's size. 
        PlatformGroup plat = other.parent as PlatformGroup;
        double platformSize = other.size.y;
        position.y = plat.position.y - platformSize / 2;

        isOnPlatform = true;
        break;
      default:
        gameRef.pauseEngine();
        break;
    }
  }

  @override 
  void onCollisionEnd(PositionComponent other) {
    super.onCollisionEnd(other);
    isOnPlatform = false;
  }
}
