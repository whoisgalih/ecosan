import 'package:get/get.dart';

import '../controllers/voucherku_controller.dart';

class VoucherkuBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<VoucherkuController>(
      () => VoucherkuController(),
    );
  }
}
