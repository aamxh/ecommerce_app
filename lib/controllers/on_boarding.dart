import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:ecommerce_app/ui/views/sign_in.dart';
import 'package:get_storage/get_storage.dart';

class OnBoardingC extends GetxController {

  Rx<int> idx = 0.obs;
  final pageCtrl = PageController();

  void updateIdx(int newIdx) => idx.value = newIdx;

  void dotClicked(int newIdx) {
    idx.value = newIdx;
    pageCtrl.jumpToPage(newIdx);
  }

  void next() {
    if (idx.value == 2) {
      skip();
    }
    else {
      idx.value = idx.value + 1;
      pageCtrl.jumpToPage(idx.value);
    }
  }

  Future<void> skip() async {
    final deviceStorage = GetStorage();
    await deviceStorage.write('isFirstTime', false);
    Get.offAll(() => SignInV());
  }

}