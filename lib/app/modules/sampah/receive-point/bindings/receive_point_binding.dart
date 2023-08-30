import 'package:get/get.dart';

import '../controllers/receive_point_controller.dart';

class ReceivePointBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ReceivePointController>(
      () => ReceivePointController(),
    );
  }
}
