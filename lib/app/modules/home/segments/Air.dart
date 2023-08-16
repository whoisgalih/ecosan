import 'package:ecosan/app/modules/home/controllers/home_controller.dart';
import 'package:ecosan/app/modules/home/widgets/airchip.dart';
import 'package:ecosan/app/modules/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class Air extends StatelessWidget {
  const Air({
    super.key,
    required this.controller,
  });

  final HomeController controller;

  @override
  Widget build(BuildContext context) {
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
                chipContent: 'History',
              )
            ],
          ),
        )
      ],
    );
  }
}
