import 'package:get/get.dart';

import '../controllers/air_controller.dart';

class AirBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AirController>(
      () => AirController(),
    );
  }
}
