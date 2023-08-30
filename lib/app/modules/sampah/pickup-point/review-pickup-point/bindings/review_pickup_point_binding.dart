import 'package:get/get.dart';

import '../controllers/review_pickup_point_controller.dart';

class ReviewPickupPointBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ReviewPickupPointController>(
      () => ReviewPickupPointController(),
    );
  }
}
