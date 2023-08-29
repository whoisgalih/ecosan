import 'package:ecosan/app/modules/sampah/receive-point/views/receive_point_view.dart';
import 'package:ecosan/app/repository/trash_history/trash_history_repository.dart';
import 'package:ecosan/app/routes/app_pages.dart';
import 'package:get/get.dart';

class VerificationSuccessController extends GetxController {
  void submit() async {
    await trashHistoryRepository.update(
      Get.arguments,
      {"status": "completed"},
    );
    Get.offNamedUntil(
      Routes.RECEIVE_POINT,
      (route) => route.settings.name == Routes.SAMPAH,
      arguments: ReceivePointViewArguments(
        point: 1000,
        message: "Karena telah menggunakan layanan drop poin sampah",
      ),
    );
  }

  final count = 0.obs;
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
}
