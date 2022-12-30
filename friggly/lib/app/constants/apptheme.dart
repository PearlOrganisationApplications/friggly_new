import 'package:flutter/material.dart';
import 'appcolors.dart';

final darkTheme = ThemeData(
  colorScheme: ColorScheme.fromSwatch().copyWith(
    secondary: AppColors.creamColor,
    brightness: Brightness.dark,
    background: AppColors.mirage,
  ),
  indicatorColor: AppColors.rawSienna,
  dividerColor: Colors.white54,
);
final ligtTheme = ThemeData(
  colorScheme: ColorScheme.fromSwatch().copyWith(
    secondary: AppColors.mirage,
    brightness: Brightness.light,
    background: AppColors.creamColor,
  ),
  indicatorColor: AppColors.rawSienna,
  dividerColor: Colors.black,
);
