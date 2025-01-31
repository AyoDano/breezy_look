import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  // Colors
  static const Color primaryColor = Color(0xFF3c6e71);
  static const Color secondaryColor = Color(0xFF284b63);
  static const Color backgroundColor = Color(0xFFfafafa);
  static const Color teritaryColor = Color(0xFFb7c2bd);
  static const Color textColor = Color(0xff212121);
  static const Color alertColor = Color(0xFFdf2935);

  // Fonts
  static const String fontFamily = "Geist"; // Local application font

  // ThemeData
  static ThemeData lightTheme = ThemeData(
    primaryColor: primaryColor,
    scaffoldBackgroundColor: backgroundColor,
    fontFamily: fontFamily, // Standard: Geist font
    textTheme: TextTheme(
      headlineLarge: TextStyle(
        fontSize: 32,
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
  );
}
