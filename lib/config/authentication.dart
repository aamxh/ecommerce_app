import 'package:ecommerce_app/ui/views/on_boarding.dart';
import 'package:ecommerce_app/ui/views/sign_in.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class MyAuthentication extends GetxController {

  final _deviceStorage = GetStorage();

  @override
  void onReady() {
    FlutterNativeSplash.remove();
    viewRedirect();
  }

  Future<void> viewRedirect() async {
    await _deviceStorage.writeIfNull('isFirstTime', true);
    await _deviceStorage.read('isFirstTime') != true ?
        Get.offAll(() => SignInV()) :
        Get.offAll(() => const OnBoardingV());
  }

}