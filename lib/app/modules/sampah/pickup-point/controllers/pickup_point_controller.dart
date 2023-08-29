import 'package:ecosan/app/models/trashHistory/trash_history_model.dart';
import 'package:ecosan/app/modules/auth/controllers/auth_controller.dart';
import 'package:ecosan/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PickupPointController extends GetxController {
  static PickupPointController instance = Get.find<PickupPointController>();

  // user data source
  final AuthController authController = AuthController.authInstance;

  // form key
  final GlobalKey<FormState> pickupPointFormKey = GlobalKey<FormState>();

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

  String? addressValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Alamat tidak boleh kosong';
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

  // Set pickup point
  void setPickupPoint() {
    if (pickupPointFormKey.currentState!.validate() &&
        trashTypeValue.value != null &&
        timeValue.value != null) {
      pickupPointFormKey.currentState!.save();
      trashHistory = TrashHistory(
        name: nameController.text,
        phone: phoneController.text,
        address: addressController.text,
        trashType: trashTypeValue.value!,
        weight: double.parse(weightController.text),
        time: timeValue.value!,
        note: noteController.text,
        status: TrashHistoryStatus.order,
        type: TrashHistoryType.pickup,
        trashBankName: "TPS Kuningan Barat",
      );

      Get.toNamed(Routes.REVIEW_PICKUP_POINT);
    }
  }

  // Set user data
  void setUserData() {
    nameController.text = authController.user.value.name;
    phoneController.text = authController.user.value.phone;
  }

  @override
  void onInit() {
    setUserData();
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
}
