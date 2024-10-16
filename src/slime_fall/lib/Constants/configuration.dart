import 'package:flame/components.dart';

class Config {
  // Spike
  static Vector2 spikeSize = Vector2(15, 25);

  // Slime
  static double slimeSensitivity = 225;
  static Vector2 slimeSize = Vector2(35, 20);
  static Vector2 velocity = Vector2(0, 500); // How fast the player moves down when not under a platform.

  // Platforms
  static const double scrollSpeed = 150.0;
  static const double platformHeight = 25.0;
  static const double platformInterval = 1;
  static double platformSpacing = slimeSize.x * 1.3;

  // Background
  static const double backgroundScrollSpeed = 100.0;
}