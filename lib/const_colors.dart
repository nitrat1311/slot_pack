library slot_package;

import 'package:flutter/material.dart';
// import 'package:neon/neon.dart';

class AppColors {
  static const appLable = 'Space Fight';
  static const myPackage = 'slot_package';
  static const glowingDuration = Duration(milliseconds: 4500);
  static const backColor = Color.fromRGBO(222, 0, 4, 1); //any colors
  static const frontColor = Color.fromRGBO(8, 84, 236, 1); //any colors
  static const buttonColor =
      Colors.deepOrange; //[Colors. red,pink,purple,deepPurple,
  //indigo,blue,lightBlue,cyan,teal,green,lightGreen,lime,yellow,amber,orange,deepOrange,brown,blueGrey]
  static const double randomPadding = 24.5; //20-40 limit
  static const textButtonMenu = Colors.black;
  static const borderRadius =
      BorderRadius.all(Radius.circular(randomPadding * 1.9));
  static const pauseAlihnment = Alignment(-randomPadding / 45, -.8);
  static const startAlihnment = Alignment(randomPadding / 45, 0.8);
  static const double scoreY = randomPadding * 10;
  static const double scoreX1 = (-0.5);
  static const double scoreX2 = (500);
  static const buttonShape = ContinuousRectangleBorder(
      borderRadius: AppColors.borderRadius,
      side: BorderSide(
          width: randomPadding / 5, color: Color.fromARGB(255, 3, 3, 73)));
}
