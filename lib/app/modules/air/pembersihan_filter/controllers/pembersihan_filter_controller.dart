import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PembersihanFilterController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final pengaduanController = TextEditingController();
  final nameController = TextEditingController();
  final numberController = TextEditingController();
  final addressController = TextEditingController();
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    pengaduanController.text = 'Pembersihan Filter';
  }

  @override
  void onClose() {
    super.onClose();
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
