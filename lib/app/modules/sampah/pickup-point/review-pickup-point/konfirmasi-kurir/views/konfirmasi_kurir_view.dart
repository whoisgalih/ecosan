import 'package:ecosan/app/modules/themes/colors.dart';
import 'package:ecosan/app/modules/themes/fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

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
          child: Icon(
            Icons.arrow_back,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          margin: EdgeInsets.symmetric(horizontal: 16, vertical: 64),
          child: Column(
            children: [
              SvgPicture.asset("assets/svgs/konfirmasi-kurir.svg", width: 80.w),
              SizedBox(
                height: 40,
              ),
              Text(
                "Konfirmasi Kurir",
                style: TextStyles.header2.bold(color: EcoSanColors.primary),
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                "Terima kasih telah menggunakan layanan pickup poin. Silakan menunggu beberapa saat untuk mendapatkan kurir",
                style: TextStyles.normal,
                textAlign: TextAlign.center,
              ),
              // Obx(() => Text(
              //       "${controller.count.value}",
              //       // style:
              //       //     TextStyles.normal.copyWith(color: Colors.transparent),
              //     ))
            ],
          ),
        ),
      ),
    );
  }
}
