import 'package:ecosan/app/constants/loading_state.dart';
import 'package:ecosan/app/models/trashHistory/trash_history_model.dart';
import 'package:ecosan/app/repository/trash_history_repository.dart';
import 'package:ecosan/app/routes/app_pages.dart';
import 'package:get/get.dart';

class PickupHistoryController extends GetxController {
  Rx<LoadingState> loadingState = LoadingState.loading.obs;
  late Rx<TrashHistory?> trashHistory = Rx<TrashHistory?>(null);

  void getTrashHistory() async {
    String id = Get.arguments;
    try {
      await trashHistoryRepository.get(id).then((value) {
        trashHistory.value = value;
      });
      loadingState.value = LoadingState.success;
    } catch (e) {
      loadingState.value = LoadingState.error;
    }
  }

  void changeTrashHistoryStatus() async {
    String id = Get.arguments;
    try {
      await trashHistoryRepository.update(id, {'status': 'waitingToClaim'});

      // SampahController.instance.getTrashHistories();
      Get.offNamedUntil(
        Routes.CLAIM,
        (route) {
          return route.settings.name == Routes.SAMPAH;
        },
        arguments: id,
      );
    } catch (e) {}
  }

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    getTrashHistory();
  }

  @override
  void onReady() {
    super.onReady();
    getTrashHistory();
  }

  void increment() => count.value++;
}
