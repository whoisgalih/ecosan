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
  final cityValue = Rxn<String>();

  @override
  void onInit() {
    super.onInit();
    loadRegencies();
  }

  void loadRegencies() async {
    String? data = await rootBundle.loadString('assets/json/regencies.json');
    final kon = json.decode(data) as List<dynamic>;
    regencies.value = kon.map((e) => e['name'] as String).toList();
  }

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
    return null;
  }

  String? dateValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Tanggal lahir tidak boleh kosong';
    }
    return null;
  }

  String? cityValidator(Object? value) {
    if (value == null || value.toString().isEmpty) {
      return 'Kota tidak boleh kosong';
    }
    return null;
  }

  void register() async {
    if (registerFormKey.currentState!.validate() && cityValue.value != null) {
      registerFormKey.currentState!.save();
      User user = User(
          name: nameEditingController.text,
          poin: 0,
          uid: authController.firebaseUser.value!.uid,
          photoUrl: authController.firebaseUser.value!.photoURL,
          phone: phoneEditingController.text,
          birthdate: dateEditingController.text,
          city: cityValue.value!);
      await authController.addUserToFirestore(user);
    }
  }
}
