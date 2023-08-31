import 'package:ecosan/app/modules/auth/controllers/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final AuthController authController = AuthController.authInstance;

  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void onClose() {
    super.onClose();

    // close text editing controller
    emailController.dispose();
    passwordController.dispose();
  }

  // email validator
  String? emailValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email tidak boleh kosong';
    }
    if (!GetUtils.isEmail(value)) {
      return 'Email tidak valid';
    }
    return null;
  }

  // password validator
  String? passwordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password tidak boleh kosong';
    }
    if (value.length < 6) {
      return 'Password minimal 6 karakter';
    }
    return null;
  }

  // login
  void login() async {
    if (loginFormKey.currentState!.validate()) {
      loginFormKey.currentState!.save();
      authController.login(
        emailController.text,
        passwordController.text,
      );
    }
  }

  void googleSignIn() async {
    authController.googleSignIn();
  }
}
