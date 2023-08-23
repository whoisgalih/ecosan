import 'package:get/get.dart';

import '../controllers/daftar_riwayat_controller.dart';

class DaftarRiwayatBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DaftarRiwayatController>(
      () => DaftarRiwayatController(),
    );
  }
}
