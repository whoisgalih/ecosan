import 'package:ecosan/app/modules/themes/fonts.dart';
import 'package:ecosan/app/modules/widgets/button.dart';
import 'package:ecosan/app/modules/widgets/form_input.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/data_diri_controller.dart';

class DataDiriView extends GetView<DataDiriController> {
  const DataDiriView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Data Diri",
                    style: TextStyles.header2.bold(),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "Isilah data diri dibawah ini dengan benar dan lengkap.",
                    style: TextStyles.normal,
                  )
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  FormInput(
                      hint: "Masukan nama lengkap",
                      icon: Icons.person,
                      label: "Nama Lengkap",
                      keyboardType: TextInputType.name),
                  SizedBox(height: 16),
                  FormInput(
                      label: "Nomor Telepon",
                      hint: "Masukan nomor telepon",
                      keyboardType: TextInputType.phone,
                      icon: Icons.phone),
                  SizedBox(height: 16),
                  FormInput(
                      label: "Tanggal Lahir",
                      hint: "Pilih tanggal lahir",
                      keyboardType: TextInputType.datetime,
                      icon: Icons.calendar_today),
                  SizedBox(height: 16),
                  FormInput(
                      label: "Asal Kota",
                      hint: "Pilih asal kota",
                      keyboardType: TextInputType.text,
                      icon: Icons.location_city),
                ],
              ),
            ),
            SizedBox(height: 88),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  EcoSanButton(
                    onTap: () {},
                    child: Text(
                      "Simpan",
                      style: TextStyles.normal.bold(color: Colors.white),
                    ),
                  ),
                  const SizedBox(height: 40),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
