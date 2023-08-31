import 'package:ecosan/app/constants/utils.dart';
import 'package:ecosan/app/models/voucher/voucher.dart';
import 'package:ecosan/app/modules/profile/poinku/views/poinku_view.dart';
import 'package:ecosan/app/modules/themes/colors.dart';
import 'package:ecosan/app/modules/themes/fonts.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../controllers/voucherexchange_controller.dart';

class VoucherexchangeView extends GetView<VoucherexchangeController> {
  VoucherexchangeView({Key? key}) : super(key: key);
  final Voucher voucher = Get.arguments['voucher'];
  final dateTime = DateTime.now();
  final newDate = DateTime.now().add(const Duration(days: 2));

  String tanggalFormatter() {
    String formattedDate =
        "${dateTime.day}-${newDate.day} ${Utils.getMonthFromInt(newDate.month)} ${newDate.year}";
    return formattedDate;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F5FB),
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(Icons.arrow_back, color: Colors.white),
        ),
        title: Text(
          'Poinku',
          style: TextStyles.header3.bold().copyWith(color: Colors.white),
        ),
        centerTitle: false,
        backgroundColor: EcoSanColors.primary,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const PoinkuBanner(),
          SizedBox(height: 2.h),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 2.h),
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  Column(
                    children: [
                      SizedBox(height: 7.h),
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(
                            vertical: 70 / 800 * 100.h, horizontal: 2.25.h),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(
                              15), // Menggunakan border-radius: 15px;
                          boxShadow: const [
                            BoxShadow(
                              color: Color.fromRGBO(0, 0, 0, 0.25),
                              offset: Offset(0, 4),
                              blurRadius: 4,
                              spreadRadius: 0,
                            ), // Menggunakan box-shadow
                          ],
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              voucher.title,
                              style: TextStyles.header2
                                  .extraBold(color: const Color(0xFF838383)),
                            ),
                            SizedBox(height: 3.5.h),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 60 / 360 * 100.w),
                              child: Text(
                                'Selamat Anda berhasil menukarkan poin  🎉 ',
                                textAlign: TextAlign.center,
                                style: TextStyles.normal
                                    .bold(color: const Color(0xFF14AE5C)),
                                maxLines: 2,
                              ),
                            ),
                            SizedBox(height: 3.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  'Detail Proses',
                                  style: TextStyles.small
                                      .semibold(color: const Color(0xFF838383)),
                                )
                              ],
                            ),
                            SizedBox(height: 3.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Icon(
                                      Icons.calendar_month,
                                      color: Color(0xFF1E1E1E),
                                    ),
                                    Icon(
                                      Icons.money,
                                      color: Color(0xFF1E1E1E),
                                    )
                                  ],
                                ),
                                SizedBox(width: 1.5.h),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Tanggal',
                                      style: TextStyles.small.copyWith(
                                          color: const Color(0xFF838383)),
                                    ),
                                    Text(
                                      'Dihabiskan',
                                      style: TextStyles.small.copyWith(
                                          color: const Color(0xFF838383)),
                                    ),
                                  ],
                                ),
                                const Spacer(),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      tanggalFormatter(), // Gunakan tanggal yang sudah diformat
                                      style: TextStyles.small.copyWith(
                                          color: const Color(0xFF838383)),
                                    ),
                                    Text(
                                      '${voucher.price} Poin',
                                      style: TextStyles.small.copyWith(
                                          color: const Color(0xFF838383)),
                                    ),
                                  ],
                                )
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.all(0.8.h),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 102 / 2 / 360 * 100.w,
                      backgroundImage: AssetImage(voucher.title == 'Pizza Hut'
                          ? 'assets/images/phd.jpg'
                          : voucher.title.contains('EcoSan')
                              ? 'assets/images/ecosan_text_horizontal.jpg'
                              : 'assets/images/alfa.jpg'),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
