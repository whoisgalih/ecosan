import 'package:get/get.dart';

import '../controllers/voucherexchange_controller.dart';

class VoucherexchangeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<VoucherexchangeController>(
      () => VoucherexchangeController(),
    );
  }
}
