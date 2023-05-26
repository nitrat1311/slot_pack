import 'dart:math';

import 'package:flame/components.dart';
import 'package:pilot_legend_avia/game/components/enemy_component.dart';

class EnemyCreator extends TimerComponent with HasGameRef {
  final Random random = Random();
  final _halfWidth = EnemyComponent.initialSize.x / 2;

  EnemyCreator() : super(period: 0.8, repeat: true);

  @override
  void onTick() {
    final positionY = gameRef.size.y;
    gameRef.addAll(
      List.generate(
        5,
        (index) => EnemyComponent(
          position: Vector2(
            _halfWidth + (gameRef.size.x - _halfWidth) * random.nextDouble(),
            positionY,
          ),
        ),
      ),
    );
  }
}
