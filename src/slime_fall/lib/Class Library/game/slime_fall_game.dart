import 'package:flame/game.dart';
import 'package:slime_fall/class%20library/components/background.dart';

class SlimeFallGame extends FlameGame {

  @override
  Future<void> onLoad() async {
    add(Background());
  }
}