import 'package:get/get.dart';

import '../controllers/data_diri_controller.dart';

class DataDiriBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DataDiriController>(
      () => DataDiriController(),
    );
  }
}
