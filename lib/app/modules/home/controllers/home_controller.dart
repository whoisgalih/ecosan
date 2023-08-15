import 'package:ecosan/app/modules/auth/controllers/auth_controller.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final AuthController authController = AuthController.authInstance;

  RxInt count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;

  void signOut() {
    authController.signOut();
  }
}
