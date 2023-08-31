import 'package:ecosan/app/repository/trash_history_repository.dart';
import 'package:ecosan/app/routes/app_pages.dart';
import 'package:get/get.dart';

class VerificationController extends GetxController {
  final Rx<int> count = 3.obs;

  void _counter() async {
    while (count.value > 0) {
      await Future.delayed(const Duration(seconds: 1), () {
        count.value--;
      });
    }

    String id = Get.arguments;

    trashHistoryRepository.update(
      id,
      {"status": "waitingToClaim"},
    );

    await Get.offNamedUntil(
      Routes.VERIFICATION_SUCCESS,
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
