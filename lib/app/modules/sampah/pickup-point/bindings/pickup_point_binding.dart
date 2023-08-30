import 'package:get/get.dart';

import '../controllers/pickup_point_controller.dart';

class PickupPointBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PickupPointController>(
      () => PickupPointController(),
    );
  }
}
