import 'package:get/get.dart';

import '../controllers/preview_drop_point_controller.dart';

class PreviewDropPointBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PreviewDropPointController>(
      () => PreviewDropPointController(),
    );
  }
}
