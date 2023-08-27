import 'package:ecosan/app/constants/utils.dart';
import 'package:ecosan/app/modules/home/metode_pembayaran/controllers/metode_pembayaran_controller.dart';
import 'package:ecosan/app/modules/themes/fonts.dart';
import 'package:ecosan/app/modules/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:ecosan/app/modules/themes/colors.dart';
import 'package:sizer/sizer.dart';

import '../controllers/kode_bayar_controller.dart';

class KodeBayarView extends GetView<KodeBayarController> {
  const KodeBayarView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    String _formatDuration(Duration duration) {
      final hours = duration.inHours.toString().padLeft(2, '0');
      final minutes = (duration.inMinutes % 60).toString().padLeft(2, '0');
      final seconds = (duration.inSeconds % 60).toString().padLeft(2, '0');

      return '$hours Jam $minutes Menit $seconds Detik';
    }

    MetodePembayaran metodePembayaran = Get.arguments['payment_method'];
    int price = Get.arguments['price'];
    return Scaffold(
      appBar: AppBar(
          title: Text(
            'Metode Pembayaran',
            style: TextStyles.header3.bold(color: Colors.white),
          ),
          backgroundColor: EcoSanColors.primary,
          leading: IconButton(
              onPressed: () => Get.back(),
              icon: const Icon(Icons.arrow_back, color: Colors.white))),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 2.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 2.5.h,
            ),
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 1.5.h, horizontal: 2.h),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: EcoSanColors.primary),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Total Pembayaran',
                    style: TextStyles.small.copyWith(color: Colors.white),
                  ),
                  Text(
                    Utils.rupiahFormatter(price),
                    style: TextStyles.small.copyWith(color: Colors.white),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 1.5.h,
            ),
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 2.h, vertical: 3.h),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                      color: Colors.black.withOpacity(0.1), width: 1)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset(
                            metodePembayaran.imagePath,
                            width: 33 / 360 * 100.w,
                          ),
                          SizedBox(
                            width: 2.5.h,
                          ),
                          Text(
                            metodePembayaran.title,
                            style: TextStyles.normal,
                          ),
                        ],
                      ),
                      Obx(
                        () => Text(
                            _formatDuration(
                                Duration(seconds: controller.countdown.value)),
                            style: TextStyles.tiny),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 2.25.h,
                  ),
                  Text(
                    'Kode Bayar:',
                    style: TextStyles.small,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        controller.kodeBayar,
                        style: TextStyles.header3.bold(),
                      ),
                      InkWell(
                        borderRadius: BorderRadius.circular(10),
                        onTap: () async {
                          await Clipboard.setData(ClipboardData(
                              text: controller.kodeBayar.toString()));
                          Get.snackbar(
                              'Berhasil', 'Kode Bayar berhasil disalin',
                              snackPosition: SnackPosition.BOTTOM);
                        },
                        splashFactory: InkRipple.splashFactory,
                        child: Container(
                          padding: EdgeInsets.all(1.h),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                                color: Colors.black.withOpacity(0.1), width: 1),
                          ),
                          child: Text(
                            'Salin',
                            style: TextStyles.tiny,
                          ),
                        ),
                      )
                    ],
                  ),
                  Text('Hanya menerima dari ${metodePembayaran.title}',
                      style: TextStyles.tiny2)
                ],
              ),
            ),
            SizedBox(
              height: 1.5.h,
            ),
            Text(
              'Langkah Pembayaran',
              style: TextStyles.small.bold(),
            ),
            SizedBox(
              height: 1.5.h,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: controller.langkahPembayaran.length,
                itemBuilder: (context, index) => Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${index + 1}. ',
                      style: TextStyles.small,
                    ),
                    Expanded(
                      child: controller.langkahPembayaran[index],
                    )
                  ],
                ),
              ),
            ),
            EcoSanButton(
                onTap: () async {
                  await controller.pay();
                },
                child: Text(
                  'Gunakan',
                  style: TextStyles.normal.bold(color: Colors.white),
                )),
            SizedBox(
              height: 4.5.h,
            )
          ],
        ),
      ),
    );
  }
}
