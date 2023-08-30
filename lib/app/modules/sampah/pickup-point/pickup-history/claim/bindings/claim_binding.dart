import 'package:get/get.dart';

import '../controllers/claim_controller.dart';

class ClaimBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ClaimController>(
      () => ClaimController(),
    );
  }
}
