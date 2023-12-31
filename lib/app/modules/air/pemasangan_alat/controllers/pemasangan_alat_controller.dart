import 'package:ecosan/app/models/user/user_model.dart';
import 'package:ecosan/app/modules/auth/controllers/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PemasanganAlatController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final pengaduanController = TextEditingController();
  final nameController = TextEditingController();
  final numberController = TextEditingController();
  final addressController = TextEditingController();
  User get user => AuthController.authInstance.user.value;

  @override
  void onReady() {
    super.onReady();
    pengaduanController.text = 'Sensor Air';
    nameController.text = user.name;
    numberController.text =
        user.phone.replaceFirst('0', '+').replaceFirst('8', '62');
  }

  String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Nama harus diisi';
    }
    return null;
  }

  String? validateNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'Nomor harus diisi';
    }
    if (!value.startsWith('+')) {
      return 'Nomor harus dimulai dengan "+"';
    }
    if (value.substring(1).isEmpty || !_isNumeric(value.substring(1))) {
      return 'Harap masukkan nomor yang valid setelah "+"';
    }
    return null;
  }

  String? validateAddress(String? value) {
    if (value == null || value.isEmpty) {
      return 'Alamat harus diisi';
    }
    return null;
  }

  bool _isNumeric(String value) {
    return double.tryParse(value) != null;
  }
}
