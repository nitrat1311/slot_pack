import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';

import '../widgets/overlays/game_over_menu.dart';
import '../widgets/overlays/pause_button.dart';
import 'ally_manager.dart';
import 'components/enemy_component.dart';
import 'components/enemy_creator.dart';
import 'components/health_bar.dart';
import 'components/player_component.dart';
import 'components/star_background_creator.dart';

class RogueShooterGame extends FlameGame
    with PanDetector, HasCollisionDetection {
  late final PlayerComponent player;
  late final TextComponent scoreText;

  int score = 0;

  @override
  Future<void> onLoad() async {
    add(player = PlayerComponent());
    add(scoreText = TextComponent(
      position: size - Vector2(0, 25),
      anchor: Anchor.bottomRight,
      priority: 1,
    ));

    add(AllyManager());
    add(EnemyCreator());
    add(StarBackGroundCreator());
    add(HealthBar(player: player, position: Vector2(0, 600)));
  }

  @override
  void update(double dt) {
    super.update(dt);
    scoreText.text = 'Score: $score';

    if (player.health <= 0 && (!camera.shaking)) {
      pauseEngine();
      score = 0;
      overlays.remove(PauseButton.id);
      overlays.add(GameOverMenu.id);
      player.reset();
    }
  }

  void reset() {
    // First reset player, enemy manager and power-up manager .

    // _enemyManager.reset();
    score = 0;
    children.whereType<EnemyComponent>().forEach((enemy) {
      enemy.removeFromParent();
    });
  }

  @override
  void onPanStart(_) {
    player.beginFire();
  }

  @override
  void onPanEnd(_) {
    player.stopFire();
  }

  @override
  void onPanCancel() {
    player.stopFire();
  }

  @override
  void onPanUpdate(DragUpdateInfo details) {
    player.position += details.delta.game;
  }

  void increaseScore() {
    score++;
  }
}
