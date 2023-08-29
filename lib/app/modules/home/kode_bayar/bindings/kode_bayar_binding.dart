import 'package:get/get.dart';

import '../controllers/kode_bayar_controller.dart';

class KodeBayarBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<KodeBayarController>(
      () => KodeBayarController(),
    );
  }
}
