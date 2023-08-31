import 'package:ecosan/app/models/voucher/voucher.dart';
import 'package:ecosan/app/modules/themes/colors.dart';
import 'package:ecosan/app/modules/themes/fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../controllers/poinku_controller.dart';

class PoinkuView extends GetView<PoinkuController> {
  const PoinkuView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFFF9F5FB),
        appBar: AppBar(
          leading: IconButton(
              onPressed: () => Get.back(),
              icon: const Icon(Icons.arrow_back, color: Colors.white)),
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
            SizedBox(
              height: 2.h,
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 2.h),
                child: ListView.separated(
                    itemBuilder: (context, index) =>
                        VoucherListTile(voucher: controller.vouchers[index]),
                    separatorBuilder: (context, index) => SizedBox(
                          height: 1.h,
                        ),
                    itemCount: controller.vouchers.length),
              ),
            )
          ],
        ));
  }
}

class VoucherListTile extends StatelessWidget {
  const VoucherListTile({super.key, required this.voucher});
  final Voucher voucher;
  PoinkuController get controller => Get.find<PoinkuController>();
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: EcoSanColors.secondary, width: 1),
          borderRadius: BorderRadius.circular(9)),
      padding: EdgeInsets.symmetric(horizontal: 1.25.h, vertical: 1.5.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            voucher.title == 'Pizza Hut'
                ? 'assets/images/phd.jpg'
                : voucher.title.contains('EcoSan')
                    ? 'assets/images/ecosan_text_horizontal.jpg'
                    : 'assets/images/alfa.jpg',
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
                style: TextStyles.small.bold(color: Color(0xFF838383)),
              ),
              Text(
                '\$ ${voucher.price}',
                style: TextStyles.tiny.copyWith(color: Color(0xFF838383)),
              ),
            ],
          ),
          const Spacer(),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                  elevation: 0,
                  backgroundColor: EcoSanColors.secondary,
                  minimumSize: const Size(0, 0),
                  padding:
                      EdgeInsets.symmetric(vertical: 1.h, horizontal: 2.5.h)),
              onPressed: () async {
                if (controller.user.value.poin >= voucher.price) {
                  controller.user.value.poin -= voucher.price;
                  voucher.purchasedDate = DateTime.now().toString();
                  controller.user.value.vouchers.add(voucher);
                  await controller.authController
                      .updateFirestoreUser();
                  Get.toNamed('home/poinku/voucherexchange',
                      arguments: {'voucher': voucher});
                } else {
                  Get.snackbar('Poin tidak cukup',
                      'Poin anda tidak cukup untuk menukar voucher ini',
                      snackPosition: SnackPosition.BOTTOM);
                }
              },
              child: Text(
                'Tukar',
                style: TextStyles.tiny.copyWith(color: Colors.white),
              ))
        ],
      ),
    );
  }
}

class PoinkuBanner extends StatelessWidget {
  const PoinkuBanner({
    super.key,
  });
  PoinkuController get controller => Get.find<PoinkuController>();
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 190 / 800 * 100.h,
      color: EcoSanColors.secondary,
      child: Column(
        children: [
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 3.5.h,
                  ),
                  SvgPicture.asset(
                    'assets/svgs/dollar.svg',
                    height: 48,
                    width: 48,
                  ),
                  SizedBox(
                    width: 1.5.h,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        controller.user.value.poin.toString(),
                        style: TextStyles.header1
                            .bold()
                            .copyWith(color: Colors.white),
                      ),
                      Text(
                        'Poin',
                        style: TextStyles.header1
                            .bold()
                            .copyWith(color: Colors.white),
                      ),
                    ],
                  ),
                ],
              ),
              const Spacer(),
              Image.asset('assets/images/poinku_phone.png'),
              SizedBox(
                width: 0.5.h,
              )
            ],
          ),
        ],
      ),
    );
  }
}
