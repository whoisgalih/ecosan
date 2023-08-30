import 'package:get/get.dart';

import '../controllers/konfirmasi_kurir_controller.dart';

class KonfirmasiKurirBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<KonfirmasiKurirController>(
      KonfirmasiKurirController(),
    );
  }
}
