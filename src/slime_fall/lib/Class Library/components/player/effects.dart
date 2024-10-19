import 'package:flame/components.dart';
import 'package:flame/effects.dart';
import 'package:flame/particles.dart';
import 'package:flutter/material.dart';
import 'package:slime_fall/Constants/configuration.dart';

class SlimeEffects {

  // Creates a mirror image of the slime as a trail.
  static SpriteComponent createDashEffect(Vector2 position, Sprite slime) {
      final trail = SpriteComponent(
      sprite: slime,
      position: Vector2(position.x + Config.slimeSizeFalling.x / 2, position.y),
      size: Config.slimeSizeFalling,
      anchor: Anchor.center,
    );

    // Fade out the trail.
    trail.add(
      OpacityEffect.fadeOut(
        EffectController(duration: 0.3), // Trail fades over 0.3 seconds
      ),
    );
    return trail;
  }

  // Creates blue particles when dashing.
  static ParticleSystemComponent createDashParticles(Vector2 position) {
    final particleComponent = ParticleSystemComponent(
      particle: Particle.generate(
        count: 100, 
        lifespan: 0.4, 
        generator: (i) => AcceleratedParticle(
          acceleration: Vector2(0, 500), 
          speed: Vector2.random() * 100, 
          position: Vector2(position.x, position.y), 
          child: CircleParticle(
            radius: 5.0,
            paint: Paint()..color = Colors.lightBlue.withOpacity(0.1),
          ),
        ),
      ),
    );
    return particleComponent;
  }
}