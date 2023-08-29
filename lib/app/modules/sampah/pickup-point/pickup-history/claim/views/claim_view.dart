import 'package:ecosan/app/modules/widgets/illustration_layout.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/claim_controller.dart';

class ClaimView extends GetView<ClaimController> {
  const ClaimView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Klaim Poin'),
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
        title: "Sampah Telah Diambil Kurir",
        description:
            "Selamat kamu mendapatkan poin karena telah menggunakan layanan pickup poin. Klaim poin sekarang dan tukarkan poin dengan voucher menarik",
        svgPath: "assets/svgs/konfirmasi-kurir.svg",
        buttonText: "Klaim Poin",
        onTap: () {
          controller.claimPoint();
        },
      ),
    );
  }
}
