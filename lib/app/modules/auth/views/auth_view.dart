import 'package:ecosan/app/modules/themes/colors.dart';
import 'package:ecosan/app/modules/themes/fonts.dart';
import 'package:ecosan/app/modules/widgets/button.dart';
import 'package:ecosan/app/modules/widgets/form_input.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/auth_controller.dart';

class AuthView extends GetView<AuthController> {
  const AuthView({Key? key}) : super(key: key);
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const FormInput(
                      hint: "Masukan email",
                      icon: Icons.mail,
                      label: "Email",
                      keyboardType: TextInputType.emailAddress),
                  const SizedBox(height: 16),
                  const FormInput(
                      label: "Password",
                      hint: "Masukan password",
                      keyboardType: TextInputType.visiblePassword,
                      icon: Icons.lock),
                  const SizedBox(height: 4),
                  InkWell(
                    customBorder: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4)),
                    onTap: () {},
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Text(
                        "Lupa password?",
                        style:
                            TextStyles.tiny.bold(color: EcoSanColors.primary),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 88),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  EcoSanButton(
                    isDisabled: true,
                    onTap: () {},
                    child: Text(
                      "Masuk",
                      style: TextStyles.normal.bold(color: Colors.white),
                    ),
                  ),
                  const SizedBox(height: 40),
                  Divider(
                    height: 1,
                    color: EcoSanColors.primary[50],
                  ),
                  const SizedBox(height: 16),
                  EcoSanButton(
                    isDisabled: false,
                    color: Colors.white,
                    onTap: () {},
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
                        "Sudah memiliki akun?",
                        style: TextStyles.small,
                      ),
                      SizedBox(width: 4),
                      Text(
                        "Daftar",
                        style:
                            TextStyles.small.bold(color: EcoSanColors.primary),
                      )
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
