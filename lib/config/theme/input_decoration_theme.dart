import 'package:ecommerce_app/config/constants.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

final myInputDecorationTheme = InputDecorationTheme(
  labelStyle: GoogleFonts.openSans(fontSize: 14, fontWeight: FontWeight.w600),
  hintStyle: GoogleFonts.openSans(fontSize: 14, fontWeight: FontWeight.w600, color: MyConstants.neutral),
  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
);