import 'package:get/get.dart';

import '../controllers/verification_controller.dart';

class VerificationBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<VerificationController>(
      VerificationController(),
    );
  }
}
