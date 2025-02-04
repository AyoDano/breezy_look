import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  // Colors
  static const Color primaryColor = Color(0xFF3c6e71);
  static const Color secondaryColor = Color(0xFF284b63);
  static const Color backgroundColor = Color(0xFFfafafa);
  static const Color teritaryColor = Color(0xFFb7c2bd);
  static const Color colorGrey = Color(0xffF5F5F5);
  static const Color colorGreyTwo = Color(0xff858585);
  static const Color textColor = Color(0xff212121);
  static const Color alertColor = Color(0xFFdf2935);

  // Getter for transparent colors
  static Color get primaryColorTransparent =>
      primaryColor.withValues(alpha: 0.5);
  static Color get secondaryColorTransparent =>
      secondaryColor.withValues(alpha: 0.5);
  static Color get backgroundColorTransparent =>
      backgroundColor.withValues(alpha: 0.3);
  static Color get alertColorTransparent => alertColor.withValues(alpha: 0.7);

  // Fonts
  static const String fontFamily = "Geist"; // Local application font

  // Button Styles
  static final ButtonStyle elevatedButtonStyle = ElevatedButton.styleFrom(
    backgroundColor: primaryColor,
    foregroundColor: Colors.white,
    textStyle: GoogleFonts.spectral(
      fontSize: 18,
      fontWeight: FontWeight.bold,
    ),
    padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
    elevation: 4,
  );

  static final ButtonStyle textButtonStyle = TextButton.styleFrom(
    foregroundColor: primaryColor,
    textStyle: GoogleFonts.spectral(
      fontSize: 16,
      fontWeight: FontWeight.bold,
    ),
    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
  );

  // ThemeData
  static ThemeData lightTheme = ThemeData(
    primaryColor: primaryColor,
    scaffoldBackgroundColor: backgroundColor,
    fontFamily: fontFamily, // Standard: Geist font
    textTheme: TextTheme(
      // types of headlines
      displayLarge: TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.bold,
        color: textColor,
        fontFamily: fontFamily,
      ),
      displayMedium: TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.bold,
        color: textColor,
        fontFamily: fontFamily,
      ),
      displaySmall: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.bold,
        color: textColor,
        fontFamily: fontFamily,
      ),
      headlineLarge: TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.bold,
        color: textColor,
        fontFamily: fontFamily,
      ),
      headlineMedium: GoogleFonts.spectral(
        fontSize: 28,
        fontWeight: FontWeight.bold,
        color: textColor,
        letterSpacing: -1,
      ),
      headlineSmall: GoogleFonts.spectral(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: textColor,
        letterSpacing: -1,
      ),
      bodyLarge: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.normal,
        color: textColor,
      ),
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: backgroundColor,
      titleTextStyle: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: textColor,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(style: elevatedButtonStyle),
    textButtonTheme: TextButtonThemeData(style: textButtonStyle),
  );
}
