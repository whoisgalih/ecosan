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
  FilePickerResult? result;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    nameEditingController.text = homeController.user.value.name;
    telpEditingController.text = homeController.user.value.phone;
    addressEditingController.text = homeController.user.value.city;
    emailEditingController.text =
        homeController.authController.firebaseUser.value!.email!;
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<void> edit() async {
    print('updating');
    homeController.user.value.name = nameEditingController.text;
    homeController.user.value.phone = telpEditingController.text;
    homeController.user.value.city = addressEditingController.text;
    try {
      await userRepo.updateProfile();
      Get.back();
    } catch (e) {
      print(e);
    }
  }

  Future<void> updateImage() async {
    result = await FilePicker.platform.pickFiles(type: FileType.image);

    if (result != null) {
      File file = File(result!.files.single.path!);
      final imageRef = storage.ref(
          'images/${homeController.authController.firebaseUser.value!.uid}.${getFileExtensionFromPath(file.path)}');

      try {
        print('uploading image');
        await imageRef.putFile(file);
        final imageUrl = await imageRef.getDownloadURL();
        print('success: ' + imageUrl);
        homeController.user.value.photoUrl = imageUrl;
        print('updating firestore user');
        await userRepo.updateProfile();
        Get.back();
      } catch (e) {
        print("Error uploading image: $e");
      }
    }
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
