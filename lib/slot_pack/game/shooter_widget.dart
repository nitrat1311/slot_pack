import 'package:pilot_legend_avia/game/records/bloc/records_bloc.dart';
import 'package:pilot_legend_avia/game/shooter_game.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../widgets/overlays/game_over_menu.dart';
import '../widgets/overlays/pause_button.dart';
import '../widgets/overlays/pause_menu.dart';

class RogueShooterWidget extends StatelessWidget {
  const RogueShooterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WillPopScope(
        onWillPop: () async => false,
        child: GameWidget(
          game: RogueShooterGame(recordsBloc: context.recordsBloc),
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
