import 'package:ecosan/app/constants/loading_state.dart';
import 'package:ecosan/app/models/trashHistory/trash_history_model.dart';
import 'package:ecosan/app/repository/trash_history/trash_history_repository.dart';
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
      print(trashHistory.value?.latitude);
    } catch (e) {
      loadingState.value = LoadingState.error;
      print(e);
    }
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
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
