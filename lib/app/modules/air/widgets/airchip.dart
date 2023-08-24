import 'package:ecosan/app/modules/air/controllers/air_controller.dart';
import 'package:ecosan/app/modules/home/controllers/home_controller.dart';
import 'package:ecosan/app/modules/home/controllers/sanitation_controller.dart';
import 'package:ecosan/app/modules/themes/fonts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class AirChip extends StatelessWidget {
  const AirChip({
    super.key,
    required this.controller,
    required this.chipAirIndex,
    required this.chipContent,
  });

  final AirController controller;
  final int chipAirIndex;
  final String chipContent;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => GestureDetector(
        onTap: () => controller.airIndex.value = chipAirIndex,
        child: Container(
          height: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 14 / 800 * 100.h),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: controller.airIndex.value == chipAirIndex
                  ? Colors.white
                  : null),
          child: SizedBox(
            width: 72 / 360 * 100.w,
            child: Center(
              child: Text(
                chipContent,
                style: TextStyles.tiny.copyWith(
                    color: controller.airIndex.value == chipAirIndex
                        ? Colors.black
                        : Colors.white),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
