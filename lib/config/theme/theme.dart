import 'package:ecommerce_app/config/constants.dart';
import 'package:ecommerce_app/config/theme/appbar_theme.dart';
import 'package:ecommerce_app/config/theme/elevated_button_theme.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_app/config/theme/text_theme.dart';
import 'input_decoration_theme.dart';

class MyTheme {

  MyTheme._();

  static final dark = ThemeData.dark().copyWith(
    useMaterial3: true,
    primaryColor: MyConstants.primaryColor,
    scaffoldBackgroundColor: Colors.black,
    textTheme: MyTextTheme.dark,
    elevatedButtonTheme: myElevatedButtonTheme,
    appBarTheme: MyAppbarTheme.dark,
    colorScheme: const ColorScheme.dark(secondary: Colors.white),
    inputDecorationTheme: myInputDecorationTheme,
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Colors.black,
    ),
  );

  static final light = ThemeData(
    useMaterial3: true,
    primaryColor: MyConstants.primaryColor,
    scaffoldBackgroundColor: Colors.white,
    textTheme: MyTextTheme.light,
    elevatedButtonTheme: myElevatedButtonTheme,
    appBarTheme: MyAppbarTheme.light,
    colorScheme: const ColorScheme.light(secondary: Colors.black),
    inputDecorationTheme: myInputDecorationTheme,
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Colors.white,
    )
  );

}