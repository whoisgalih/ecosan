import 'package:get/get.dart';

import '../controllers/poinku_controller.dart';

class PoinkuBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PoinkuController>(
      () => PoinkuController(),
    );
  }
}
