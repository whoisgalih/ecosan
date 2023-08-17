import 'dart:io';

import 'package:camera/camera.dart';
import 'package:ecosan/app/modules/home/controllers/home_controller.dart';
import 'package:ecosan/app/modules/home/controllers/sanitation_controller.dart';
import 'package:ecosan/app/modules/home/widgets/airchip.dart';
import 'package:ecosan/app/modules/themes/colors.dart';
import 'package:ecosan/app/modules/themes/fonts.dart';
import 'package:ecosan/app/modules/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:sizer/sizer.dart';

class Air extends StatelessWidget {
  const Air({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final sanitationController = SanitationController.i;
    return Column(
      children: [
        Container(
          width: double.infinity,
          padding:
              EdgeInsets.symmetric(horizontal: 1.h, vertical: 5 / 800 * 100.h),
          height: 45 / 800 * 100.h,
          decoration: BoxDecoration(
            color: EcoSanColors.primary,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AirChip(
                controller: sanitationController,
                chipAirIndex: 0,
                chipContent: 'Sensor Air',
              ),
              AirChip(
                controller: sanitationController,
                chipAirIndex: 1,
                chipContent: 'Kamera',
              ),
              AirChip(
                controller: sanitationController,
                chipAirIndex: 2,
                chipContent: 'Histori',
              )
            ],
          ),
        ),
        Obx(() => sanitationController.airIndex.value == 0
            ? SensorAir(controller: sanitationController)
            : sanitationController.airIndex.value == 1
                ? AirCamera(sanitationController: sanitationController)
                : const SizedBox()),
      ],
    );
  }
}

class AirCamera extends StatelessWidget {
  const AirCamera({
    super.key,
    required this.sanitationController,
  });

  final SanitationController sanitationController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 2.h,
        ),
        SizedBox(
          height: 500 / 800 * 100.h,
          child: Stack(alignment: Alignment.center, children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: sanitationController.image.value == null
                  ? CameraPreview(sanitationController.controller!)
                  : Image.file(File(sanitationController.image.value!.path)),
            ),
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
                            sanitationController.isProcessing.value = true;
                            await Future.delayed(const Duration(seconds: 2));
                            Get.bottomSheet(ScanAirBottomSheet());
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
                        style: TextStyles.normal.copyWith(color: Colors.white)),
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
                    child: Icon(
                      sanitationController.image.value == null
                          ? sanitationController.isFlashOn.value
                              ? Icons.flash_on
                              : Icons.flash_off
                          : Icons.camera,
                      color: Colors.white,
                      size: 19,
                    ),
                  ),
                ))
          ]),
        ),
      ],
    );
  }
}

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
                          HomeController.i.index.value = 0;
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

class SensorAir extends StatelessWidget {
  const SensorAir({
    super.key,
    required this.controller,
  });

  final SanitationController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(vertical: 20 / 800 * 100.h),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Status Air Saat ini',
                style: TextStyles.normal.semibold(),
              ),
              SizedBox(
                height: 21 / 800 * 100.h,
              ),
              Obx(
                () => AirQuality(
                  airQuality: controller.airQuality.value,
                ),
              )
            ],
          ),
        ),
        Obx(
          () => controller.airQuality.value != null
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Rincian Kualitas Air',
                      style: TextStyles.small.semibold(),
                    ),
                    SizedBox(
                      height: 1.5.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Flexible(
                            flex: 1,
                            child: WaterQualityContainer(
                              indicator: 'pH',
                              value: '7.5',
                              unit: '',
                            )),
                        SizedBox(
                          width: 33 / 360 * 100.w,
                        ),
                        const Flexible(
                            flex: 1,
                            child: WaterQualityContainer(
                              indicator: 'ORP',
                              value: '700',
                              unit: 'mV',
                            )),
                        SizedBox(
                          width: 33 / 360 * 100.w,
                        ),
                        const Flexible(
                            flex: 1,
                            child: WaterQualityContainer(
                              indicator: 'TDS',
                              value: '500',
                              unit: 'ppm',
                            )),
                      ],
                    )
                  ],
                )
              : const Text(
                  'Status air tidak dapat diketahui karena kamu belum memasang Sensor Air. Pasang Sensor Air sekarang!'),
        ),
        SizedBox(
          height: 2.5.h,
        ),
        SizedBox(
          width: double.infinity,
          child: Obx(
            () => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                controller.airQuality.value != null
                    ? Text(
                        'Layanan Sanitasi Air',
                        style: TextStyles.small.semibold(),
                      )
                    : const SizedBox(),
                controller.airQuality.value != null
                    ? SizedBox(
                        height: 1.5.h,
                      )
                    : const SizedBox(),
                const LayananSanitasiListTile(
                  layananName: 'Pembersihan Filter',
                ),
                SizedBox(
                  height: 0.8.h,
                ),
                const LayananSanitasiListTile(
                  layananName: 'Pemasangan Alat',
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}

class AirQuality extends StatelessWidget {
  const AirQuality({super.key, this.airQuality});
  final int? airQuality;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 194 / 360 * 100.w,
          height: 194 / 360 * 100.w,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: airQuality != null
                ? airQuality! >= 80
                    ? EcoSanColors.primary.shade400
                    : EcoSanColors.secondary.shade400
                : EcoSanColors.systemGray[2],
          ),
        ),
        GlassmorphicContainer(
          width: 194 / 360 * 100.w,
          height: 194 / 360 * 100.w,
          borderRadius: 1000,
          linearGradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              const Color(0xFFffffff).withOpacity(0.3),
              const Color(0xFFFFFFFF).withOpacity(0.3),
            ],
          ),
          borderGradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              const Color(0xFFffffff).withOpacity(0.5),
              const Color((0xFFFFFFFF)).withOpacity(0.5),
            ],
          ),
          border: 0,
          blur: 60,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  airQuality?.toString() ?? '-',
                  style: TextStyles.header1.bold().extraLarge(),
                ),
                Text(
                  airQuality == null
                      ? 'Tidak Diketahuui'
                      : airQuality! >= 80
                          ? 'Sangat Baik'
                          : 'Buruk',
                  style: TextStyles.header2.semibold(),
                )
              ],
            ),
          ),
        ),
        airQuality == null || airQuality! < 80
            ? Positioned(
                top: 0,
                right: 0,
                child: Container(
                  width: 60 / 360 * 100.w,
                  height: 60 / 360 * 100.w,
                  decoration: const BoxDecoration(
                    color: EcoSanColors.primary,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.warning,
                    color: EcoSanColors.secondary,
                    size: 25,
                  ),
                ))
            : const SizedBox()
      ],
    );
  }
}

class LayananSanitasiListTile extends StatelessWidget {
  const LayananSanitasiListTile(
      {super.key, this.onTap, required this.layananName});

  final Function()? onTap;
  final String layananName;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 1.h, horizontal: 1.5.h),
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.black.withOpacity(0.1), // Border color
            width: 1.0, // Border thickness
          ),
          borderRadius: BorderRadius.circular(10.0), // Border radius
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(layananName),
            Icon(
              Icons.arrow_forward_ios_rounded,
              color: Colors.grey.shade500,
            )
          ],
        ),
      ),
    );
  }
}

class WaterQualityContainer extends StatelessWidget {
  const WaterQualityContainer({
    super.key,
    required this.indicator,
    required this.value,
    this.unit,
  });

  final String indicator;
  final String value;
  final String? unit;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(1.5.h),
      width: double.infinity,
      height: 93 / 800 * 100.h,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.black.withOpacity(0.1))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            indicator,
            style: TextStyles.tiny.copyWith(color: EcoSanColors.systemGray[1]),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                value,
                style: TextStyles.header3,
              ),
              Text(
                unit ?? '',
                style: TextStyles.tiny2,
              )
            ],
          )
        ],
      ),
    );
  }
}
