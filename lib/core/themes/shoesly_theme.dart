import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shoesly/core/themes/app_colors.dart';

class ShoeslyTheme {
  /// light theme colors
  static final ThemeData lightThemeData = ThemeData(
    primaryColor: COLOR_PRIMARY,
    splashColor: COLOR_PRIMARY_100,
    scaffoldBackgroundColor: Colors.white,
    fontFamily: GoogleFonts.inter().fontFamily,
    appBarTheme: const AppBarTheme(
      color: Colors.white,
      elevation: 0,
      iconTheme: IconThemeData(color: Colors.black),
    ),
    textTheme: TextTheme(
      displayLarge: GoogleFonts.inter(
        color: COLOR_PRIMARY,
        fontSize: 26,
        fontWeight: FontWeight.w600,
      ),
      displayMedium: GoogleFonts.inter(
        color: COLOR_PRIMARY,
        fontSize: 24,
        fontWeight: FontWeight.w600,
      ),
      displaySmall: GoogleFonts.inter(
        color: COLOR_PRIMARY,
        fontSize: 20,
        fontWeight: FontWeight.w600,
      ),
      headlineLarge: GoogleFonts.inter(
        color: COLOR_PRIMARY,
        fontSize: 16,
        fontWeight: FontWeight.w600,
      ),
      headlineMedium: GoogleFonts.inter(
        color: COLOR_PRIMARY,
        fontSize: 14,
        fontWeight: FontWeight.w500,
      ),
      headlineSmall: GoogleFonts.inter(
        color: COLOR_PRIMARY,
        fontSize: 12,
        fontWeight: FontWeight.w500,
      ),
      titleMedium: GoogleFonts.inter(
        color: COLOR_PRIMARY,
        fontSize: 12,
        fontWeight: FontWeight.w600,
      ),
      titleSmall: GoogleFonts.inter(
        color: COLOR_PRIMARY,
        fontSize: 10,
        fontWeight: FontWeight.w500,
      ),
      bodyLarge: GoogleFonts.inter(
        color: COLOR_PRIMARY,
        fontSize: 16,
        fontWeight: FontWeight.normal,
      ),
      bodyMedium: GoogleFonts.inter(
        color: COLOR_PRIMARY,
        fontSize: 14,
        fontWeight: FontWeight.normal,
      ),
      bodySmall: GoogleFonts.inter(
        color: COLOR_PRIMARY,
        fontSize: 12,
        fontWeight: FontWeight.normal,
      ),
    ),
    colorScheme: ColorScheme.fromSwatch().copyWith(
      primary: COLOR_PRIMARY,
      secondary: COLOR_PRIMARY_200,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        splashFactory: InkRipple.splashFactory,
        backgroundColor: MaterialStateProperty.all(COLOR_PRIMARY),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100),
          ),
        ),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Colors.white),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100),
          ),
        ),
        side: MaterialStateProperty.all(
          const BorderSide(
            color: COLOR_PRIMARY_200,
            width: 1,
          ),
        ),
      ),
    ),
    dividerTheme: const DividerThemeData(
      color: COLOR_PRIMARY_100,
      thickness: 1,
    ),
  );
}