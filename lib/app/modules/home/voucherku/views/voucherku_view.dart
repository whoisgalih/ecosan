import 'package:ecosan/app/constants/utils.dart';
import 'package:ecosan/app/models/voucher/voucher.dart';
import 'package:ecosan/app/modules/auth/controllers/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../controllers/voucherku_controller.dart';
import 'package:ecosan/app/modules/themes/colors.dart';
import 'package:ecosan/app/modules/themes/fonts.dart';

class VoucherkuView extends GetView<VoucherkuController> {
  const VoucherkuView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () => Get.back(),
              icon: const Icon(Icons.arrow_back, color: Colors.white)),
          title: Text(
            'Voucherku',
            style: TextStyles.header3.bold().copyWith(color: Colors.white),
          ),
          centerTitle: false,
          backgroundColor: EcoSanColors.primary,
        ),
        body: Column(
          children: [
            Container(
              width: double.infinity,
              height: 190 / 800 * 100.h,
              padding: EdgeInsets.only(left: 4.h, right: 1.h),
              decoration: const BoxDecoration(
                color: EcoSanColors.primary,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10)),
              ),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SvgPicture.asset(
                          'assets/svgs/voucher.svg',
                          width: 6.h,
                          height: 6.h,
                        ),
                        SizedBox(
                          width: 1.5.h,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              controller.user.value.vouchers.length.toString(),
                              style:
                                  TextStyles.header1.bold(color: Colors.white),
                            ),
                            Text(
                              'Voucher',
                              style:
                                  TextStyles.header1.bold(color: Colors.white),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const Spacer(),
                    Image.asset('assets/images/voucherku_price.png')
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 63 / 800 * 100.h,
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 2.h),
                child: Column(
                  children: [
                    Obx(
                      () => Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          TextButton(
                            onPressed: () => controller.index.value = 0,
                            child: Text(
                              'Voucher belum terpakai',
                              style: TextStyles.tiny.bold(
                                  color: controller.index.value == 0
                                      ? const Color(0xFF0061F6)
                                      : EcoSanColors.primary.shade400),
                            ),
                          ),
                          TextButton(
                            onPressed: () => controller.index.value = 1,
                            child: Text(
                              'Voucher sudah terpakai',
                              style: TextStyles.tiny.bold(
                                  color: controller.index.value == 0
                                      ? EcoSanColors.primary.shade400
                                      : const Color(0xFF0061F6)),
                            ),
                          )
                        ],
                      ),
                    ),
                    Obx(
                      () => Expanded(
                        child: controller.index.value == 0
                            ? ListView.separated(
                                itemBuilder: (context, index) {
                                  var validVouchers = controller
                                      .user.value.vouchers
                                      .where((e) => !e.isUsed)
                                      .toList();
                                  return voucherListTile(validVouchers[index]);
                                },
                                separatorBuilder: (context, index) => SizedBox(
                                  height: 1.h,
                                ),
                                itemCount: controller.user.value.vouchers
                                    .where((e) => !e.isUsed)
                                    .length,
                              )
                            : ListView.separated(
                                itemBuilder: (context, index) {
                                  var validVouchers = controller
                                      .user.value.vouchers
                                      .where((e) => e.isUsed)
                                      .toList();
                                  return voucherListTile(validVouchers[index]);
                                },
                                separatorBuilder: (context, index) => SizedBox(
                                  height: 1.h,
                                ),
                                itemCount: controller.user.value.vouchers
                                    .where((e) => e.isUsed)
                                    .length,
                              ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ));
  }

  Container voucherListTile(Voucher voucher) {
    String assetPath;
    if (voucher.title == 'Pizza Hut') {
      assetPath = 'assets/images/phd.jpg';
    } else if (voucher.title == 'Gulaku') {
      assetPath = 'assets/images/alfa.jpg';
    } else if (voucher.title == 'Beras') {
      assetPath = 'assets/images/alfa.jpg';
    } else {
      assetPath = 'assets/images/ecosan_text_horizontal.jpg';
    }
    final redeemDate = DateTime.parse(voucher.purchasedDate!);
    final expiredDate = redeemDate.add(const Duration(days: 2));
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: const Color(0xFF7BAFFF), width: 1),
          borderRadius: BorderRadius.circular(9)),
      padding: EdgeInsets.symmetric(horizontal: 1.25.h, vertical: 1.5.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            assetPath,
            height: 48,
            width: 48,
          ),
          SizedBox(
            width: 1.25.h,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                voucher.title,
                style: TextStyles.small.bold(color: const Color(0xFF838383)),
              ),
              Text(
                '${redeemDate.day}-${expiredDate.day} ${Utils.getMonthFromInt(expiredDate.month)} ${expiredDate.year}',
                style: TextStyles.tiny.copyWith(color: const Color(0xFF838383)),
              ),
            ],
          ),
          const Spacer(),
          !voucher.isUsed
              ? ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      elevation: 0,
                      backgroundColor: EcoSanColors.primary,
                      minimumSize: const Size(0, 0),
                      padding: EdgeInsets.symmetric(
                          vertical: 1.h, horizontal: 2.5.h)),
                  onPressed: () async {
                    final now = DateTime.now();
                    if (now.isAfter(expiredDate)) {
                      Get.snackbar('Voucher sudah kadaluarsa',
                          'Voucher ini sudah kadaluarsa',
                          backgroundColor: Colors.red,
                          colorText: Colors.white,
                          snackPosition: SnackPosition.BOTTOM);
                    } else {
                      int targetIdx = controller.user.value.vouchers
                          .indexWhere((e) => e == voucher);
                      controller.user.value.vouchers[targetIdx].usedDate =
                          now.toString();
                      await AuthController.authInstance.updateFirestoreUser();
                      Get.snackbar('Voucher berhasil digunakan',
                          'Voucher ini berhasil digunakan',
                          snackPosition: SnackPosition.BOTTOM);
                    }
                  },
                  child: Text(
                    'Pakai',
                    style: TextStyles.tiny.copyWith(color: Colors.white),
                  ))
              : const SizedBox()
        ],
      ),
    );
  }
}
