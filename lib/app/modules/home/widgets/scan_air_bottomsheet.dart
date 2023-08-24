import 'package:ecosan/app/modules/home/controllers/sanitation_controller.dart';
import 'package:ecosan/app/modules/home/widgets/air_quality.dart';
import 'package:ecosan/app/modules/themes/colors.dart';
import 'package:ecosan/app/modules/themes/fonts.dart';
import 'package:ecosan/app/modules/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class ScanAirBottomSheet extends StatelessWidget {
  ScanAirBottomSheet({
    super.key,
  });
  final SanitationController sanitationController = SanitationController.i;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 2.h),
      width: double.infinity,
      height: 532 / 800 * 100.h,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30), topRight: Radius.circular(30)),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            left: 2.h,
            top: 10,
            child: IconButton(
                onPressed: () {
                  Get.back();
                  sanitationController.takePicture();
                },
                icon: const Icon(
                  Icons.camera,
                  color: Colors.black,
                )),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 30 / 360 * 100.h,
                height: 3,
                color: EcoSanColors.systemGray,
              ),
              SizedBox(
                height: 2.8.h,
              ),
              Text(
                'Hasil Scan Kamera',
                style:
                    TextStyles.normal.semibold().copyWith(color: Colors.black),
              ),
              SizedBox(
                height: 2.5.h,
              ),
              const AirQuality(
                airQuality: 90,
              ),
              SizedBox(
                height: 2.5.h,
              ),
              SizedBox(
                width: 211 / 360 * 100.w,
                child: Text(
                  'Tidak ada kotoran didalam airmu. Kualitas air Sangat Baik!',
                  style: TextStyles.tiny,
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: 3.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    flex: 1,
                    child: EcoSanButton(
                        onTap: () {
                          Get.back();
                        },
                        borderColor: EcoSanColors.primary,
                        color: Colors.white,
                        child: Text(
                          'Home',
                          style: TextStyles.normal
                              .bold()
                              .copyWith(color: EcoSanColors.primary),
                        )),
                  ),
                  SizedBox(
                    width: 2.5.h,
                  ),
                  Flexible(
                    flex: 1,
                    child: EcoSanButton(
                        onTap: () {
                          Get.back();
                          sanitationController.airIndex.value = 2;
                        },
                        color: EcoSanColors.primary,
                        child: Text(
                          'Lihat History',
                          style: TextStyles.normal
                              .bold()
                              .copyWith(color: Colors.white),
                        )),
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
