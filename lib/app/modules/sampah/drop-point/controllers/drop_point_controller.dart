import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecosan/app/constants/loading_state.dart';
import 'package:ecosan/app/models/dropPoint/drop_point_model.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

class DropPointController extends GetxController {
  Rx<LoadingState> loadingState = LoadingState.loading.obs;
  Rx<List<DropPoint>> dropPoints = Rx<List<DropPoint>>([]);

  Rx<Position> position = Position(
    latitude: 0,
    longitude: 0,
    timestamp: DateTime.now(),
    accuracy: 0,
    altitude: 0,
    heading: 0,
    speed: 0,
    speedAccuracy: 0,
  ).obs;

  Future<void> determinePosition() async {
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

    position.value = await Geolocator.getCurrentPosition();
  }

  void getDropPoint() async {
    QuerySnapshot querySnapshot = await dropPointCollection.get();
    dropPoints.value = querySnapshot.docs.map((doc) {
      Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
      data['id'] = doc.id;
      return DropPoint.fromJson(data);
    }).toList();
    loadingState.value = LoadingState.success;
  }

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    determinePosition();
    getDropPoint();
  }

  void increment() => count.value++;
}
