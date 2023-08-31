import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecosan/app/constants/loading_state.dart';
import 'package:ecosan/app/modules/sampah/pickup-point/controllers/pickup_point_controller.dart';
import 'package:ecosan/app/repository/trash_history_repository.dart';
import 'package:ecosan/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:geolocator/geolocator.dart';

class ReviewPickupPointController extends GetxController {
  late PickupPointController pickupPointController;

  Rx<LoadingState> loadingState = LoadingState.loading.obs;
  Rx<Position> position = const Position(
    latitude: 0,
    longitude: 0,
    timestamp: null,
    accuracy: 0,
    altitude: 0,
    heading: 0,
    speed: 0,
    speedAccuracy: 0,
  ).obs;

  Future<Position> determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      loadingState.value = LoadingState.error;
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        loadingState.value = LoadingState.error;
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      loadingState.value = LoadingState.error;
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    return await Geolocator.getCurrentPosition();
  }

  void setPosition() async {
    Position pos = await determinePosition();
    position.value = pos;
    loadingState.value = LoadingState.success;
  }

  void setPositionToTrashHistory() {
    pickupPointController.trashHistory.latitude = position.value.latitude;
    pickupPointController.trashHistory.longitude = position.value.longitude;
  }

  void submit() async {
    setPositionToTrashHistory();
    try {
      final DocumentReference trashHistory =
          await trashHistoryRepository.add(pickupPointController.trashHistory);

      final String id = trashHistory.id;
      print(id);

      pickupPointController.dispose();
      Get.offNamedUntil(
        Routes.KONFIRMASI_KURIR,
        (route) {
          return route.settings.name == Routes.SAMPAH;
        },
        arguments: id,
      );
    } catch (e) {
      Get.snackbar('error found', e.toString());
    }
  }

  @override
  void onInit() {
    super.onInit();
    setPosition();
    pickupPointController = Get.find<PickupPointController>();
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
