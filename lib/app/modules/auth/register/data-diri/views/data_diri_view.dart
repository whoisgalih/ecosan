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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Form(
                key: controller.registerFormKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    FormInput(
                      hint: "Masukan nama lengkap",
                      controller: controller.nameEditingController,
                      icon: Icons.person,
                      label: "Nama Lengkap",
                      keyboardType: TextInputType.name,
                      validator: controller.nameValidator,
                    ),
                    FormInput(
                      label: "Nomor Telepon",
                      hint: "Masukan nomor telepon",
                      controller: controller.phoneEditingController,
                      keyboardType: TextInputType.phone,
                      icon: Icons.phone,
                      validator: controller.phoneValidator,
                    ),
                    FormInput(
                      label: "Tanggal Lahir",
                      controller: controller.dateEditingController,
                      hint: "Pilih tanggal lahir",
                      readOnly: true,
                      keyboardType: TextInputType.datetime,
                      onTap: () async {
                        final pickedDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime(2000),
                            firstDate: DateTime(1945),
                            lastDate: DateTime(2020));
                        if (pickedDate != null) {
                          controller.dateEditingController.text =
                              "${pickedDate.day.toString().padLeft(2, '0')}/${pickedDate.month.toString().padLeft(2, '0')}/${pickedDate.year}";
                        }
                      },
                      icon: Icons.calendar_today,
                      validator: controller.dateValidator,
                    ),
                    EcoSanDropDown(
                      title: "Asal Kota",
                      hint: "Pilih asal kota",
                      icon: Icons.location_city,
                      selectedValue: controller.cityValue.value,
                      onChanged: (value) {
                        controller.cityValue.value = value;
                      },
                      validator: controller.cityValidator,
                      options: controller.regencies,
                    ),
                    const SizedBox(height: 88),
                    EcoSanButton(
                      onTap: controller.register,
                      child: Text(
                        "Simpan",
                        style: TextStyles.normal.bold(color: Colors.white),
                      ),
                    ),
                    const SizedBox(height: 40),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class EcoSanDropDown extends StatelessWidget {
  const EcoSanDropDown({
    super.key,
    required this.selectedValue,
    required this.onChanged,
    required this.validator,
    required this.options,
    required this.title,
    required this.hint,
    required this.icon,
  });

  final String title;
  final String hint;
  final IconData icon;

  final dynamic selectedValue;
  final ValueChanged onChanged;
  final FormFieldValidator validator;
  final List<dynamic> options;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyles.tiny.bold(),
          ),
          SizedBox(height: 4),
          DropdownButtonFormField(
            validator: validator,
            dropdownColor: Colors.white,
            value: selectedValue,
            onChanged: onChanged,
            decoration: InputDecoration(
              prefixIcon: Icon(
                icon,
                size: 24,
              ),
            ),
            style: TextStyles.tiny.copyWith(color: Colors.black),
            hint: Text(hint),
            items: options.map((e) {
              return DropdownMenuItem(
                value: e,
                child: Text(e),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
