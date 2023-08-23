import 'package:ecosan/app/modules/themes/colors.dart';
import 'package:ecosan/app/modules/themes/fonts.dart';
import 'package:ecosan/app/modules/widgets/button.dart';
import 'package:ecosan/app/modules/widgets/form_input.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../controllers/edit_controller.dart';

class EditView extends GetView<EditController> {
  const EditView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () => Get.back(),
            icon: const Icon(Icons.arrow_back, color: Colors.white)),
        title: Text(
          'Edit Profile',
          style: TextStyles.header3.bold().copyWith(color: Colors.white),
        ),
        centerTitle: false,
        backgroundColor: EcoSanColors.primary,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 2.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 1.5.h,
            ),
            Center(
              child: Container(
                padding: EdgeInsets.all(1.h),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromRGBO(0, 0, 0, 0.25),
                      offset: Offset(0, 4),
                      blurRadius: 4,
                      spreadRadius: 0,
                    ),
                  ],
                ),
                child: CircleAvatar(
                  backgroundImage: controller.homeController.authController
                              .firebaseUser.value!.photoURL !=
                          null
                      ? NetworkImage(controller.homeController.authController
                          .firebaseUser.value!.photoURL!)
                      : null,
                  radius: 90 / 2 / 360 * 100.w,
                ),
              ),
            ),
            SizedBox(
              height: 1.5.h,
            ),
            FormInput(
                label: 'Nama Lengkap',
                icon: Icons.person,
                hint: '',
                keyboardType: TextInputType.name,
                controller: controller.nameEditingController),
            FormInput(
                label: 'Nomor Telepon',
                icon: Icons.phone,
                hint: '',
                keyboardType: TextInputType.number,
                controller: controller.telpEditingController),
            FormInput(
                label: 'Alamat',
                icon: Icons.home,
                hint: '',
                keyboardType: TextInputType.streetAddress,
                controller: controller.addressEditingController),
            FormInput(
                label: 'Email',
                icon: Icons.email,
                hint: '',
                keyboardType: TextInputType.emailAddress,
                controller: controller.emailEditingController),
            FormInput(
                label: 'Password',
                hint: '',
                icon: Icons.lock,
                keyboardType: TextInputType.visiblePassword,
                controller: controller.passwordEditingController),
            const Spacer(),
            EcoSanButton(
                onTap: () {},
                child: Text(
                  'Simpan Perubahan',
                  style: TextStyles.normal.bold(color: Colors.white),
                )),
            SizedBox(
              height: 4.5.h,
            )
          ],
        ),
      ),
    );
  }
}
