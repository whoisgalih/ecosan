import 'package:ecosan/app/modules/themes/colors.dart';
import 'package:ecosan/app/modules/themes/fonts.dart';
import 'package:ecosan/app/modules/widgets/button.dart';
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
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                width: double.infinity,
                margin: EdgeInsets.symmetric(horizontal: 16, vertical: 64),
                child: Column(
                  children: [
                    SvgPicture.asset("assets/svgs/konfirmasi-kurir.svg",
                        width: 80.w),
                    SizedBox(
                      height: 40,
                    ),
                    Text(
                      "Konfirmasi Kurir",
                      style:
                          TextStyles.header2.bold(color: EcoSanColors.primary),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      "Terima kasih telah menggunakan layanan pickup poin. Silakan menunggu beberapa saat untuk mendapatkan kurir",
                      style: TextStyles.normal,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(
                left: 16,
                right: 16,
                top: 16,
                bottom: MediaQuery.of(context).padding.bottom + 16),
            child: EcoSanButton(
              child: Text("Kalim Poin",
                  style: TextStyles.normal.bold(color: Colors.white)),
              onTap: () {
                Get.offAllNamed("/sampah/pickup-point/pickup-history");
              },
            ),
          ),
        ],
      ),
    );
  }
}
