import 'package:ecosan/app/constants/loading_state.dart';
import 'package:ecosan/app/models/trashHistory/trash_history_model.dart';
import 'package:ecosan/app/repository/trash_history_repository.dart';
import 'package:get/get.dart';

class SampahController extends GetxController {
  static SampahController get instance => Get.find<SampahController>();

  Rx<List<TrashHistory>> trashHistories = Rx<List<TrashHistory>>([]);
  Rx<LoadingState> loadingState = Rx<LoadingState>(LoadingState.loading);

  // void getTrashHistories() async {
  //   print("getTrashHistories");
  //   try {
  //     trashHistories.value = await trashHistoryRepository.getAll();
  //     print(trashHistories.value);
  //     loadingState.value = LoadingState.success;
  //   } catch (e) {
  //     print(e);
  //     loadingState.value = LoadingState.error;
  //   }
  //   update();
  // }

  void listenTrashHistory() {
    trashHistoryRepository.trashHistoryCollection.snapshots().listen(
      (event) async {
        trashHistories.value = event.docs
            .map((e) {
              Map<String, dynamic> data = e.data() as Map<String, dynamic>;
              data['id'] = e.id;
              return TrashHistory.fromJson(data);
            })
            .toList()
            .reversed
            .toList();
      },
    );
  }

  @override
  void onInit() {
    super.onInit();
    // getTrashHistories();
    listenTrashHistory();
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
