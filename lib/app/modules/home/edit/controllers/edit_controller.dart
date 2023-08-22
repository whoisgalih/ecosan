import 'dart:io';

import 'package:ecosan/app/constants/firebase_constants.dart';
import 'package:ecosan/app/modules/home/controllers/home_controller.dart';
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

  void edit() async {
    await homeController.authController.updateFirestoreUser();
    Get.back();
  }

  Future<void> updateImage() async {
    result = await FilePicker.platform.pickFiles(type: FileType.image);

    if (result != null) {
      File file = File(result!.files.single.path!);
      final imageRef = storage.ref(
          'images/${homeController.authController.firebaseUser.value!.uid}.${getFileExtensionFromPath(file.path)}');

      try {
        // Reference to Firebase Storage location

        // Upload the selected image to Firebase Storage
        await imageRef.putFile(file);

        // Get the download URL of the uploaded image
        final imageUrl = await imageRef.getDownloadURL();

        // Update the user's image URL in Firestore
        homeController.user.value.photoUrl = imageUrl;

        await homeController.authController.updateFirestoreUser();
        // Close the FilePicker dialog
        Get.back();
      } catch (e) {
        // Handle any errors that occur during image upload or updating Firestore
        print("Error uploading image: $e");
        // You might want to show an error message to the user using Get.snackbar or other methods
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
