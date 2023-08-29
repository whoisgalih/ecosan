import 'package:get/get.dart';

import '../controllers/input_trash_controller.dart';

class InputTrashBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<InputTrashController>(
      () => InputTrashController(),
    );
  }
}
