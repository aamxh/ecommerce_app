import 'package:ecommerce_app/config/helpers.dart';
import 'package:ecommerce_app/config/network_manager.dart';
import 'package:ecommerce_app/controllers/cloud_firestore.dart';
import 'package:ecommerce_app/ui/views/email_verification.dart';
import 'package:ecommerce_app/ui/views/on_boarding.dart';
import 'package:ecommerce_app/ui/views/sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_app/models/user.dart';
import 'package:ecommerce_app/ui/views/main.dart';
import 'package:google_sign_in/google_sign_in.dart';

class MyAuthentication extends GetxController {

  final _deviceStorage = GetStorage();
  final _auth = FirebaseAuth.instance;
  final _googleAuth = GoogleSignIn();
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
    if(_deviceStorage.hasData('rememberMe')) {
      rememberMe = await _deviceStorage.read('rememberMe');
    } else {
      rememberMe = false;
    }
    rememberMe = false;
    await _deviceStorage.writeIfNull('isFirstTime', true);
    final isFirstTime = await _deviceStorage.read('isFirstTime') == true;
    if (isFirstTime) {
      Get.offAll(() => const OnBoardingV());
    } else {
      if (rememberMe) {
        Get.offAll(() => const MainV());
      } else {
        Get.offAll(() => const SignInV());
      }
    }
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
        if (rememberMe) {
          await _deviceStorage.write('rememberMe', true);
        } else {
          await _deviceStorage.write('rememberMe', false);
        }
        MyHelpers.stopLoading();
        Get.offAll(const MainV());
      } else {
        MyHelpers.showErrorSnackBar('Invalid information.');
      }
    } catch(ex) {
      MyHelpers.showErrorSnackBar(ex.toString());
      MyHelpers.stopLoading();
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
          final result =
          await MyCloudFirestore().isEmailAlreadyUsed(emailCtrl.text.trim());
          if (!result) {
            final userCredential = await _auth.createUserWithEmailAndPassword(
              email: emailCtrl.text.trim(),
              password: passwordCtrl.text.trim(),
            );
            final user = MyUser(
              id: userCredential.user!.uid,
              name: nameCtrl.text.trim(),
              phone: phoneCtrl.text.trim(),
              email: emailCtrl.text.trim(),
              image: '',
            );
            await MyCloudFirestore().addUser(user);
            MyHelpers.stopLoading();
            Get.to(() => const EmailVerificationV());
          } else {
            MyHelpers.showErrorSnackBar('Email is already used!');
          }
        } else {
          MyHelpers.showErrorSnackBar('Privacy policy and terms of use must be accepted.');
        }
      } else {
        MyHelpers.showErrorSnackBar('Invalid information.');
      }
    } catch(ex) {
      MyHelpers.showErrorSnackBar(ex.toString());
      MyHelpers.stopLoading();
    }
  }

  Future<void> sendEmailVerification() async {
    try {
      await _auth.currentUser!.sendEmailVerification();
      MyHelpers.showSuccessSnackBar('The email was sent successfully!');
    } catch(ex) {
      MyHelpers.showErrorSnackBar(ex.toString());
      MyHelpers.stopLoading();
    }
  }

  Future<void> signInWithGoogle() async {
    try {
      MyHelpers.startLoading();
      final googleUser = await _googleAuth.signIn();
      if (googleUser == null) {
        MyHelpers.stopLoading();
        return;
      }
      final googleAuth = await googleUser.authentication;
      final credential = GoogleAuthProvider.credential(
        idToken: googleAuth.idToken,
        accessToken: googleAuth.accessToken,
      );
      final userCredential = await _auth.signInWithCredential(credential);
      final isAlreadyStored = await MyCloudFirestore().isEmailAlreadyUsed(
          userCredential.user!.email ?? '',
      );
      if (isAlreadyStored) {
        MyHelpers.stopLoading();
        return;
      }
      final user = MyUser(
        id: userCredential.user!.uid,
        name: userCredential.user!.displayName ?? '',
        email: userCredential.user!.email ?? '',
        image: userCredential.user!.photoURL ?? '',
        phone: userCredential.user!.phoneNumber ?? '',
      );
      await MyCloudFirestore().addUser(user);
      MyHelpers.stopLoading();
      Get.offAll(() => const MainV());
    } catch(ex) {
      MyHelpers.showErrorSnackBar(ex.toString());
      MyHelpers.stopLoading();
    }
  }

}