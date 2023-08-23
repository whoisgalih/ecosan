import 'package:ecosan/app/modules/themes/colors.dart';
import 'package:ecosan/app/modules/themes/fonts.dart';
import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:sizer/sizer.dart';

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
