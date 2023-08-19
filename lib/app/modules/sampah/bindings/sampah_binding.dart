import 'package:get/get.dart';

import '../controllers/sampah_controller.dart';

class SampahBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SampahController>(
      () => SampahController(),
    );
  }
}
