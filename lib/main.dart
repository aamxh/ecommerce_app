import 'package:ecommerce_app/ui/views/on_boarding.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_app/config/theme/theme.dart';
import 'package:get/get.dart';

void main() {
  _initializeApp();
  runApp(const MyApp());
}

Future<void> _initializeApp() async {

}

class MyApp extends StatelessWidget {

  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: MyTheme.light,
      darkTheme: MyTheme.dark,
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
      home: const OnBoardingV(),
    );
  }

}