import 'package:ecommerce_app/config/helpers.dart';
import 'package:ecommerce_app/config/network_manager.dart';
import 'package:ecommerce_app/ui/views/on_boarding.dart';
import 'package:ecommerce_app/ui/views/sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_app/ui/views/main.dart';

class MyAuthentication extends GetxController {

  final _deviceStorage = GetStorage();
  final _auth = FirebaseAuth.instance;
  static final emailCtrl = TextEditingController();
  static final passwordCtrl = TextEditingController();
  static final nameCtrl = TextEditingController();
  static final phoneCtrl = TextEditingController();
  static final GlobalKey<FormState> signInKey = GlobalKey<FormState>();
  static final GlobalKey<FormState> signUpKey = GlobalKey<FormState>();
  bool isPasswordHidden = true;
  bool accepted = false;
  bool rememberMe = true;

  @override
  void onReady() {
    FlutterNativeSplash.remove();
    viewRedirect();
  }

  Future<void> viewRedirect() async {
    await _deviceStorage.writeIfNull('isFirstTime', true);
    await _deviceStorage.read('isFirstTime') != true ?
        Get.offAll(() => const SignInV()) :
        Get.offAll(() => const OnBoardingV());
  }

  void hidePassword() {
    isPasswordHidden = true;
    update();
  }

  void showPassword() {
    isPasswordHidden = false;
    update();
  }

  void changeAccepted(bool? val) {
    if(val == null) return;
    accepted = val;
    update();
  }

  void changeRememberMe(bool? val) {
    if (val == null) return;
    rememberMe = val;
    update();
  }

  Future<void> signIn() async {
    try {
      if (signInKey.currentState!.validate()) {
        MyHelpers.startLoading();
        final isConnected = await Get.find<MyNetworkManager>().isConnected();
        if (!isConnected) {
          MyHelpers.stopLoading();
          return;
        }
        await _auth.signInWithEmailAndPassword(
          email: emailCtrl.text.trim(),
          password: passwordCtrl.text.trim(),
        );
        MyHelpers.stopLoading();
        Get.offAll(const MainV());
      } else {
        MyHelpers.showErrorSnackBar('Invalid information.');
      }
    } catch(ex) {
      MyHelpers.showErrorSnackBar(ex.toString());
    }
  }

  Future<void> signUp() async {
    try {
      if (signUpKey.currentState!.validate()) {
        if (accepted) {
          MyHelpers.startLoading();
          final isConnected = await Get.find<MyNetworkManager>().isConnected();
          if (!isConnected) {
            MyHelpers.stopLoading();
            return;
          }
          await _auth.createUserWithEmailAndPassword(
            email: emailCtrl.text.trim(),
            password: passwordCtrl.text.trim(),
          );
          MyHelpers.stopLoading();
          Get.offAll(const MainV());
        } else {
          MyHelpers.showErrorSnackBar('Privacy policy and terms of use must be accepted.');
        }
      } else {
        MyHelpers.showErrorSnackBar('Invalid information.');
      }
    } catch(ex) {
      MyHelpers.showErrorSnackBar(ex.toString());
    }
  }

}