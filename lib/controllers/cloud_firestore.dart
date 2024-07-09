import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app/config/helpers.dart';
import 'package:get/get.dart';
import 'package:ecommerce_app/models/user.dart';

class MyCloudFirestore extends GetxController {

  final _db = FirebaseFirestore.instance;

  Future<void> addUser(MyUser user) async {
    try {
      await _db.collection('users').doc(user.id).set(user.toJson());
    } catch (ex) {
      MyHelpers.showErrorSnackBar(ex.toString());
    }
  }

  Future<bool> isEmailAlreadyUsed(String email) async {
    try {
      final result =
      await _db.collection('users').where('email', isEqualTo: email,).get();
      return result.size == 1;
    } catch (ex) {
      MyHelpers.showErrorSnackBar(ex.toString());
      return false;
    }
  }

}