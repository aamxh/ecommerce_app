import 'package:ecommerce_app/config/constants.dart';
import 'package:email_validator/email_validator.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyHelpers {

  MyHelpers._();

  static Future<void> launchURL(String url) async {
    if (await canLaunchUrlString(url)) {
      launchUrlString(url);
    } else {
      throw 'Could not launch URL: $url';
    }
  }

  static String formatDate(DateTime? date) {
    date ??= DateTime.now();
    return DateFormat('dd-MM-yyyy').format(date);
  }

  static String formatCurrency(double amount) {
    return NumberFormat.currency(locale: 'en_US', symbol: '\$').format(amount);
  }

  static String? validateEmail(String? val) {
    if (val == null) {
      return 'Email field is empty!';
    }
    if (!EmailValidator.validate(val)) {
      return 'Email is not valid!';
    }
    return null;
  }

  static String? validatePassword(String? val) {
    if (val == null) {
      return 'Password field is empty!';
    }
    if (val.length < 6) {
      return 'Password must be at least 6 characters long!';
    }
    return null;
  }

  static String? validatePhone(String? val) {
    if (val == null) {
      return 'Phone number field is empty!';
    }
    final RegExp phoneRegExp = RegExp(r'^\+?[\d\s\-\(\)]{7,15}$');
    if (!phoneRegExp.hasMatch(val)) {
      return 'Phone number is not valid!';
    }
    return null;
  }

  static String? validateName(String? val) {
    if (val == null) {
      return 'User name field is empty!';
    }
    return null;
  }

  static void startLoading() => showDialog(
      context: Get.overlayContext!,
      barrierDismissible: false,
      builder: (context) {
        final theme = Theme.of(context);
        return PopScope(
          canPop: false,
          child: Container(
            color: theme.scaffoldBackgroundColor,
            width: double.infinity,
            height: double.infinity,
            child: Center(
              child: CircularProgressIndicator(
                color: theme.colorScheme.secondary,
              ),
            ),
          ),
        );
      },
    );

  static void stopLoading() => Navigator.of(Get.overlayContext!).pop();

  static void showErrorSnackBar(String message) =>
      Get.snackbar(
        'Error!',
        message,
        isDismissible: false,
        backgroundColor: MyConstants.red,
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
        icon: const Icon(Icons.error_outline),
      );

}