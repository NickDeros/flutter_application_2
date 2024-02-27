import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ThemeOptions {
  static ThemeData appTheme = ThemeData(
      useMaterial3: true,
      textTheme: TextTheme(
        displayLarge: GoogleFonts.aBeeZee(fontSize: 30, color: Colors.white),
        displayMedium: GoogleFonts.aBeeZee(fontSize: 25, color: Colors.white),
        bodyMedium: GoogleFonts.aBeeZee(fontSize: 20, color: Colors.white),
        titleMedium: GoogleFonts.aBeeZee(fontSize: 25, color: Colors.white),
        titleLarge: GoogleFonts.aBeeZee(fontSize: 30, color: Colors.white),
        titleSmall: GoogleFonts.aBeeZee(fontSize: 15, color: Colors.white),
      ),
      iconTheme: const IconThemeData(
        color: Colors.white,
      ),
      scaffoldBackgroundColor: const Color.fromARGB(255, 0, 23, 31),
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        iconTheme: IconThemeData(color: Colors.white, size: 40),
      ),
      );
}
