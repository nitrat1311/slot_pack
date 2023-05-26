library slot_package;

import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:slot_package/slot_pack/game/shooter_game.dart';
import 'package:slot_package/slot_pack/widgets/overlays/game_over_menu.dart';
import 'package:slot_package/slot_pack/widgets/overlays/pause_button.dart';
import 'package:slot_package/slot_pack/widgets/overlays/pause_menu.dart';

class RogueShooterWidget extends StatelessWidget {
  const RogueShooterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WillPopScope(
        onWillPop: () async => false,
        child: GameWidget(
          game: RogueShooterGame(),
          loadingBuilder: (_) => const Center(
            child: Text('Loading'),
          ),
          initialActiveOverlays: const [PauseButton.id],
          overlayBuilderMap: {
            PauseButton.id: (BuildContext context, RogueShooterGame gameRef) =>
                PauseButton(
                  gameRef: gameRef,
                ),
            PauseMenu.id: (BuildContext context, RogueShooterGame gameRef) =>
                PauseMenu(
                  gameRef: gameRef,
                ),
            GameOverMenu.id: (BuildContext context, RogueShooterGame gameRef) =>
                GameOverMenu(
                  gameRef: gameRef,
                ),
          },
        ),
      ),
    );
  }
}
