import 'package:ecosan/app/modules/widgets/button_text.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/login_controller.dart';
import 'package:ecosan/app/modules/themes/colors.dart';
import 'package:ecosan/app/modules/themes/fonts.dart';
import 'package:ecosan/app/modules/widgets/button.dart';
import 'package:ecosan/app/modules/widgets/form_input.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Selamat Datang!",
                    style: TextStyles.header2.bold(),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "Selamat datang kembali. Ayo Sehatkan Sanitasimu Bersama EcoSan",
                    style: TextStyles.normal,
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Form(
                key: controller.loginFormKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    FormInput(
                      controller: controller.emailController,
                      hint: "Masukan email",
                      icon: Icons.mail,
                      label: "Email",
                      keyboardType: TextInputType.emailAddress,
                      validator: controller.emailValidator,
                    ),
                    FormInput(
                      controller: controller.passwordController,
                      label: "Password",
                      hint: "Masukan password",
                      keyboardType: TextInputType.visiblePassword,
                      icon: Icons.lock,
                      validator: controller.passwordValidator,
                      bottomMargin: 4,
                    ),
                    ButtonText(text: "Lupa password?", onTap: () {}),
                    const SizedBox(height: 88),
                    EcoSanButton(
                      isEnabled: true,
                      onTap: () {
                        controller.login();
                      },
                      child: Text(
                        "Masuk",
                        style: TextStyles.normal.bold(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  Divider(
                    height: 1,
                    color: EcoSanColors.primary[50],
                  ),
                  const SizedBox(height: 16),
                  EcoSanButton(
                    color: Colors.white,
                    onTap: () {
                      controller.googleSignIn();
                    },
                    boxShadows: const [
                      BoxShadow(
                        color: Color(0x1400519B),
                        blurRadius: 15,
                        offset: Offset(0, 1),
                        spreadRadius: 0,
                      )
                    ],
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          "assets/images/google.png",
                          width: 24,
                          height: 24,
                          fit: BoxFit.fill,
                        ),
                        const SizedBox(width: 12),
                        Text(
                          "Masuk dengan google",
                          style: TextStyles.normal.bold(),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 48),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Belum memiliki akun?",
                        style: TextStyles.small,
                      ),
                      ButtonText(
                        text: "Daftar",
                        onTap: () {
                          Get.offAllNamed("/auth/register");
                        },
                        textStyle:
                            TextStyles.small.bold(color: EcoSanColors.primary),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
