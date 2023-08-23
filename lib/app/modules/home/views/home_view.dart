import 'package:ecosan/app/modules/home/segments/air.dart';
import 'package:ecosan/app/modules/themes/colors.dart';
import 'package:ecosan/app/modules/themes/fonts.dart';
import 'package:ecosan/app/modules/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Obx(
          () => controller.index.value == 0
              ? Container(
                  margin: EdgeInsets.only(left: 2.h),
                  child: Image.asset(
                    'assets/images/ecosan_horizontal_logo.png',
                  ),
                )
              : const SizedBox(),
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
      body: Obx(
        () => controller.index.value == 0
            ? const SizedBox()
            : controller.index.value == 1
                ? Padding(
                    padding: EdgeInsets.symmetric(horizontal: 2.h),
                    child: const Air(),
                  )
                : Container(
                    color: const Color(0xFFF9F5FB),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 129 / 800 * 100.h,
                          width: double.infinity,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                width: 40.w,
                                height: double.infinity,
                                decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(100),
                                    bottomRight: Radius.circular(100),
                                  ),
                                  color: EcoSanColors.primary,
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    CircleAvatar(
                                      radius: 45 / 360 * 100.w,
                                      backgroundColor: Colors.white,
                                    ),
                                    SizedBox(
                                      width: 1.h,
                                    )
                                  ],
                                ),
                              ),
                              Expanded(
                                  child: Padding(
                                padding: const EdgeInsets.only(),
                                child: Padding(
                                  padding: EdgeInsets.only(right: 2.h),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        controller.user.value.name,
                                        style: TextStyles.header3
                                            .bold()
                                            .copyWith(color: Colors.black),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          const Icon(Icons.location_on,
                                              color: Colors.red),
                                          Text(controller.user.value.city,
                                              style: TextStyles.small.copyWith(
                                                  color:
                                                      const Color(0xFF94959A))),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 1.h,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          SizedBox(
                                            width: 132 / 360 * 100.w,
                                            child: EcoSanButton(
                                                onTap: () =>
                                                    Get.toNamed('home/edit'),
                                                child: Text(
                                                  'Edit Profile',
                                                  style: TextStyles.normal
                                                      .bold()
                                                      .copyWith(
                                                          color: Colors.white),
                                                )),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              )),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        Container(
                          color: Colors.white,
                          width: double.infinity,
                          padding: EdgeInsets.symmetric(
                              horizontal: 1.5.h, vertical: 2.5.h),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Flexible(
                                  flex: 1,
                                  child: ProfileCard(
                                    title: 'Poinku',
                                    color: EcoSanColors.secondary,
                                    value: 10000,
                                    buttonStr: 'Tukarkan',
                                    onTap: () => Get.toNamed('home/poinku'),
                                    leadingWidget: Container(
                                        width: 32 / 360 * 100.w,
                                        height: 32 / 360 * 100.w,
                                        decoration: const BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Colors.white),
                                        child: const Center(
                                          child: Icon(
                                            Icons.attach_money_rounded,
                                            color: EcoSanColors.secondary,
                                          ),
                                        )),
                                  )),
                              SizedBox(
                                width: 2.5.h,
                              ),
                              Flexible(
                                  flex: 1,
                                  child: ProfileCard(
                                    color: EcoSanColors.primary,
                                    title: 'Voucherku',
                                    value: 5,
                                    buttonStr: 'Detail',
                                    onTap: () => Get.toNamed('home/voucherku'),
                                    leadingWidget: SizedBox(
                                        width: 32 / 360 * 100.w,
                                        height: 32 / 360 * 100.w,
                                        child: SvgPicture.asset(
                                          'assets/svgs/voucher.svg',
                                          color: Colors.white,
                                        )),
                                  )),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 3.h,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 2.h),
                          child: Column(
                            children: [
                              ProfileListTile(
                                leading: const Icon(
                                  Icons.history,
                                  color: EcoSanColors.primary,
                                ),
                                title: 'Daftar Riwayat',
                                ontap: () => Get.toNamed('home/daftar-riwayat'),
                              ),
                              ProfileListTile(
                                leading: SvgPicture.asset('assets/svgs/faq.svg',
                                    color: EcoSanColors.primary),
                                title: 'FAQ',
                                ontap: () => Get.toNamed('home/faq'),
                              ),
                              ProfileListTile(
                                leading: SvgPicture.asset(
                                    'assets/svgs/question.svg',
                                    color: EcoSanColors.primary),
                                title: 'Hubungi Kami',
                                ontap: () => Get.toNamed('home/contact'),
                              ),
                              ProfileListTile(
                                  leading: const Icon(Icons.logout,
                                      color: EcoSanColors.primary),
                                  title: 'Keluar',
                                  ontap: () => Get.defaultDialog(
                                        title: 'Keluar',
                                        middleText:
                                            'Apakah anda yakin ingin keluar?',
                                        textConfirm: 'Ya',
                                        textCancel: 'Tidak',
                                        confirmTextColor: Colors.white,
                                        onConfirm: () {
                                          controller.signOut();
                                        },
                                        onCancel: () {},
                                      ))
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
      ),
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
            controller.index(index);
          },
        ),
      ),
    );
  }
}

class ProfileListTile extends StatelessWidget {
  const ProfileListTile(
      {super.key,
      required this.leading,
      required this.title,
      required this.ontap});
  final Widget leading;
  final String title;
  final Function() ontap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        margin: EdgeInsets.only(bottom: 2.h),
        height: 40 / 800 * 100.h,
        color: Colors.transparent,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.all(1.h),
                  decoration: BoxDecoration(
                    color: EcoSanColors.primary.shade600,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: leading,
                ),
                SizedBox(
                  width: 2.h,
                ),
                Text(
                  title,
                  style: TextStyles.small.bold().copyWith(color: Colors.black),
                )
              ],
            ),
            const Icon(
              Icons.arrow_forward_ios,
              color: Colors.black,
            )
          ],
        ),
      ),
    );
  }
}

class ProfileCard extends StatelessWidget {
  const ProfileCard(
      {super.key,
      required this.leadingWidget,
      required this.title,
      required this.color,
      required this.value,
      required this.buttonStr,
      required this.onTap});
  final Widget leadingWidget;
  final String title;
  final int value;
  final String buttonStr;
  final Function() onTap;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 112 / 800 * 100.h,
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 1.25.h, horizontal: 2.h),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          leadingWidget,
          SizedBox(
            width: 1.5.h,
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyles.small.copyWith(color: Colors.white),
                    ),
                    Text(value.toString(),
                        style: TextStyles.header2
                            .bold()
                            .copyWith(color: Colors.white)),
                  ],
                ),
                Flexible(
                  flex: 1,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding:
                            EdgeInsets.symmetric(vertical: 2, horizontal: 1.h),
                        minimumSize: const Size(double.infinity, 0),
                      ),
                      onPressed: onTap,
                      child: Text(
                        buttonStr,
                        style: TextStyles.tiny.bold(color: color),
                      )),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
