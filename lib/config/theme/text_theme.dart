import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTextTheme {

  MyTextTheme._();

  static final light = TextTheme(
    headlineLarge: GoogleFonts.openSans(fontWeight: FontWeight.bold, fontSize: 32, color: Colors.black),
    headlineMedium: GoogleFonts.openSans(fontWeight: FontWeight.w600, fontSize: 28, color: Colors.black),
    headlineSmall: GoogleFonts.openSans(fontWeight: FontWeight.w600, fontSize: 24, color: Colors.black),
    titleLarge: GoogleFonts.openSans(fontWeight: FontWeight.normal, fontSize: 22, color: Colors.black),
    titleMedium: GoogleFonts.openSans(fontWeight: FontWeight.normal, fontSize: 20, color: Colors.black),
    titleSmall: GoogleFonts.openSans(fontWeight: FontWeight.normal, fontSize: 18, color: Colors.black),
    bodyLarge: GoogleFonts.openSans(fontWeight: FontWeight.w600, fontSize: 16, color: Colors.black),
    bodyMedium: GoogleFonts.openSans(fontWeight: FontWeight.w600, fontSize: 14, color: Colors.black),
    bodySmall: GoogleFonts.openSans(fontWeight: FontWeight.normal, fontSize: 12, color: Colors.black),
  );

  static final dark = TextTheme(
    headlineLarge: GoogleFonts.openSans(fontWeight: FontWeight.bold, fontSize: 32, color: Colors.white),
    headlineMedium: GoogleFonts.openSans(fontWeight: FontWeight.w600, fontSize: 28, color: Colors.white),
    headlineSmall: GoogleFonts.openSans(fontWeight: FontWeight.w600, fontSize: 24, color: Colors.white),
    titleLarge: GoogleFonts.openSans(fontWeight: FontWeight.normal, fontSize: 22, color: Colors.white),
    titleMedium: GoogleFonts.openSans(fontWeight: FontWeight.normal, fontSize: 20, color: Colors.white),
    titleSmall: GoogleFonts.openSans(fontWeight: FontWeight.normal, fontSize: 18, color: Colors.white),
    bodyLarge: GoogleFonts.openSans(fontWeight: FontWeight.w600, fontSize: 16, color: Colors.white),
    bodyMedium: GoogleFonts.openSans(fontWeight: FontWeight.w600, fontSize: 14, color: Colors.white),
    bodySmall: GoogleFonts.openSans(fontWeight: FontWeight.normal, fontSize: 12, color: Colors.white),
  );

}