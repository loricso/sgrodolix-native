import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final appTheme = ThemeData(
  colorScheme: ColorScheme(
    brightness: Brightness.dark,
    primary: Color(0xFF3D6ABD),
    onPrimary: Color(0xFFFFF8EE),
    secondary: Color(0xFFFFF8EE),
    onSecondary: Color(0xFF171717),
    error: Color(0xFFD5373A),
    onError: Color(0xFFFFF8EE),
    surface: Color(0xFF171717),
    onSurface: Color(0xFFFFF8EE),
  ),

  textTheme: TextTheme(
    headlineMedium: GoogleFonts.poppins(
      fontSize: 36,
      fontWeight: FontWeight.bold,
    ),
    bodyMedium: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w500),
    displayMedium: GoogleFonts.poppins(
      fontSize: 20,
      fontWeight: FontWeight.w500,
    ),
    labelSmall: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w500),
  ),
);
