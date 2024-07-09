import 'package:ecommerce_app/controllers/authentication.dart';
import 'package:ecommerce_app/ui/views/main.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';

class EmailVerificationC extends GetxController {

  @override
  void onInit() {
    Get.find<MyAuthentication>().sendEmailVerification();
    super.onInit();
  }

  void resendEmail() => Get.find<MyAuthentication>().sendEmailVerification();

  Future<void> emailVerified() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) return;
    await user.reload();
    if (user.emailVerified == true) {
      Get.offAll(const MainV());
    }
    Get.offAll(const MainV());
  }

}