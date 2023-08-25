import 'package:get/get.dart';

import '../controllers/drop_point_controller.dart';

class DropPointBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DropPointController>(
      () => DropPointController(),
    );
  }
}
