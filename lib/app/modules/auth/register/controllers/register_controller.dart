import 'package:ecosan/app/modules/auth/controllers/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  final AuthController authController = AuthController.authInstance;

  final GlobalKey<FormState> registerFormKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  // email validator
  String? emailValidator(String? value) {
    if (value == null || value.isEmpty) {
      return "Email tidak boleh kosong";
    } else if (!GetUtils.isEmail(value)) {
      return "Email tidak valid";
    }
    return null;
  }

  // password validator
  String? passwordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return "Password tidak boleh kosong";
    } else if (value.length < 6) {
      return "Password minimal 6 karakter";
    }
    return null;
  }

  // confirm password validator
  String? confirmPasswordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return "Konfirmasi password tidak boleh kosong";
    } else if (value != passwordController.text) {
      return "Password tidak sama";
    }
    return null;
  }

  void register() async {
    if (registerFormKey.currentState!.validate()) {
      authController.register(emailController.text, passwordController.text);
    }
  }

  void googleSignIn() async {
    authController.googleSignIn();
  }
}
