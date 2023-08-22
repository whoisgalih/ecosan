import 'package:ecosan/app/modules/home/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditController extends GetxController {
  //TODO: Implement EditController
  final homeController = HomeController.i;
  final count = 0.obs;
  final nameEditingController = TextEditingController();
  final telpEditingController = TextEditingController();
  final addressEditingController = TextEditingController();
  final emailEditingController = TextEditingController();
  final passwordEditingController = TextEditingController();
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

  void increment() => count.value++;
}
