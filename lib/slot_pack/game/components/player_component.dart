import 'package:flame/collisions.dart';
import 'package:flame/components.dart';

import 'package:flutter/material.dart';

import 'package:slot_package/const_colors.dart';
import '../ally.dart';
import 'bullet_component.dart';
import 'enemy_component.dart';
import 'explosion_component.dart';

class PlayerComponent extends SpriteAnimationComponent
    with HasGameRef, CollisionCallbacks {
  late TimerComponent bulletCreator;
  int _health = 100;
  int _currentScore = 0;
  int get health => _health;

  int get score => _currentScore;

  PlayerComponent()
      : super(
          size: Vector2(50, 75),
          position: Vector2(200, 0),
          anchor: Anchor.center,
        );

  BuildContext get context => gameRef.buildContext!;

  @override
  void onMount() async {
    super.onMount();

    // Adding a circular hitbox with radius as 0.8 times
    // the smallest dimension of this components size.
    final shape = RectangleHitbox.relative(
      Vector2(0.8, .8),
      parentSize: size * 1,
      position: Vector2(size.x / 2, size.y / 2),
      anchor: Anchor.center,
    );
    add(shape);
  }

  @override
  Future<void> onLoad() async {
    add(CircleHitbox());
    add(
      bulletCreator = TimerComponent(
        period: 0.3,
        repeat: true,
        autoStart: false,
        onTick: _createBullet,
      ),
    );
    gameRef.images.prefix = '';
    animation = await gameRef.loadSpriteAnimation(
      'packages/${AppColors.myPackage}/assets/images/player.png',
      SpriteAnimationData.sequenced(
        stepTime: 0.2,
        amount: 4,
        textureSize: Vector2(32, 39),
      ),
    );
  }

  final _bulletAngles = [-0.1, 0.1, -0.2, 0.2];
  void _createBullet() {
    gameRef.addAll(
      _bulletAngles.map(
        (angle) => BulletComponent(
          position: position - Vector2(5, -size.y / 2),
          angle: angle,
        ),
      ),
    );
  }

  @override
  void update(double dt) {
    super.update(dt);
    position.clamp(
      Vector2.zero() + size / 2,
      gameRef.size - size / 2,
    );
  }

  void beginFire() {
    // bulletCreator.timer.start();
  }

  void stopFire() {
    // bulletCreator.timer.pause();
  }

  void takeHit() {
    gameRef.add(ExplosionComponent(position: position));
  }

  void reset() {
    // _playerData.currentScore = 0;
    _health = 100;
    position = Vector2(200, 50);
    // position = gameRef.size / 2;
  }

  void addToScore(int points) {
    _currentScore = points;
  }

  @override
  void onCollisionStart(Set<Vector2> points, PositionComponent other) {
    super.onCollisionStart(points, other);
    if (other is EnemyComponent) {
      _health -= 10;
      if (_health <= 0) {
        _health = 0;
      }
      other.takeHit();
    }
    if (other is Ally) {
      // _health += 50;
      bulletCreator.timer.start();
      Future.delayed(const Duration(milliseconds: 500))
          .then((value) => bulletCreator.timer.pause());
    }
  }
}
