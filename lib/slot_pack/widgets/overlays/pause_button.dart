library slot_package;

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:slot_package/const_colors.dart';
import 'package:slot_package/slot_pack/game/shooter_game.dart';
import 'package:slot_package/slot_pack/widgets/overlays/pause_menu.dart';

// This class represents the pause button overlay.
class PauseButton extends StatelessWidget {
  static const String id = 'PauseButton';
  final RogueShooterGame gameRef;

  const PauseButton({Key? key, required this.gameRef}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AppColors.pauseAlihnment,
      child: TextButton(
        style: ButtonStyle(
          shadowColor: const MaterialStatePropertyAll<Color>(Colors.black),
          elevation: MaterialStateProperty.all(15),
          shape: MaterialStateProperty.all(
            AppColors.buttonShape,
          ),
          side: MaterialStateProperty.all(
            const BorderSide(
              color: AppColors.buttonColor,
              width: 3,
            ),
          ),
          backgroundColor:
              const MaterialStatePropertyAll<Color>(AppColors.backColor),
        ),
        child: SizedBox(
          // height: 80.h,
          // width: 80.w,
          child: Text('Stop',
              style: TextStyle(
                color: AppColors.textButtonMenu,
                fontSize: 30.h,
              )),
        ),
        onPressed: () {
          gameRef.pauseEngine();
          gameRef.overlays.add(PauseMenu.id);
          gameRef.overlays.remove(PauseButton.id);
        },
      ),
    );
  }
}
