import 'package:flutter/material.dart';
import 'app_colors.dart';


class AppTheme {
  static final theme = ThemeData(
      fontFamily: 'WorkSans',
      dialogTheme: DialogThemeData(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
        ),
        backgroundColor: AppColors.white,
        barrierColor: Color(0x52000000),
      ),
      scaffoldBackgroundColor: AppColors.white,
      primaryColor:  AppColors.primaryColor,
      colorScheme: ColorScheme.fromSeed(seedColor:  AppColors.primaryColor,

      primary:  AppColors.primaryColor),
      pageTransitionsTheme: const PageTransitionsTheme(builders: {
        TargetPlatform.android: CupertinoPageTransitionsBuilder(),
        TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
      }));
}

