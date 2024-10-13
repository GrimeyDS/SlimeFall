import 'package:flame/components.dart';

class Config {
  static Vector2 slimeSize = Vector2(35, 20);
  static Vector2 spikeSize = Vector2(25, 35);

  static const double scrollSpeed = 80.0;
  static const double backgroundScrollSpeed = 100.0;
  static const double platformHeight = 25.0;
  static const double platformInterval = 1.4;
  static double platformSpacing = slimeSize.x * 1.3;

  // How fast the player moves down when not under a platform.
  static Vector2 velocity = Vector2(0, 500);
}