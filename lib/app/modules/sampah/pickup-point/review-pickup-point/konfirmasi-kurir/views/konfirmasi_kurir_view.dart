import 'package:ecosan/app/modules/widgets/illustration_layout.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/konfirmasi_kurir_controller.dart';

class KonfirmasiKurirView extends GetView<KonfirmasiKurirController> {
  const KonfirmasiKurirView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Konfirmasi Kurir'),
        leading: InkResponse(
          onTap: () {
            Get.back();
          },
          child: const Icon(
            Icons.arrow_back,
          ),
        ),
      ),
      body: const IllustrationLayout.noButton(
        title: "Konfirmasi Kurir",
        description:
            "Terima kasih telah menggunakan layanan pickup poin. Silakan menunggu beberapa saat untuk mendapatkan kurir",
        svgPath: "assets/svgs/konfirmasi-kurir.svg",
      ),
    );
  }
}
