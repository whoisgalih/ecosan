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
          titleSpacing: 0,
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
                  ),
                  FormInput(
                    icon: Icons.phone,
                    label: "Nomor Telepon",
                    hint: "Masukkan nomor telepon",
                    keyboardType: TextInputType.phone,
                    controller: controller.phoneController,
                  ),
                  FormInput(
                    icon: Icons.location_on,
                    label: "Alamat",
                    hint: "Masukkan alamat",
                    keyboardType: TextInputType.streetAddress,
                    controller: controller.addressController,
                  ),
                  FormInput(
                    icon: Icons.delete,
                    label: "Jenis Sampah",
                    hint: "Pilih jenis sampah",
                    keyboardType: TextInputType.none,
                    controller: controller.trashTypeController,
                  ),
                  // berat kisaran
                  FormInput(
                    icon: Icons.scale,
                    label: "Berat Kisaran",
                    hint: "Masukkan berat kisaran",
                    keyboardType: TextInputType.number,
                    controller: controller.weightController,
                  ),
                  FormInput(
                    icon: Icons.watch_later,
                    label: "Waktu Pengambilan",
                    hint: "Pilih waktu pengambilan",
                    keyboardType: TextInputType.datetime,
                    controller: controller.timeController,
                  ),
                  FormInput(
                    icon: Icons.description,
                    label: "Catatan",
                    hint: "Masukkan catatan",
                    keyboardType: TextInputType.text,
                    controller: controller.noteController,
                  ),
                  EcoSanButton(
                    onTap: () {
                      Get.toNamed(Routes.REVIEW_PICKUP_POINT);
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
        ));
  }
}
