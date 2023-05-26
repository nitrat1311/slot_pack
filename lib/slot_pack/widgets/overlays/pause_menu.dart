library slot_package;

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:slot_package/slot_pack/game/shooter_game.dart';
import 'package:slot_package/slot_pack/game_menu.dart';

import 'package:slot_package/const_colors.dart';
import 'package:slot_package/slot_pack/widgets/overlays/pause_button.dart';

// This class represents the pause menu overlay.
class PauseMenu extends StatelessWidget {
  static const String id = 'PauseMenu';
  final RogueShooterGame gameRef;

  const PauseMenu({Key? key, required this.gameRef}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Pause menu title.
          Padding(
            padding: REdgeInsets.symmetric(vertical: 70.0),
            child: Stack(children: [
              Text(
                'Paused',
                style: TextStyle(
                    fontSize: 50.sp,
                    letterSpacing: 5.0,
                    foreground: Paint()
                      ..style = PaintingStyle.stroke
                      ..strokeWidth = 4
                      ..color = AppColors.backColor,
                    fontWeight: FontWeight.w700),
              ),
              Text(
                'Paused',
                style: TextStyle(
                    fontSize: 50.sp,
                    letterSpacing: 5.0,
                    foreground: Paint()
                      ..style = PaintingStyle.fill
                      ..strokeWidth = 1
                      ..color = AppColors.frontColor,
                    fontWeight: FontWeight.w700),
              ),
            ]),
          ),

          // Resume button.
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.transparent, width: 4),
                  borderRadius: AppColors.borderRadius,
                ),
                child: FloatingActionButton.large(
                  shape: const BeveledRectangleBorder(
                      borderRadius: AppColors.borderRadius,
                      side: BorderSide(
                          width: 3, color: AppColors.textButtonMenu)),
                  backgroundColor: AppColors.backColor,
                  onPressed: () {
                    gameRef.resumeEngine();
                    gameRef.overlays.remove(PauseMenu.id);
                    gameRef.overlays.add(PauseButton.id);
                  },
                  child: const Icon(
                    Icons.play_arrow_sharp,
                    color: AppColors.textButtonMenu,
                  ),
                ),
              ),

              // Restart button.
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.transparent, width: 4),
                  borderRadius: AppColors.borderRadius,
                ),
                child: FloatingActionButton.large(
                  backgroundColor: AppColors.backColor,
                  shape: const BeveledRectangleBorder(
                      borderRadius: AppColors.borderRadius,
                      side: BorderSide(
                          width: 3, color: AppColors.textButtonMenu)),
                  onPressed: () {
                    gameRef.overlays.remove(PauseMenu.id);
                    gameRef.overlays.add(PauseButton.id);
                    gameRef.reset();
                    gameRef.resumeEngine();
                  },
                  child: const Icon(
                    Icons.restart_alt_rounded,
                    color: AppColors.textButtonMenu,
                  ),
                ),
              ),
            ],
          ),

          // Exit button.
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.transparent, width: 4),
              borderRadius: AppColors.borderRadius,
            ),
            margin: REdgeInsets.only(top: 10),
            child: FloatingActionButton.large(
              backgroundColor: AppColors.backColor,
              shape: const BeveledRectangleBorder(
                  borderRadius: AppColors.borderRadius,
                  side: BorderSide(width: 3, color: AppColors.textButtonMenu)),
              elevation: 20,
              onPressed: () {
                gameRef.overlays.remove(PauseMenu.id);
                // gameRef.overlays.remove(PauseMenu.id);
                gameRef.removeFromParent();
                gameRef.pauseEngine();

                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => const GameMenu(),
                  ),
                );
              },
              child: const Icon(
                Icons.exit_to_app_sharp,
                color: AppColors.textButtonMenu,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
