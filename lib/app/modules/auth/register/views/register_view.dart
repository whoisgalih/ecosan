import 'package:ecosan/app/modules/themes/colors.dart';
import 'package:ecosan/app/modules/themes/fonts.dart';
import 'package:ecosan/app/modules/widgets/button.dart';
import 'package:ecosan/app/modules/widgets/form_input.dart';
import 'package:ecosan/app/modules/widgets/text_button.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  const RegisterView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Selamat Datang!",
                      style: TextStyles.header2.bold(),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      "Daftar disini untuk bergabung menjadi pengguna EcoSan",
                      style: TextStyles.normal,
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Form(
                  key: controller.registerFormKey,
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
                      SizedBox(height: 16),
                      FormInput(
                        controller: controller.passwordController,
                        label: "Password",
                        hint: "Masukan password",
                        keyboardType: TextInputType.visiblePassword,
                        icon: Icons.lock,
                        validator: controller.passwordValidator,
                      ),
                      SizedBox(height: 16),
                      FormInput(
                        controller: controller.confirmPasswordController,
                        label: "Konfirmasi Password",
                        hint: "Konfirmasi password",
                        keyboardType: TextInputType.visiblePassword,
                        icon: Icons.lock,
                        validator: controller.confirmPasswordValidator,
                      ),
                      SizedBox(height: 64),
                      EcoSanButton(
                        onTap: () {
                          controller.register();
                          // Get.offAllNamed("/auth/register/welcome");
                        },
                        child: Text(
                          "Daftar",
                          style: TextStyles.normal.bold(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 40),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
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
                            "Daftar dengan google",
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
                          "Sudah memiliki akun?",
                          style: TextStyles.small,
                        ),
                        ButtonText(
                          text: "Masuk",
                          onTap: () {
                            Get.offAllNamed("/auth/login");
                          },
                          textStyle: TextStyles.small
                              .bold(color: EcoSanColors.primary),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
