import 'package:get/get.dart';

import '../controllers/metode_pembayaran_controller.dart';

class MetodePembayaranBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MetodePembayaranController>(
      () => MetodePembayaranController(),
    );
  }
}
