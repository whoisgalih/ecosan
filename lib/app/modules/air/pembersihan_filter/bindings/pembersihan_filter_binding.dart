import 'package:get/get.dart';

import '../controllers/pembersihan_filter_controller.dart';

class PembersihanFilterBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PembersihanFilterController>(
      () => PembersihanFilterController(),
    );
  }
}
