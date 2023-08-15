import 'package:ecosan/app/modules/themes/colors.dart';
import 'package:ecosan/app/modules/themes/fonts.dart';
import 'package:ecosan/app/modules/widgets/button.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/welcome_controller.dart';

class WelcomeView extends GetView<WelcomeController> {
  const WelcomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 18, vertical: 24),
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("assets/images/welcome.png", width: 300),
              const SizedBox(height: 40),
              Text(
                "Selamat Datang!",
                style: TextStyles.header2.bold(color: EcoSanColors.primary),
              ),
              const SizedBox(height: 8),
              Text(
                "Selamat bergabung di dalam EcoSan. Ayo Sehatkan Sanitasimu Bersama EcoSan",
                style: TextStyles.normal,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 40),
              EcoSanButton(
                  onTap: () {
                    Get.offAllNamed("/auth/register/data-diri");
                  },
                  child: Text(
                    "Selanjutnya",
                    style: TextStyles.normal.bold(color: Colors.white),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
