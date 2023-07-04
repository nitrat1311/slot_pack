import 'package:flutter/material.dart';

class AppColors {
  static const appLable = 'Sporty - ivibet';
  static const myPackage = 'slot_package';
  static const backColor = Color.fromARGB(208, 98, 198, 4); //any colors
  static const frontColor = Color.fromARGB(255, 240, 107, 229); //any colors
  static const buttonColor = Color.fromRGBO(136, 191, 225, 0.682);
  static const double randomPadding = 37.5; //20-40 limit
  static const textButtonMenu = Colors.black;
  static const borderRadius = BorderRadius.all(
      Radius.elliptical(randomPadding * 1.9, randomPadding - 10));
  static const pauseAlihnment = Alignment(-randomPadding / 45, -.8);
  static const startAlihnment = Alignment(randomPadding / 45, 0.8);
  static const double scoreY = randomPadding * 10;
  static const double scoreX1 = (0.5);
  static const double scoreX2 = (100);
  static const buttonShape = ContinuousRectangleBorder(
      borderRadius: AppColors.borderRadius,
      side: BorderSide(
          width: randomPadding / 5, color: Color.fromARGB(255, 3, 3, 73)));
  static const textColorInsideGame = Color.fromARGB(255, 253, 173, 119);
}
