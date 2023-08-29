import 'package:ecosan/app/modules/themes/colors.dart';
import 'package:ecosan/app/modules/themes/fonts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class EcosansAlert extends StatelessWidget {
  const EcosansAlert({
    super.key,
    required this.title,
    required this.content,
  });
  final String title;
  final Widget content;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: EcoSanColors.primary,
      titlePadding: EdgeInsets.zero,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      contentPadding: EdgeInsets.zero,
      title: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                  onPressed: () => Get.back(),
                  icon: const Icon(
                    Icons.close,
                    color: Colors.white,
                    size: 10,
                  ))
            ],
          ),
          Center(
            child: Text(
              title,
              style: TextStyles.normal.semibold(color: Colors.white),
            ),
          ),
          const SizedBox(
            height: 18,
          ),
        ],
      ),
      content: Container(
        padding: EdgeInsets.symmetric(vertical: 2.5.h, horizontal: 2.25.h),
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10),
            )),
        width: double.infinity,
        child: content,
      ),
    );
  }
}
