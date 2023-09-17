import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants/app_constants.dart';

class AppTheme {
  static final ThemeData theme = ThemeData.dark().copyWith(
    scaffoldBackgroundColor: AppColors.backgroundColor,
    useMaterial3: true,
    colorScheme: const ColorScheme.dark(
      primary: AppColors.primaryColor,
      background: AppColors.backgroundColor,
    ),
    textTheme: GoogleFonts.robotoMonoTextTheme(),
    appBarTheme: appBarTheme,
  );

  static const AppBarTheme appBarTheme = AppBarTheme(
    color: AppColors.backgroundColor,
    elevation: 0,
    centerTitle: true,
  );
}
