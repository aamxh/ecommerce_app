import 'package:get/get.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get_storage/get_storage.dart';
import '../ui/views/main.dart';
import '../ui/views/on_boarding.dart';
import '../ui/views/sign_in.dart';

class AuthenticationC extends GetxController {

  final _deviceStorage = GetStorage();
  bool accepted = false;
  late bool rememberMe;
  bool isPasswordHidden = true;

  @override
  void onReady() {
    FlutterNativeSplash.remove();
    viewRedirect();
  }

  Future<void> viewRedirect() async {
    if(_deviceStorage.hasData('rememberMe')) {
      rememberMe = await _deviceStorage.read('rememberMe');
    } else {
      rememberMe = false;
    }
    rememberMe = false;
    if (_deviceStorage.hasData('isFirstTime')) {
      await _deviceStorage.write('isFirstTime', false);
    } else {
      await _deviceStorage.write('isFirstTime', true);
    }
    final isFirstTime = await _deviceStorage.read('isFirstTime');
    if (isFirstTime) {
      Get.offAll(() => const OnBoardingV());
    } else if (rememberMe) {
      Get.offAll(() => const MainV());
    } else {
      Get.offAll(() => SignInV());
    }
  }

  void changeRememberMe(bool val) {
    rememberMe = val;
    update();
  }

  void hidePassword() {
    isPasswordHidden = true;
    update();
  }

  void showPassword() {
    isPasswordHidden = false;
    update();
  }

  void changeAccepted(bool val) {
    accepted = val;
    update();
  }

}