import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ThemeOptions {
  static ThemeData appTheme = ThemeData(
    useMaterial3: true,
    textTheme: TextTheme(
      displayLarge: GoogleFonts.aBeeZee(fontSize: 50, color: Colors.white),
      displayMedium: GoogleFonts.aBeeZee(fontSize: 25, color: Colors.white),
      bodyMedium: GoogleFonts.aBeeZee(fontSize: 25, color: Colors.white),
      titleMedium: GoogleFonts.aBeeZee(fontSize: 25, color: Colors.white),
      titleLarge: GoogleFonts.aBeeZee(fontSize: 25, color: Colors.white),
    ),
    iconTheme: const IconThemeData(
      color: Colors.white,
    ),
  );
}
