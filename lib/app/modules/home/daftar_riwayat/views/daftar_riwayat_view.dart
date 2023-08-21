import 'package:ecosan/app/modules/themes/colors.dart';
import 'package:ecosan/app/modules/themes/fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../controllers/daftar_riwayat_controller.dart';

class DaftarRiwayatView extends GetView<DaftarRiwayatController> {
  const DaftarRiwayatView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () => Get.back(),
              icon: const Icon(Icons.arrow_back, color: Colors.white)),
          title: Text(
            'Daftar Riwayat',
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
              SizedBox(height: 2.5.h),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Cari Riwayat',
                  suffixIcon: const Icon(Icons.search),
                  fillColor: const Color(0xFFF1F1F1),
                  filled: true,
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide.none),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: const BorderSide(color: EcoSanColors.primary),
                  ),
                ),
              ),
              SizedBox(height: 2.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RiwayatDropdown(
                    initValue: controller.statusValue.value,
                    items: const [
                      'Semua Status',
                      'Berhasil',
                      'Gagal',
                    ],
                  ),
                  RiwayatDropdown(
                    initValue: controller.layananValue.value,
                    items: const ['Semua Layanan', 'air', 'sampah'],
                  ),
                  RiwayatDropdown(
                    initValue: controller.tanggalValue.value,
                    items: const ['Semua Tanggal', 'blom jadi'],
                  ),
                ],
              ),
              SizedBox(
                height: 2.h,
              ),
              Expanded(
                  child: ListView.separated(
                itemCount: 10,
                separatorBuilder: (context, index) => SizedBox(
                  height: 1.5.h,
                ),
                itemBuilder: (context, index) => Container(
                  width: double.infinity,
                  height: 181 / 800 * 100.h,
                  padding:
                      EdgeInsets.symmetric(vertical: 2.25.h, horizontal: 1.5.h),
                  decoration: BoxDecoration(
                      boxShadow: const [
                        BoxShadow(
                          color: Color.fromRGBO(0, 0, 0, 0.25),
                          offset: Offset(0, 4), // Atur offset shadow (x, y)
                          blurRadius: 4, // Blur radius
                          spreadRadius: 0, // Jarak penyebaran shadow
                        ),
                      ],
                      borderRadius: BorderRadius.circular(6),
                      border: Border.all(color: EcoSanColors.primary, width: 1),
                      color: Colors.white),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            padding: EdgeInsets.all(0.5.h),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6),
                              color: EcoSanColors.primary,
                            ),
                            child:
                                SvgPicture.asset('assets/svgs/water_drop.svg'),
                          ),
                          SizedBox(width: 0.5.h),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Sanitasi Air',
                                style: TextStyles.normal
                                    .extraBold()
                                    .copyWith(color: EcoSanColors.primary),
                              ),
                              Text(
                                '1 Agustus 2023',
                                style: TextStyles.tiny
                                    .copyWith(color: const Color(0xFF838383)),
                              )
                            ],
                          ),
                          const Spacer(),
                          Container(
                            padding: EdgeInsets.all(0.5.h),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6),
                              color: const Color(0xFF85E0A3),
                            ),
                            child: Text(
                              'Berhasil',
                              style: TextStyles.tiny
                                  .semibold()
                                  .copyWith(color: const Color(0xFFFFFFFF)),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 1.5.h,
                      ),
                      Text('Pembersihan Filter',
                          style: TextStyles.small
                              .bold()
                              .copyWith(color: Color(0xFF55565A))),
                      SizedBox(
                        height: 1.5.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Total Harga',
                                style: TextStyles.tiny,
                              ),
                              Text(
                                'Rp. 100.000',
                                style: TextStyles.small.semibold(),
                              )
                            ],
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 1.5.h, vertical: 0.5.h),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6),
                                color: Color(0xFF14AE5C),
                                border: Border.all(
                                    color: Color(0xFF14AE5C), width: 1)),
                            child: Text(
                              'Pesan Lagi',
                              style: TextStyles.tiny
                                  .semibold()
                                  .copyWith(color: Colors.white),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ))
            ],
          ),
        ));
  }
}

class RiwayatDropdown extends StatelessWidget {
  const RiwayatDropdown({
    super.key,
    required this.initValue,
    required this.items,
  });

  final String initValue;
  final List<String> items;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 1.h, vertical: 0.5.h),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: const Color(0xFF55565A), width: 1),
          color: Colors.white),
      child: DropdownButtonHideUnderline(
        child: DropdownButton(
            value: initValue,
            dropdownColor: Colors.white,
            isDense: true,
            borderRadius: BorderRadius.circular(15),
            items: items
                .map((value) => DropdownMenuItem(
                      value: value,
                      child: Text(
                        value,
                        style: TextStyles.tiny2
                            .copyWith(color: const Color(0xFF838383)),
                      ),
                    ))
                .toList(),
            onChanged: (value) {
              print(value);
            }),
      ),
    );
  }
}
