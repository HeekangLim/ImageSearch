import 'package:flutter/material.dart';
import 'package:jvn_project/define/dimens.dart';
import 'package:jvn_project/define/jvm_colors.dart';
import 'package:jvn_project/themes/app_colors.dart';

class AppTheme {
  static ThemeData get jvm_theme {
    return ThemeData(
      appBarTheme: const AppBarTheme(
        elevation: 1,
        color: AppColors.white,
        toolbarHeight: Dimens.height_header,
      ),
      // canvasColor: Colors.transparent,
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(

      ),
      bottomSheetTheme: const BottomSheetThemeData(
          modalBackgroundColor: Colors.transparent,
      ),
      dialogTheme: const DialogTheme(
        elevation: 4.0,
      ),
      scaffoldBackgroundColor: Colors.white,
      primaryColor: Colors.blueAccent,
      splashColor: Colors.blueAccent,

      scrollbarTheme: const ScrollbarThemeData().copyWith(
        thumbColor: MaterialStateProperty.all(Colors.white),
      ),
      inputDecorationTheme: const InputDecorationTheme(
        labelStyle: TextStyle(color: JColor.colorGrey800),
        hintStyle: TextStyle(color: JColor.colorGrey400),
          border: InputBorder.none,
      ),
      textTheme: const TextTheme(
        bodyLarge: TextStyle(
          fontSize: Dimens.txt_size_body_1,
        ),
        bodyMedium: TextStyle(
          fontSize: Dimens.txt_size_body_2,
        ),
      ),
    );
  }

  static const double padding = 20;
  static const double radius = 10;

  static const double verticalPadding = 16;
  static const double horizontalPadding = 10;
  static const double mediumPadding = 8;
  static const double searchPopupPadding = 7;
  static const double smallPadding = 4;
}


