import 'package:ecosan/app/modules/widgets/illustration_layout.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/verification_controller.dart';

class VerificationView extends GetView<VerificationController> {
  const VerificationView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Verifikasi Operator'),
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
      body: const IllustrationLayout.noButton(
        title: "Verifikasi Data Sampah",
        description:
            "Terima kasih telah menggunakan layanan drop poin. Silakan menunggu beberapa saat hingga operator selesai melakukan verifikasi",
        svgPath: "assets/svgs/verifikasi-operator.svg",
      ),
    );
  }
}
