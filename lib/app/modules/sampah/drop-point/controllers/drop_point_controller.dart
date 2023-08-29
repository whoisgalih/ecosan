import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecosan/app/models/dropPoint/drop_point_model.dart';
import 'package:ecosan/app/modules/auth/controllers/auth_controller.dart';
import 'package:get/get.dart';

class DropPointController extends GetxController {
  Rx<List<DropPoint>> dropPoints = Rx<List<DropPoint>>([]);

  void getDropPoint() async {
    QuerySnapshot querySnapshot = await dropPointCollection.get();
    dropPoints.value = querySnapshot.docs.map((doc) {
      Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
      data['id'] = doc.id;
      return DropPoint.fromJson(data);
    }).toList();
  }

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    getDropPoint();
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
