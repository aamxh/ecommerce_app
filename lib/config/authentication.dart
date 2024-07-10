import 'package:ecommerce_app/config/helpers.dart';
import 'package:ecommerce_app/controllers/authentication.dart';
import 'package:ecommerce_app/config/cloud_firestore.dart';
import 'package:ecommerce_app/ui/views/email_verification.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_app/models/user.dart';
import 'package:ecommerce_app/ui/views/main.dart';
import 'package:google_sign_in/google_sign_in.dart';

class MyAuthentication {

  final _deviceStorage = GetStorage();
  final _auth = FirebaseAuth.instance;
  final _googleAuth = GoogleSignIn();
  final _authC = Get.find<AuthenticationC>();
  final _myDB = MyCloudDB();
  static final emailCtrl = TextEditingController();
  static final passwordCtrl = TextEditingController();
  static final nameCtrl = TextEditingController();
  static final phoneCtrl = TextEditingController();
  static final GlobalKey<FormState> signInKey = GlobalKey<FormState>();
  static final GlobalKey<FormState> signUpKey = GlobalKey<FormState>();

  Future<void> signIn() async {
    try {
      if (signInKey.currentState!.validate()) {
        MyHelpers.startLoading();
        final isConnected = await MyHelpers.isConnected();
        if (!isConnected) {
          MyHelpers.stopLoading();
          return;
        }
        await _auth.signInWithEmailAndPassword(
          email: emailCtrl.text.trim(),
          password: passwordCtrl.text.trim(),
        );
        if (_authC.rememberMe) {
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
        if (_authC.accepted) {
          MyHelpers.startLoading();
          final isConnected = await MyHelpers.isConnected();
          if (!isConnected) {
            MyHelpers.stopLoading();
            return;
          }
          final result =
          await _myDB.isEmailAlreadyUsed(emailCtrl.text.trim());
          if (!result) {
            final userCredential = await _auth.createUserWithEmailAndPassword(
              email: emailCtrl.text.trim(),
              password: passwordCtrl.text.trim(),
            );
            final user = UserM(
              id: userCredential.user!.uid,
              name: nameCtrl.text.trim(),
              phone: phoneCtrl.text.trim(),
              email: emailCtrl.text.trim(),
              image: '',
            );
            await _myDB.addUser(user);
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

  Future<void> emailVerified() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) return;
    await user.reload();
    if (user.emailVerified == true) {
      Get.offAll(const MainV());
    }
  }

  Future<bool> signInWithGoogle() async {
    try {
      MyHelpers.startLoading();
      final isConnected = await MyHelpers.isConnected();
      if (!isConnected) {
        MyHelpers.stopLoading();
        return false;
      }
      final googleUser = await _googleAuth.signIn();
      if (googleUser == null) {
        MyHelpers.stopLoading();
        return false;
      }
      final googleAuth = await googleUser.authentication;
      final credential = GoogleAuthProvider.credential(
        idToken: googleAuth.idToken,
        accessToken: googleAuth.accessToken,
      );
      final userCredential = await _auth.signInWithCredential(credential);
      final user = userCredential.user;
      if(user == null) {
        MyHelpers.stopLoading();
        return true;
      }
      final isAlreadyStored = await _myDB.isEmailAlreadyUsed(
          user.email ?? '',
      );
      if (isAlreadyStored) {
        MyHelpers.stopLoading();
        return true;
      }
      await _myDB.addUser(UserM(
        id: user.uid,
        name: user.displayName ?? '',
        email: user.email ?? '',
        image: user.photoURL ?? '',
        phone: user.phoneNumber ?? '',
      ));
      MyHelpers.stopLoading();
      return true;
    } catch(ex) {
      MyHelpers.showErrorSnackBar(ex.toString());
      MyHelpers.stopLoading();
      return false;
    }
  }

}