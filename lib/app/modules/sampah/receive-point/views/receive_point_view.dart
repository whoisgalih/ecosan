import 'package:ecosan/app/modules/themes/colors.dart';
import 'package:ecosan/app/modules/themes/fonts.dart';
import 'package:ecosan/app/modules/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../controllers/receive_point_controller.dart';

class ReceivePointViewArguments {
  final int point;
  final String message;

  ReceivePointViewArguments({
    required this.point,
    required this.message,
  });
}

class ReceivePointView extends GetView<ReceivePointController> {
  final ReceivePointViewArguments arguments;

  const ReceivePointView({
    Key? key,
    required this.arguments,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                margin: EdgeInsets.only(
                  top: MediaQuery.of(context).padding.top + 48,
                  left: 16,
                  right: 16,
                  bottom: 16,
                ),
                child: Column(
                  children: [
                    Text(
                      "Selamat!",
                      style:
                          TextStyles.header1.bold(color: EcoSanColors.primary),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Text(
                      "Kamu telah mendapatkan poin. Tukarkan poin untuk mendapatkan voucher menarik!",
                      style: TextStyles.normal,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    SvgPicture.asset("assets/svgs/gift.svg", width: 80.w),
                    const SizedBox(
                      height: 16,
                    ),
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: const [
                          BoxShadow(
                            color: Color(0x3F000000),
                            blurRadius: 6,
                            offset: Offset(0, 3),
                            spreadRadius: 0,
                          )
                        ],
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SvgPicture.asset("assets/svgs/trophy.svg", width: 72),
                          const SizedBox(
                            width: 8,
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "${arguments.point} poin",
                                  style: TextStyles.normal.bold(),
                                ),
                                const SizedBox(
                                  height: 4,
                                ),
                                Text(
                                  arguments.message,
                                  style: TextStyles.tiny,
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              bottom: MediaQuery.of(context).padding.bottom + 16,
              left: 16,
              right: 16,
              top: 16,
            ),
            child: EcoSanButton(
              onTap: () {
                Get.back();
              },
              child: Text(
                "Kembali",
                style: TextStyles.normal.bold(color: Colors.white),
              ),
            ),
          )
        ],
      ),
    );
  }
}
