import 'dart:io';

import 'package:ecosan/app/constants/firebase_constants.dart';
import 'package:ecosan/app/modules/home/controllers/home_controller.dart';
import 'package:ecosan/app/repository/user_repository.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditController extends GetxController {
  final homeController = HomeController.i;
  final nameEditingController = TextEditingController();
  final telpEditingController = TextEditingController();
  final addressEditingController = TextEditingController();
  final emailEditingController = TextEditingController();
  final passwordEditingController = TextEditingController();
  final userRepo = UserRepository();
  Rxn<FilePickerResult> result = Rxn<FilePickerResult>();
  final isLoading = false.obs;

  File get getFile => File(result.value!.files.single.path!);

  @override
  void onReady() {
    super.onReady();
    nameEditingController.text = homeController.user.value.name;
    telpEditingController.text = homeController.user.value.phone;
    addressEditingController.text = homeController.user.value.city;
    emailEditingController.text =
        homeController.authController.firebaseUser.value!.email!;
  }

  Future<void> edit() async {
    if (result.value != null) {
      isLoading.value = true;
      File file = File(result.value!.files.single.path!);
      final imageRef = storage.ref(
          'images/${homeController.authController.firebaseUser.value!.uid}.${getFileExtensionFromPath(file.path)}');

      try {
        await imageRef.putFile(file);
        final imageUrl = await imageRef.getDownloadURL();
        homeController.user.value.photoUrl = imageUrl;
      } catch (e) {}
    }
    homeController.user.value.name = nameEditingController.text;
    homeController.user.value.phone = telpEditingController.text;
    homeController.user.value.city = addressEditingController.text;
    try {
      await userRepo.updateProfile();
      isLoading(false);
      Get.back();
      Get.snackbar('Berhasil', 'Berhasil mengubah profil',
          snackPosition: SnackPosition.BOTTOM);
    } catch (e) {
      isLoading(false);
    }
  }

  Future<void> pickImage() async {
    result.value = await FilePicker.platform.pickFiles(type: FileType.image);
  }

  String getFileExtensionFromPath(String filePath) {
    if (filePath.isNotEmpty) {
      int dotIndex = filePath.lastIndexOf('.');
      if (dotIndex != -1 && dotIndex < filePath.length - 1) {
        return filePath.substring(dotIndex + 1).toLowerCase();
      }
    }
    return ''; // Return empty string if extension cannot be extracted
  }
}
