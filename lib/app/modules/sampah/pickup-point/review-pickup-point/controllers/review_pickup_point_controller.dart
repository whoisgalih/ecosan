import 'dart:async';

import 'package:get/get.dart';
import 'package:geolocator/geolocator.dart';

enum LoadingState { loading, success, error }

class ReviewPickupPointController extends GetxController {
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
    print("Latitude: ${pos.latitude}");
    print("Longitude: ${pos.longitude}");
    position.value = pos;
    loadingState.value = LoadingState.success;
  }

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    setPosition();
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
