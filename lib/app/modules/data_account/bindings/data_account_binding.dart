import 'package:get/get.dart';

import '../controllers/data_account_controller.dart';

class DataAccountBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DataAccountController>(
      () => DataAccountController(),
    );
  }
}
