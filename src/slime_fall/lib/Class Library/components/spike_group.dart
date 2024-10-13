import 'package:flame/components.dart';
import 'package:slime_fall/Constants/configuration.dart';
import 'package:slime_fall/Constants/position.dart';
import 'package:slime_fall/class%20library/components/spike.dart';
import 'package:slime_fall/class%20library/game/slime_fall_game.dart';

class SpikeGroup extends PositionComponent with HasGameRef<SlimeFallGame> {
  final Position spikePosition;
  
  SpikeGroup(this.spikePosition);

  @override
  Future<void> onLoad() async {
    final double spikeHeight = Config.spikeSize.y;
    final double gameHeight = gameRef.size.y;
    final int amountOfSpike = (gameHeight / spikeHeight).toInt() * 2;
    final Set<Spike> components = {};

    for (int spike = 1; spike <= amountOfSpike; spike++)
    {
     components.add(Spike(spikePosition: spikePosition, positionY: spike * spikeHeight));
    }

    addAll(components);
  }
}