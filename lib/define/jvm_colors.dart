import 'package:flutter/material.dart';

class JColor {
  static const Color colorGrey50 = Color(0xFFF5F5F5);
  static const Color colorGrey100 = Color(0xFFE5E5E5);
  static const Color colorGrey200 = Color(0xFFC2C2C2);
  static const Color colorGrey300 = Color(0xFFA8A8A8);
  static const Color colorGrey400 = Color(0xFF8D8D8D);
  static const Color colorGrey500 = Color(0xFF666666);
  static const Color colorGrey600 = Color(0xFF525252);
  static const Color colorGrey700 = Color(0xFF393939);
  static const Color colorGrey800 = Color(0xFF262626);
  static const Color colorGrey900 = Color(0xFF161616);

  static const MaterialColor materialColor = MaterialColor(
    0xFF919BA5,
    <int, Color>{
      50: colorGrey50,
      100: colorGrey100,
      200: colorGrey200,
      300: colorGrey300,
      400: colorGrey400,
      500: colorGrey500,
      600: colorGrey600,
      700: colorGrey700,
      800: colorGrey800,
      900: colorGrey200,
    },
  );
}