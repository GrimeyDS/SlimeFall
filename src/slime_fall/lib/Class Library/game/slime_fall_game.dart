import 'package:flame/game.dart';
import 'package:slime_fall/class%20library/components/background.dart';
import 'package:slime_fall/class%20library/components/slime.dart';

class SlimeFallGame extends FlameGame {
  @override
  Future<void> onLoad() async {
    addAll([
      Background(),
      Slime()
    ]);
  }
}