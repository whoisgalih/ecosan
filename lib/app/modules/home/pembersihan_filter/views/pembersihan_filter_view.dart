import 'package:ecosan/app/modules/themes/colors.dart';
import 'package:ecosan/app/modules/themes/fonts.dart';
import 'package:ecosan/app/modules/widgets/button.dart';
import 'package:ecosan/app/modules/widgets/form_input.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../controllers/pembersihan_filter_controller.dart';

class PembersihanFilterView extends GetView<PembersihanFilterController> {
  const PembersihanFilterView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
            'Pembersihan Filter',
            style: TextStyles.header3.bold(color: Colors.white),
          ),
          backgroundColor: EcoSanColors.primary,
          leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
          )),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 2.h),
        child: Form(
          key: controller.formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 4.h,
              ),
              FormInput(
                  readOnly: true,
                  label: 'Pengaduan',
                  hint: 'Pembersihan Filter',
                  keyboardType: TextInputType.text,
                  controller: controller.pengaduanController),
              SizedBox(
                height: 3.h,
              ),
              Text(
                'Data Pelanggan',
                style: TextStyles.tiny.copyWith(color: Color(0xFF1E1E1E)),
              ),
              SizedBox(
                height: 1.5.h,
              ),
              FormInput(
                  label: 'Nama',
                  validator: (p0) => controller.validateName(p0),
                  hint: 'John Doe',
                  keyboardType: TextInputType.name,
                  controller: controller.nameController),
              SizedBox(
                height: 1.5.h,
              ),
              FormInput(
                  label: 'No. Handphone',
                  validator: (p0) => controller.validateNumber(p0),
                  hint: '+628123456789',
                  keyboardType: TextInputType.text,
                  controller: controller.numberController),
              SizedBox(
                height: 3.h,
              ),
              Text(
                'Lokasi Pembersihan FIlter',
                style: TextStyles.tiny.copyWith(color: Color(0xFF1E1E1E)),
              ),
              SizedBox(
                height: 1.5.h,
              ),
              FormInput(
                  label: 'Alamat',
                  validator: (p0) => controller.validateAddress(p0),
                  hint: 'Perum CY, Jln. Pattimura, No. X8, Bandung',
                  keyboardType: TextInputType.text,
                  controller: controller.addressController),
              const Spacer(),
              EcoSanButton(
                  onTap: () {
                    if (controller.formKey.currentState!.validate()) {
                      Get.toNamed('/home/metode-pembayaran');
                    }
                  },
                  child: Text(
                    'Selanjutnya',
                    style: TextStyles.normal.bold(color: Colors.white),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
