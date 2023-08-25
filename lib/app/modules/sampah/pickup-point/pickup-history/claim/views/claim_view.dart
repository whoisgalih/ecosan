import 'package:ecosan/app/modules/themes/colors.dart';
import 'package:ecosan/app/modules/themes/fonts.dart';
import 'package:ecosan/app/modules/widgets/button.dart';
import 'package:ecosan/app/modules/widgets/illustration_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

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
          Get.toNamed(
              "/sampah/pickup-point/pickup-history/claim/claim-success");
        },
      ),
    );
  }
}
