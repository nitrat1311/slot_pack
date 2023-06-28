library slot_package;

import 'package:flutter/material.dart';
// import 'package:neon/neon.dart';

class AppColors {
  static const appLable = 'Sports Reflex';
  static const myPackage = 'slot_package';
  static const glowingDuration = Duration(milliseconds: 4500);
  static const backColor = Color.fromRGBO(25, 5, 180, 1); //any colors
  static const frontColor = Color.fromRGBO(247, 0, 247, 1); //any colors
  static const buttonColor = Colors.pink; //[Colors. red,pink,purple,deepPurple,
  //indigo,blue,lightBlue,cyan,teal,green,lightGreen,lime,yellow,amber,orange,deepOrange,brown,blueGrey]
  static const double randomPadding = 28.5; //20-40 limit
  static const textButtonMenu = Colors.white;
  static const borderRadius = BorderRadius.all(
      Radius.elliptical(randomPadding * 1.9, randomPadding - 10));
  // static const neonFont = NeonFont.LasEnter;
  static const pauseAlihnment = Alignment(-randomPadding / 45, -.8);
  static const startAlihnment = Alignment(randomPadding / 45, 0.8);
  static const double scoreY = randomPadding * 10;
  static const double scoreX1 = (0.5);
  static const double scoreX2 = (100);
  static const buttonShape = ContinuousRectangleBorder(
      borderRadius: AppColors.borderRadius,
      side: BorderSide(
          width: randomPadding / 5, color: Color.fromARGB(255, 3, 3, 73)));
}
