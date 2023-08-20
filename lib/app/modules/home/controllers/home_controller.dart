import 'package:ecosan/app/models/user/user_model.dart';
import 'package:ecosan/app/modules/auth/controllers/auth_controller.dart';
import 'package:ecosan/app/modules/home/controllers/sanitation_controller.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final AuthController authController = AuthController.authInstance;
  static HomeController i = Get.find();
  final SanitationController? sanitationController = SanitationController.i;
  late Rx<User> user;
  late Rx<int> index = 0.obs;

  @override
  void onInit() {
    super.onInit();
    user = authController.user;
  }

  @override
  void onReady() {
    super.onReady();
    index(0);
    ever(index, (value) async {
      if (value == 1 && sanitationController!.airIndex.value == 1) {
        await sanitationController!.controller!.resumePreview();
      } else {
        await sanitationController!.controller!.pausePreview();
      }
    });
  }

  @override
  void onClose() {
    super.onClose();
  }

  void signOut() {
    authController.signOut();
  }
}
