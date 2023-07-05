import 'package:flutter/material.dart';

import 'package:slot_package/theme/palette.dart';

int primary = 0xFF246BFD;
int pageBg = 0xFF181829;
int modalBg = 0xFF222232;

ThemeData getTheme() {
  return ThemeData(
      cardColor: Color(modalBg),
      textTheme: TextTheme(
          displayMedium:  TextStyle(
            color: Colors.white,
            fontSize: 40,
          ),
          displaySmall: TextStyle(
                  color: Colors.white,
                  fontSize: 36,
                  fontWeight: FontWeight.w600),
          headlineMedium: TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                  fontWeight: FontWeight.w600),
          headlineSmall: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w600),
          titleMedium:  TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
          titleSmall: TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),
          bodyMedium: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  height: 1.8),
          titleLarge: TextStyle(fontSize: 24, color: Colors.white),
          bodySmall: TextStyle(color: Color(0xFF65656B), fontSize: 16)), colorScheme: ColorScheme.fromSwatch(primarySwatch: createMaterialColor(Color(primary))).copyWith(background: Color(pageBg)));
}
