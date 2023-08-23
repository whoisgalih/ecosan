import 'package:get/get.dart';

import '../controllers/pemasangan_alat_controller.dart';

class PemasanganAlatBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PemasanganAlatController>(
      () => PemasanganAlatController(),
    );
  }
}
