// ignore_for_file: unnecessary_overrides

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Controller extends GetxController {

  var statusLogin = false.obs;

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    SharedPreferences.getInstance().then((prefValue) => {
          prefValue.getString("statusLogin") == 'true'
              ? statusLogin.value = true
              : statusLogin.value = false
        });
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
