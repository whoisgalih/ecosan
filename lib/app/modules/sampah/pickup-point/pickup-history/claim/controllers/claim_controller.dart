import 'package:ecosan/app/modules/sampah/receive-point/views/receive_point_view.dart';
import 'package:ecosan/app/repository/trash_history_repository.dart';
import 'package:ecosan/app/repository/user_repository.dart';
import 'package:ecosan/app/routes/app_pages.dart';
import 'package:get/get.dart';

class ClaimController extends GetxController {
  String get id => Get.arguments;

  void claimPoint() async {
    await trashHistoryRepository.update(id, {'status': 'completed'});

    await userRepository.addPoint(500);

    Get.offNamedUntil(
      Routes.RECEIVE_POINT,
      (route) => route.settings.name == Routes.SAMPAH,
      arguments: ReceivePointViewArguments(
        point: 500,
        message: "Karena telah menggunakan layanan pickup poin sampah",
      ),
    );
  }
}
