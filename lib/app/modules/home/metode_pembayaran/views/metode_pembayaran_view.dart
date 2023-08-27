import 'package:accordion/accordion.dart';
import 'package:ecosan/app/constants/utils.dart';
import 'package:ecosan/app/modules/themes/colors.dart';
import 'package:ecosan/app/modules/themes/fonts.dart';
import 'package:ecosan/app/modules/widgets/button.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../controllers/metode_pembayaran_controller.dart';

class MetodePembayaranView extends GetView<MetodePembayaranController> {
  const MetodePembayaranView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final int price = Get.arguments['price'];
    final arguments = Get.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Metode Pembayaran',
          style: TextStyles.header3.bold(color: Colors.white),
        ),
        backgroundColor: EcoSanColors.primary,
        leading: IconButton(
            onPressed: () => Get.back(),
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            )),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 2.h,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 2.5.h,
            ),
            Container(
              height: 110 / 800 * 100.h,
              padding: EdgeInsets.only(
                  top: 1.5.h, left: 2.h, right: 2.h, bottom: 0.75.h),
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: EcoSanColors.primary),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Total Pembayaran',
                    style: TextStyles.small.copyWith(color: Colors.white),
                  ),
                  Text(
                    Utils.rupiahFormatter(price),
                    style:
                        TextStyles.header3.bold().copyWith(color: Colors.white),
                  ),
                  Text(
                    '*sudah termasuk biaya penggantian media dan jasa pembersihan',
                    style: TextStyles.tiny2.copyWith(color: Colors.white),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 3.h,
            ),
            Expanded(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Accordion(
                    paddingListHorizontal: 1.h,
                    contentBorderColor: Colors.black.withOpacity(0.1),
                    contentBorderWidth: 1,
                    rightIcon: const Icon(
                      Icons.keyboard_arrow_down,
                      color: Colors.white,
                    ),
                    contentHorizontalPadding: 1.h,
                    headerBackgroundColor: EcoSanColors.primary,
                    headerPadding:
                        EdgeInsets.symmetric(vertical: 1.5.h, horizontal: 2.h),
                    headerBorderRadius: 10,
                    children: [
                      AccordionSection(
                          onOpenSection: controller.selectedPaymentIdx.value !=
                                  null
                              ? () => controller.selectedPaymentIdx.value = null
                              : null,
                          onCloseSection: controller.selectedPaymentIdx.value !=
                                  null
                              ? () => controller.selectedPaymentIdx.value = null
                              : null,
                          header: Text(
                            'Virtual Account',
                            style:
                                TextStyles.normal.copyWith(color: Colors.white),
                          ),
                          content: Column(
                            children: controller.paymentMethod
                                .sublist(0, 4)
                                .asMap()
                                .map((index, va) => MapEntry(
                                      index,
                                      GestureDetector(
                                        behavior: HitTestBehavior.opaque,
                                        onTap: () => controller
                                            .selectedPaymentIdx.value = index,
                                        child: AccordionListTile(
                                          controller: controller,
                                          index: index,
                                          va: va,
                                        ),
                                      ),
                                    ))
                                .values
                                .toList(),
                          )),
                      AccordionSection(
                          onOpenSection: controller.selectedPaymentIdx.value !=
                                  null
                              ? () => controller.selectedPaymentIdx.value = null
                              : null,
                          onCloseSection: controller.selectedPaymentIdx.value !=
                                  null
                              ? () => controller.selectedPaymentIdx.value = null
                              : null,
                          header: Text('Dompet Digital',
                              style: TextStyles.normal
                                  .copyWith(color: Colors.white)),
                          content: Column(
                            children: controller.paymentMethod
                                .sublist(4)
                                .asMap()
                                .map((index, va) => MapEntry(
                                      index,
                                      GestureDetector(
                                        behavior: HitTestBehavior.opaque,
                                        onTap: () => controller
                                            .selectedPaymentIdx
                                            .value = index + 4,
                                        child: AccordionListTile(
                                          controller: controller,
                                          index: index + 4,
                                          va: va,
                                        ),
                                      ),
                                    ))
                                .values
                                .toList(),
                          ))
                    ])
              ],
            )),
            EcoSanButton(
                onTap: () {
                  if (controller.selectedPaymentIdx.value != null) {
                    Get.offNamedUntil('/home', (route) => false);
                    Get.toNamed('home/kode-bayar', arguments: {
                      'payment_method': controller
                          .paymentMethod[controller.selectedPaymentIdx.value!],
                      'order_type': arguments['order_type'],
                      'price': arguments['price'],
                      'address': arguments['address'],
                      'name': arguments['name'],
                      'phone': arguments['phone'],
                      'order_date': DateTime.now().toString(),
                    });
                  }
                },
                child: Text(
                  'Selanjutnya',
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

class AccordionListTile extends StatelessWidget {
  const AccordionListTile(
      {super.key,
      required this.controller,
      required this.index,
      required this.va});

  final MetodePembayaranController controller;
  final int index;
  final MetodePembayaran va;
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        width: double.infinity,
        padding: EdgeInsets.all(1.5.h),
        color: controller.selectedPaymentIdx.value != null &&
                controller.selectedPaymentIdx.value == index
            ? EcoSanColors.primary.shade600
            : null,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              va.imagePath,
              width: 34 / 360 * 100.w,
            ),
            SizedBox(
              width: 2.5.h,
            ),
            Text(
              va.title,
              style: TextStyles.small.copyWith(color: const Color(0xFF1E1E1E)),
            ),
            const Spacer(),
            controller.selectedPaymentIdx.value != null &&
                    controller.selectedPaymentIdx.value == index
                ? Container(
                    width: 2.5.h,
                    height: 2.5.h,
                    decoration: const BoxDecoration(
                      color: EcoSanColors.primary,
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Container(
                        width: 1.5.h,
                        height: 1.5.h,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                  )
                : const SizedBox()
          ],
        ),
      ),
    );
  }
}
