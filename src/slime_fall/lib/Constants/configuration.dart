import 'package:flame/components.dart';

class Config {
  static Vector2 birdSize = Vector2(80, 80);
  static Vector2 spikeSize = Vector2(30, 20);

  static const double scrollSpeed = 80.0;
  static const double backgroundScrollSpeed = 100.0;
  static const double platformHeight = 25.0;
  static const double platformInterval = 1.4;
  static double platformSpacing = birdSize.x * 1.3;
}