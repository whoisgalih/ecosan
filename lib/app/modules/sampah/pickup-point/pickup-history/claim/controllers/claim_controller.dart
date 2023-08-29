import 'package:ecosan/app/modules/sampah/controllers/sampah_controller.dart';
import 'package:ecosan/app/modules/sampah/receive-point/views/receive_point_view.dart';
import 'package:ecosan/app/repository/trash_history/trash_history_repository.dart';
import 'package:ecosan/app/routes/app_pages.dart';
import 'package:get/get.dart';

class ClaimController extends GetxController {
  String get id => Get.arguments;

  void claimPoint() async {
    await trashHistoryRepository.update(id, {'status': 'completed'});
    // SampahController.instance.getTrashHistories();
    Get.offNamedUntil(
      Routes.RECEIVE_POINT,
      (route) => route.settings.name == Routes.SAMPAH,
      arguments: ReceivePointViewArguments(
        point: 500,
        message: "Karena telah menggunakan layanan pickup poin sampah",
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
