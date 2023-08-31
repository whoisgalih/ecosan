import 'package:ecosan/app/modules/sampah/receive-point/views/receive_point_view.dart';
import 'package:ecosan/app/repository/trash_history_repository.dart';
import 'package:ecosan/app/repository/user_repository.dart';
import 'package:ecosan/app/routes/app_pages.dart';
import 'package:get/get.dart';

class VerificationSuccessController extends GetxController {
  void submit() async {
    String id = Get.arguments;

    await trashHistoryRepository.update(
      id,
      {"status": "completed"},
    );

    await userRepository.addPoint(1000);

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

  void increment() => count.value++;
}
