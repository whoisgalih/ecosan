import 'package:ecosan/app/routes/app_pages.dart';
import 'package:get/get.dart';

class VerificationController extends GetxController {
  final Rx<int> count = 3.obs;

  void _counter() async {
    print("counter started");
    while (count.value > 0) {
      await Future.delayed(const Duration(seconds: 1), () {
        print(count.value);
        count.value--;
      });
    }

    // SampahController.instance.getTrashHistories();
    await Get.offNamedUntil(Routes.VERIFICATION_SUCCESS, (route) {
      return route.settings.name == Routes.SAMPAH;
    });
  }

  @override
  void onInit() {
    super.onInit();
    _counter();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
