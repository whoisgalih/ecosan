import 'package:ecosan/app/modules/sampah/receive-point/views/receive_point_view.dart';
import 'package:ecosan/app/modules/widgets/illustration_layout.dart';
import 'package:ecosan/app/routes/app_pages.dart';
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
        centerTitle: true,
        leading: SizedBox(),
      ),
      body: IllustrationLayout.buttonText(
        title: "Sampah Telah Diambil Kurir",
        description:
            "Selamat kamu mendapatkan poin karena telah menggunakan layanan pickup poin. Klaim poin sekarang dan tukarkan poin dengan voucher menarik",
        svgPath: "assets/svgs/konfirmasi-kurir.svg",
        buttonText: "Klaim Poin",
        onTap: () {
          Get.offNamedUntil(
            Routes.RECEIVE_POINT,
            (route) => route.settings.name == Routes.SAMPAH,
            arguments: ReceivePointViewArguments(
              point: 500,
              message: "Karena telah menggunakan layanan pickup poin sampah",
            ),
          );
        },
      ),
    );
  }
}
