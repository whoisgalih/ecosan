import 'dart:io';

import 'package:ecosan/app/modules/home/controllers/sanitation_controller.dart';
import 'package:ecosan/app/modules/home/widgets/aircamera.dart';
import 'package:ecosan/app/modules/home/widgets/airchip.dart';
import 'package:ecosan/app/modules/home/widgets/sensor_air.dart';
import 'package:ecosan/app/modules/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
