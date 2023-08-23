import 'package:ecosan/app/modules/home/widgets/air_history.dart';
import 'package:ecosan/app/modules/home/widgets/aircamera.dart';
import 'package:ecosan/app/modules/home/widgets/airchip.dart';
import 'package:ecosan/app/modules/home/widgets/sensor_air.dart';
import 'package:ecosan/app/modules/themes/colors.dart';
import 'package:ecosan/app/modules/widgets/bottom_bar.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../controllers/air_controller.dart';

class AirView extends GetView<AirController> {
  const AirView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sanitasi Air'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(16),
          child: Column(
            children: [
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(
                    horizontal: 1.h, vertical: 5 / 800 * 100.h),
                height: 45 / 800 * 100.h,
                decoration: BoxDecoration(
                  color: EcoSanColors.primary,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AirChip(
                      controller: controller,
                      chipAirIndex: 0,
                      chipContent: 'Sensor Air',
                    ),
                    AirChip(
                      controller: controller,
                      chipAirIndex: 1,
                      chipContent: 'Kamera',
                    ),
                    AirChip(
                      controller: controller,
                      chipAirIndex: 2,
                      chipContent: 'Histori',
                    )
                  ],
                ),
              ),
              Obx(() => controller.airIndex.value == 0
                  ? SensorAir(controller: controller)
                  : controller.airIndex.value == 1
                      ? AirCamera(sanitationController: controller)
                      : AirHistory(sanitationController: controller)),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const BottomBar(),
    );
  }
}
