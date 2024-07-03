import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final myElevatedButtonTheme = ElevatedButtonThemeData(
  style: ElevatedButton.styleFrom(
    foregroundColor: Colors.white,
    backgroundColor: Colors.deepPurple,
    elevation: 0,
    textStyle: GoogleFonts.openSans(fontSize: 18, fontWeight: FontWeight.w600),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
  ),
);