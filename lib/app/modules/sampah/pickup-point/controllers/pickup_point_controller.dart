import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PickupPointController extends GetxController {
  final GlobalKey formKey = GlobalKey<FormState>();

  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController trashTypeController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  TextEditingController timeController = TextEditingController();
  TextEditingController noteController = TextEditingController();

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
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
