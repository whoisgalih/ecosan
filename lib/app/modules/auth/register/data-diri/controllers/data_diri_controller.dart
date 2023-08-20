import 'dart:convert';

import 'package:ecosan/app/models/user/user_model.dart';
import 'package:ecosan/app/modules/auth/controllers/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class DataDiriController extends GetxController {
  final authController = AuthController.authInstance;
  final GlobalKey<FormState> registerFormKey = GlobalKey<FormState>();
  final nameEditingController = TextEditingController();
  final phoneEditingController = TextEditingController();
  final dateEditingController = TextEditingController();
  RxList<String> regencies = <String>[].obs;
  Rx<String?> cityValue = null.obs;
  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    loadRegencies();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void loadRegencies() async {
    String? data = await rootBundle.loadString('assets/json/regencies.json');
    final kon = json.decode(data) as List<dynamic>;
    regencies = kon.map((e) => e['name'] as String).toList().obs;
    regencies.refresh();
  }

  String? nameValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Nama tidak boleh kosong';
    }
    return null;
  }

  String? numberValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Nomor telepon tidak boleh kosong';
    }
    if (!GetUtils.isPhoneNumber(value)) {
      return 'Nomor telepon tidak valid';
    }
    return null;
  }

  String dateValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Tanggal lahir tidak boleh kosong';
    }
    return '';
  }

  void register() {
    if (registerFormKey.currentState!.validate() && cityValue.value != null) {
      registerFormKey.currentState!.save();
      User user = User(
          name: nameEditingController.text,
          phone: phoneEditingController.text,
          birthdate: dateEditingController.text,
          city: cityValue.value!);
      authController.addUserToFirestore(user);
    }
  }

  void increment() => count.value++;
}
