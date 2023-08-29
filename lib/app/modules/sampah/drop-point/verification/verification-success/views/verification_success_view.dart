import 'package:ecosan/app/modules/widgets/illustration_layout.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/verification_success_controller.dart';

class VerificationSuccessView extends GetView<VerificationSuccessController> {
  const VerificationSuccessView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('VerificationSuccessView'),
        centerTitle: false,
        leading: InkResponse(
          onTap: () {
            Get.back();
          },
          child: Icon(
            Icons.arrow_back,
          ),
        ),
      ),
      body: IllustrationLayout.buttonText(
        title: "Verifikasi Data Sampah",
        description:
            "Terima kasih telah menggunakan layanan drop poin. Silakan menunggu beberapa saat hingga operator selesai melakukan verifikasi",
        svgPath: "assets/svgs/verifikasi-operator.svg",
        buttonText: 'Klaim Poin',
        onTap: () {
          controller.submit();
        },
      ),
    );
  }
}
