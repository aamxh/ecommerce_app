import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyAppbarTheme {

  MyAppbarTheme._();

  static final light = AppBarTheme(
    elevation: 0,
    backgroundColor: Colors.transparent,
    surfaceTintColor: Colors.transparent,
    scrolledUnderElevation: 0,
    iconTheme: const IconThemeData(color: Colors.black, size: 24),
    centerTitle: false,
    actionsIconTheme: const IconThemeData(color: Colors.black, size: 24),
    titleTextStyle: GoogleFonts.dmSans(color: Colors.black, fontWeight: FontWeight.w600, fontSize: 18),
  );

  static final dark = AppBarTheme(
    elevation: 0,
    backgroundColor: Colors.transparent,
    surfaceTintColor: Colors.transparent,
    scrolledUnderElevation: 0,
    iconTheme: const IconThemeData(color: Colors.black, size: 24),
    centerTitle: false,
    actionsIconTheme: const IconThemeData(color: Colors.white, size: 24),
    titleTextStyle: GoogleFonts.dmSans(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 18),
  );

}