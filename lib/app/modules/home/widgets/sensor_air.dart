import 'package:ecosan/app/modules/home/controllers/sanitation_controller.dart';
import 'package:ecosan/app/modules/home/widgets/air_quality.dart';
import 'package:ecosan/app/modules/themes/colors.dart';
import 'package:ecosan/app/modules/themes/fonts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

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
