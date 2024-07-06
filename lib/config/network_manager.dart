import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';

class MyNetworkManager extends GetxController {

  final Connectivity _connectivity = Connectivity();

  @override
  void onInit() {
    super.onInit();
  }

  Future<bool> isConnected() async {
    final result = await _connectivity.checkConnectivity();
    if (result[0] == ConnectivityResult.none) {
      return false;
    } else {
      return true;
    }

  }

}