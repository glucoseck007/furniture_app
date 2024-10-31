import 'package:flutter/material.dart';
import 'package:furniture_app/core/theme/app_color.dart';

class AppTheme {
  static final lightTheme = ThemeData(
    primaryColor: AppColors.salmon,
    scaffoldBackgroundColor: AppColors.white,
    brightness: Brightness.light,
  );

  static final darkTheme = ThemeData(
      primaryColor: AppColors.salmon,
      scaffoldBackgroundColor: AppColors.darkLetter,
      brightness: Brightness.dark);
}
