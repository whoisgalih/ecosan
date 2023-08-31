import 'package:ecosan/app/repository/trash_history_repository.dart';
import 'package:ecosan/app/routes/app_pages.dart';
import 'package:get/get.dart';

class KonfirmasiKurirController extends GetxController {
  // 3 seconds counter
  final Rx<int> count = 3.obs;

  void _counter() async {
    while (count.value > 0) {
      await Future.delayed(const Duration(seconds: 1), () {
        count.value--;
      });
    }

    String id = Get.arguments;

    await trashHistoryRepository.update(id, {
      "status": "onTheWay",
    });

    // SampahController.instance.getTrashHistories();
    Get.offNamedUntil(
      Routes.PICKUP_HISTORY,
      (route) {
        return route.settings.name == Routes.SAMPAH;
      },
      arguments: id,
    );
  }

  @override
  void onInit() {
    super.onInit();
    _counter();
  }
}
