import 'package:ecosan/app/modules/home/views/home_view.dart';
import 'package:ecosan/app/modules/themes/colors.dart';
import 'package:ecosan/app/modules/themes/fonts.dart';
import 'package:ecosan/app/modules/widgets/bottom_bar.dart';
import 'package:ecosan/app/modules/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ProfileView'),
        centerTitle: true,
      ),
      body: Container(
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
                          backgroundImage: controller.user.photoUrl != null
                              ? NetworkImage(controller.user.photoUrl!)
                              : null,
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
                      child: Obx(
                        () => Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              controller.user.name,
                              style: TextStyles.header3
                                  .bold()
                                  .copyWith(color: Colors.black),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const Icon(Icons.location_on,
                                    color: Colors.red),
                                Expanded(
                                  child: Text(controller.user.city,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyles.small.copyWith(
                                          color: const Color(0xFF94959A))),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 1.h,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                SizedBox(
                                  width: 132 / 360 * 100.w,
                                  child: EcoSanButton(
                                      onTap: () => Get.toNamed('home/edit'),
                                      child: Text(
                                        'Edit Profile',
                                        style: TextStyles.normal
                                            .bold()
                                            .copyWith(color: Colors.white),
                                      )),
                                ),
                              ],
                            )
                          ],
                        ),
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
              padding: EdgeInsets.symmetric(horizontal: 1.5.h, vertical: 2.5.h),
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
                                shape: BoxShape.circle, color: Colors.white),
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
                    leading: SvgPicture.asset('assets/svgs/question.svg',
                        color: EcoSanColors.primary),
                    title: 'Hubungi Kami',
                    ontap: () => Get.toNamed('home/contact'),
                  ),
                  ProfileListTile(
                      leading:
                          const Icon(Icons.logout, color: EcoSanColors.primary),
                      title: 'Keluar',
                      ontap: () => showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              backgroundColor: EcoSanColors.primary,
                              titlePadding: EdgeInsets.zero,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              contentPadding: EdgeInsets.zero,
                              title: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      IconButton(
                                          onPressed: () {},
                                          icon: const Icon(
                                            Icons.close,
                                            color: Colors.white,
                                            size: 10,
                                          ))
                                    ],
                                  ),
                                  Center(
                                    child: Text(
                                      'Keluar',
                                      style: TextStyles.normal
                                          .semibold(color: Colors.white),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 18,
                                  ),
                                ],
                              ),
                              content: Container(
                                decoration: const BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(10),
                                      bottomRight: Radius.circular(10),
                                    )),
                                height: 100,
                                child: const Column(
                                  children: [Text('asdasdasd')],
                                ),
                              ),
                            ),
                          ))
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const BottomBar(),
    );
  }
}
