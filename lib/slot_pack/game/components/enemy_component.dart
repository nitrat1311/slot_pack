import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:pilot_legend_avia/game/components/explosion_component.dart';

import '../shooter_game.dart';

class EnemyComponent extends SpriteAnimationComponent
    with HasGameRef<RogueShooterGame>, CollisionCallbacks {
  static const speed = 150;
  static Vector2 initialSize = Vector2.all(35);
  // int hp = 5;
  EnemyComponent({required super.position})
      : super(size: initialSize, anchor: Anchor.center);

  @override
  Future<void> onLoad() async {
    animation = await gameRef.loadSpriteAnimation(
      'shooter/enemy.png',
      SpriteAnimationData.sequenced(
        stepTime: 0.2,
        amount: 4,
        textureSize: Vector2.all(16),
      ),
    );
    add(CircleHitbox()..collisionType = CollisionType.passive);
  }

  @override
  void update(double dt) {
    super.update(dt);

    position.clamp(
      Vector2.zero() + size / 2,
      gameRef.size - size / 2,
    );

    y -= speed * dt;
    if (y <= 50) {
      removeFromParent();
    }
  }

  void takeHit() {
    // hp -= 1;
    // if (hp == 0) {
    removeFromParent();
    // }

    gameRef.add(ExplosionComponent(position: position));
    gameRef.increaseScore();
  }
}
