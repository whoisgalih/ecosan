import 'package:ecosan/app/modules/themes/colors.dart';
import 'package:ecosan/app/modules/themes/fonts.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(
          margin: EdgeInsets.only(left: 2.h),
          child: Image.asset(
            'assets/images/ecosan_horizontal_logo.png',
          ),
        ),
        leadingWidth: 101 / 800 * 100.h,
        actions: [
          Obx(
            () => controller.index.value != 0
                ? Text(
                    'Butuh bantuan?',
                    style: TextStyles.tiny,
                  )
                : const SizedBox(),
          ),
          Obx(
            () => controller.index.value != 0
                ? SizedBox(
                    width: 1.h,
                  )
                : const SizedBox(),
          ),
          Obx(
            () => controller.index.value != 0
                ? Container(
                    padding: const EdgeInsets.all(5),
                    height: 34 / 360 * 100.w,
                    width: 34 / 360 * 100.w,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: EcoSanColors.systemWhite,
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromRGBO(0, 0, 0, 0.10),
                            blurRadius: 0.3,
                            offset: Offset(0, 0.3),
                          ),
                          BoxShadow(
                            color: Color.fromRGBO(0, 0, 0, 0.10),
                            blurRadius: 1.6,
                            offset: Offset(0, 1.6),
                          ),
                        ]),
                    child: Image.asset(
                      'assets/images/ecosan_vertical_logo.png',
                      fit: BoxFit.contain,
                      scale: 0.5,
                    ),
                  )
                : Container(
                    height: 40 / 800 * 100.h,
                    width: 40 / 800 * 100.h,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle, color: EcoSanColors.primary),
                    child: const Icon(
                      Icons.notifications,
                      color: Colors.white,
                    ),
                  ),
          ),
          SizedBox(
            width: 2.h,
          )
        ],
      ),
      body: const Center(),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.water_drop), label: "Air"),
            BottomNavigationBarItem(
                icon: Icon(Icons.recycling), label: "Sampah"),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
          ],
          currentIndex: controller.index.value,
          onTap: (index) {
            controller.index.value = index;
          },
        ),
      ),
    );
  }
}
