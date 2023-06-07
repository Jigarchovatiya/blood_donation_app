import 'package:flutter/material.dart';

Map<int, Color> color = {
  50: const Color(0x1ACD3534),
  100: const Color(0x33CD3534),
  200: const Color(0x4DCD3534),
  300: const Color(0x66CD3534),
  400: const Color(0x80CD3534),
  500: const Color(0x99CD3534),
  600: const Color(0xB3CD3534),
  700: const Color(0xCCCD3534),
  800: const Color(0xE6CD3534),
  900: const Color(0xFFCD3534),
};

class AppColors {
  static MaterialColor materialColor = MaterialColor(0xFFCD3534, color);
  static const Color scaffoldBg = Color(0xFFF8F7FA);
  static const Color white = Colors.white;
  static const Color red = Colors.red;
  static const Color black = Colors.black;
  static const Color transparent = Colors.transparent;
  static const Color textColor = Color(0xFF666666);
  static const Color dividerColor = Color(0xFFFCBA04);
  static const Color textFillColor = Color(0xFFD6EEF1);
  static const Color homeBg = Color(0xFFFFF5F5);
  static const Color buttonBg = Color(0xFFE6E6E6);
  static const Color dividerGray = Color(0xFF999999);
}
