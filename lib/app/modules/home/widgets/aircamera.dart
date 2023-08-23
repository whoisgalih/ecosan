import 'dart:io';

import 'package:camera/camera.dart';
import 'package:ecosan/app/modules/air/controllers/air_controller.dart';
import 'package:ecosan/app/modules/home/controllers/sanitation_controller.dart';
import 'package:ecosan/app/modules/home/widgets/scan_air_bottomsheet.dart';
import 'package:ecosan/app/modules/themes/colors.dart';
import 'package:ecosan/app/modules/themes/fonts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class AirCamera extends StatelessWidget {
  const AirCamera({
    super.key,
    required this.sanitationController,
  });

  final AirController sanitationController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 2.h,
        ),
        Obx(
          () => SizedBox(
            height: 500 / 800 * 100.h,
            child: Stack(alignment: Alignment.center, children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: sanitationController.image.value == null
                    ? CameraPreview(sanitationController.controller!)
                    : Image.file(File(sanitationController.image.value!.path)),
              ),
              sanitationController.isProcessing.value
                  ? Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Memproses hasil scan',
                            style:
                                TextStyles.normal.copyWith(color: Colors.white),
                          ),
                          SizedBox(
                            height: 1.5.h,
                          ),
                          SizedBox(
                            width: 3.h,
                            height: 3.h,
                            child: const CircularProgressIndicator(
                              color: Colors.white,
                            ),
                          )
                        ],
                      ),
                    )
                  : const SizedBox(),
              Positioned(
                bottom: 3.h,
                left: 0,
                right: 0,
                child: sanitationController.image.value == null
                    ? GestureDetector(
                        onTap: () => sanitationController.takePicture(),
                        child: Container(
                          width: 60 / 360 * 100.w,
                          height: 60 / 360 * 100.w,
                          decoration: const BoxDecoration(
                              color: Colors.white, shape: BoxShape.circle),
                        ),
                      )
                    : Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 40 / 360 * 100.w),
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: EcoSanColors.primary,
                              padding: EdgeInsets.symmetric(
                                  vertical: 1.5.h, horizontal: 4.h),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                            ),
                            onPressed: () async {
                              print('mulai');
                              sanitationController.isProcessing.value = true;
                              await Future.delayed(const Duration(seconds: 2));
                              Get.bottomSheet(ScanAirBottomSheet());
                              print('tutup');
                              sanitationController.isProcessing.value = false;
                            },
                            child: Text('Cek Kualitas Air',
                                style: TextStyles.normal
                                    .bold()
                                    .copyWith(color: Colors.white))),
                      ),
              ),
              sanitationController.image.value == null
                  ? Positioned(
                      top: 2.5.h,
                      child: Text('Pindai kualitas air',
                          style:
                              TextStyles.normal.copyWith(color: Colors.white)),
                    )
                  : const SizedBox(),
              Positioned(
                  top: 3.h,
                  right: 10,
                  child: GestureDetector(
                    onTap: () {
                      sanitationController.flashToggle();
                    },
                    child: GestureDetector(
                      onTap: () {
                        if (sanitationController.image.value == null) {
                          sanitationController.flashToggle();
                        } else {
                          sanitationController.takePicture();
                        }
                      },
                      child: Obx(
                        () => Icon(
                          sanitationController.image.value == null
                              ? sanitationController.isFlashOn.value
                                  ? Icons.flash_on
                                  : Icons.flash_off
                              : Icons.camera,
                          color: Colors.white,
                          size: 19,
                        ),
                      ),
                    ),
                  )),
            ]),
          ),
        ),
      ],
    );
  }
}
