import 'package:ecommerce_app/config/authentication.dart';

import 'firebase_options.dart';
import 'package:ecommerce_app/ui/views/on_boarding.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_app/config/theme/theme.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get_storage/get_storage.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

void main() {
  _initializeApp();
  runApp(const MyApp());
}

Future<void> _initializeApp() async {
  final widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform).then((FirebaseApp val) =>
      Get.put(MyAuthentication()));
}

class MyApp extends StatelessWidget {

  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return GetMaterialApp(
      theme: MyTheme.light,
      darkTheme: MyTheme.dark,
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: CircularProgressIndicator(
            color: theme.colorScheme.secondary,
          ),
        ),
      ),
    );
  }

}