import 'package:ecosan/app/modules/themes/fonts.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:ecosan/app/modules/themes/colors.dart';
import 'package:sizer/sizer.dart';

import '../controllers/kode_bayar_controller.dart';

class KodeBayarView extends GetView<KodeBayarController> {
  const KodeBayarView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text(
              'Metode Pembayaran',
              style: TextStyles.header3.bold(color: Colors.white),
            ),
            backgroundColor: EcoSanColors.primary),
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
                      'Rp 500.000',
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
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.black, width: 1)),
              )
            ],
          ),
        ));
  }
}
