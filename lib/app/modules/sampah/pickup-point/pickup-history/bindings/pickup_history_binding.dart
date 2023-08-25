import 'package:get/get.dart';

import '../controllers/pickup_history_controller.dart';

class PickupHistoryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PickupHistoryController>(
      () => PickupHistoryController(),
    );
  }
}
