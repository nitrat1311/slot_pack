import 'package:pilot_legend_avia/game/components/enemy_component.dart';
import 'package:pilot_legend_avia/game/components/health_bar.dart';
import 'package:pilot_legend_avia/game/records/bloc/records_bloc.dart';
import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:pilot_legend_avia/game/components/enemy_creator.dart';
import 'package:pilot_legend_avia/game/components/player_component.dart';
import 'package:pilot_legend_avia/game/components/star_background_creator.dart';

import '../widgets/overlays/game_over_menu.dart';
import '../widgets/overlays/pause_button.dart';
import 'ally_manager.dart';

class RogueShooterGame extends FlameGame
    with PanDetector, HasCollisionDetection {
  late final PlayerComponent player;
  late final TextComponent scoreText;
  final RecordsBloc recordsBloc;
  int score = 0;
  RogueShooterGame({required this.recordsBloc});
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
    recordsBloc.saveRecord(player.score);
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
