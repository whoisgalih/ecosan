import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecosan/app/models/trashHistory/trash_history_model.dart';
import 'package:ecosan/app/modules/auth/controllers/auth_controller.dart';
import 'package:ecosan/app/repository/trash_history/trash_history_repository.dart';
import 'package:ecosan/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InputTrashController extends GetxController {
  String get trashBankName => Get.arguments;

  // user data source
  final AuthController authController = AuthController.authInstance;

  // form key
  final GlobalKey<FormState> dropPointFormKey = GlobalKey<FormState>();

  // form data
  late TrashHistory trashHistory;

  // Text Editing Controller
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  Rx<String?> trashTypeValue = Rx<String?>(null);
  TextEditingController weightController = TextEditingController();
  Rx<String?> timeValue = Rx<String?>(null);
  TextEditingController noteController = TextEditingController();

  // Validation
  String? nameValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Nama tidak boleh kosong';
    }
    return null;
  }

  String? phoneValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Nomor telepon tidak boleh kosong';
    }

    if (value.length < 10) {
      return 'Nomor telepon tidak valid';
    }

    return null;
  }

  String? trashTypeValidator(Object? value) {
    if (value == null || value.toString().isEmpty) {
      return 'Jenis sampah tidak boleh kosong';
    }
    return null;
  }

  String? weightValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Berat kisaran tidak boleh kosong';
    }
    try {
      double.parse(value);
    } catch (e) {
      return 'Berat kisaran tidak valid';
    }
    return null;
  }

  String? timeValidator(Object? value) {
    if (value == null || value.toString().isEmpty) {
      return 'Waktu pengambilan tidak boleh kosong';
    }
    return null;
  }

  // Set drop point
  void setDropPoint() async {
    if (dropPointFormKey.currentState!.validate() &&
        trashTypeValue.value != null &&
        timeValue.value != null) {
      dropPointFormKey.currentState!.save();
      print('note: ${noteController.text}');

      trashHistory = TrashHistory(
        name: nameController.text,
        phone: phoneController.text,
        trashType: trashTypeValue.value!,
        weight: double.parse(weightController.text),
        time: timeValue.value!,
        note: noteController.text,
        status: TrashHistoryStatus.onTheWay,
        type: TrashHistoryType.dropoff,
        trashBankName: trashBankName,
      );

      DocumentReference documentReference =
          await trashHistoryRepository.add(trashHistory);

      String id = documentReference.id;

      Get.offNamedUntil(
        Routes.VERIFICATION,
        (route) => route.settings.name == Routes.SAMPAH,
        arguments: id,
      );
    }
  }

  // Set user data
  void setUserData() {
    nameController.text = authController.user.value.name;
    phoneController.text = authController.user.value.phone;
  }

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    setUserData();
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
