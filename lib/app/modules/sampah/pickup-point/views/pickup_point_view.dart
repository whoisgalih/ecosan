import 'package:ecosan/app/modules/auth/register/data-diri/views/data_diri_view.dart';
import 'package:ecosan/app/modules/themes/fonts.dart';
import 'package:ecosan/app/modules/widgets/button.dart';
import 'package:ecosan/app/modules/widgets/form_input.dart';
import 'package:ecosan/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/pickup_point_controller.dart';

class PickupPointView extends GetView<PickupPointController> {
  const PickupPointView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkResponse(
          onTap: () {
            Get.back();
          },
          child: Icon(
            Icons.arrow_back,
          ),
        ),
        title: const Text('Pickup Point'),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 16, vertical: 24),
          child: Form(
            key: controller.pickupPointFormKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Data Pickup Poin",
                  style: TextStyles.normal.bold(),
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  "Isikan data sampah yang akan dijemput dengan benar dibawah ini:",
                  style: TextStyles.tiny.copyWith(color: Colors.grey[3]),
                ),
                const SizedBox(
                  height: 16,
                ),
                FormInput(
                  // icon person
                  icon: Icons.person,
                  label: "Nama Lengkap",
                  hint: "Masukkan nama lengkap",
                  keyboardType: TextInputType.name,
                  controller: controller.nameController,
                  validator: controller.nameValidator,
                ),
                FormInput(
                  icon: Icons.phone,
                  label: "Nomor Telepon",
                  hint: "Masukkan nomor telepon",
                  keyboardType: TextInputType.phone,
                  controller: controller.phoneController,
                  validator: controller.phoneValidator,
                ),
                FormInput(
                  icon: Icons.location_on,
                  label: "Alamat",
                  hint: "Masukkan alamat",
                  keyboardType: TextInputType.streetAddress,
                  controller: controller.addressController,
                  validator: controller.addressValidator,
                ),
                EcoSanDropDown(
                  title: "Jenis Sampah",
                  hint: "Pilih jenis sampah",
                  icon: Icons.delete,
                  selectedValue: controller.trashTypeValue.value,
                  onChanged: (value) {
                    controller.trashTypeValue.value = value;
                  },
                  validator: controller.trashTypeValidator,
                  options: ["Organik", "Anorganik"],
                ),
                // FormInput(
                //   icon: Icons.delete,
                //   label: "Jenis Sampah",
                //   hint: "Pilih jenis sampah",
                //   keyboardType: TextInputType.none,
                //   controller: controller.trashTypeController,
                // ),
                // berat kisaran
                FormInput(
                  icon: Icons.scale,
                  label: "Berat Kisaran",
                  hint: "Masukkan berat kisaran",
                  keyboardType: TextInputType.number,
                  controller: controller.weightController,
                  validator: controller.weightValidator,
                ),
                EcoSanDropDown(
                  title: "Waktu Pengambilan",
                  hint: "Pilih waktu pengambilan",
                  icon: Icons.watch_later,
                  selectedValue: controller.timeValue.value,
                  onChanged: (value) {
                    controller.timeValue.value = value;
                  },
                  validator: controller.timeValidator,
                  // genereate time from 8 am to 5 pm every 2 hours
                  options: ["08.00", "10.00", "12.00", "14.00", "16.00"],
                ),
                FormInput(
                  icon: Icons.description,
                  label: "Catatan",
                  hint: "Masukkan catatan",
                  keyboardType: TextInputType.text,
                  controller: controller.noteController,
                ),
                const SizedBox(
                  height: 16,
                ),
                EcoSanButton(
                  onTap: () {
                    controller.setPickupPoint();
                  },
                  child: Text(
                    "Selanjutnya",
                    style: TextStyles.normal.bold(
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
