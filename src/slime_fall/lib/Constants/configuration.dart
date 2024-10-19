import 'package:flame/components.dart';

class Config {
  // Spike
  static final Vector2 spikeSize = Vector2(10, 20);

  // Slime
  static const double slimeSensitivity = 225;
  static final Vector2 slimeSize = Vector2(35, 20);
  static final Vector2 slimeSizeFalling = Vector2(20, 35);
  static final Vector2 velocity = Vector2(0, 500); // How fast the player moves down when not under a platform.
  static const double dashDistance = platformHeight * 2;
  static const double dashCooldown = 5;

  // Platforms
  static const double scrollSpeed = 150.0;
  static const double platformHeight = 25.0;
  static const double platformInterval = 1;
  static final double platformSpacing = slimeSize.x * 1.3;

  // Background
  static const double backgroundScrollSpeed = 100.0;

  // Overlays
  static const String dashCooldownOverlay = 'DashCooldownOverlay';
  static const String scoreOverlay = 'ScoreOverlay';
}