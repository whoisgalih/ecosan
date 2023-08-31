import 'package:ecosan/app/constants/utils.dart';
import 'package:ecosan/app/models/transaction/transaction_model.dart';
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
              Obx(
                () => Expanded(
                    child: ListView.separated(
                  itemCount: controller.transactions.value.length,
                  separatorBuilder: (context, index) => SizedBox(
                    height: 1.5.h,
                  ),
                  itemBuilder: (context, index) => riwayatCard(
                      controller.transactions.value.elementAt(index)),
                )),
              )
            ],
          ),
        ));
  }

  Container riwayatCard(Transaction transaction) {
    Color typeColor;
    String svgAsset;
    bool isAirSanitation = transaction.orderType == 'Pemasangan Alat' ||
        transaction.orderType == 'Pembersihan Filter';
    if (isAirSanitation) {
      typeColor = EcoSanColors.primary;
      svgAsset = 'assets/svgs/water_drop.svg';
    } else {
      typeColor = EcoSanColors.secondary;
      svgAsset = 'assets/svgs/trash.svg';
    }

    String dateFormatter() {
      DateTime date = DateTime.parse(transaction.orderDate);
      return '${date.day} ${Utils.getMonthFromInt(date.month)} ${date.year}';
    }

    return Container(
      width: double.infinity,
      height: 181 / 800 * 100.h,
      padding: EdgeInsets.symmetric(vertical: 2.25.h, horizontal: 1.5.h),
      decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.25),
              offset: Offset(0, 4),
              blurRadius: 4,
              spreadRadius: 0,
            ),
          ],
          borderRadius: BorderRadius.circular(6),
          border: Border.all(color: typeColor, width: 1),
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
                  color: typeColor,
                ),
                child: SvgPicture.asset(svgAsset),
              ),
              SizedBox(width: 0.5.h),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    isAirSanitation ? 'Sanitasi Air' : 'Sanitasi Sampah',
                    style: TextStyles.normal
                        .extraBold()
                        .copyWith(color: typeColor),
                  ),
                  Text(
                    dateFormatter(),
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
                  color: transaction.status != 'pending'
                      ? const Color(0xFF85E0A3)
                      : EcoSanColors.secondary,
                ),
                child: Text(
                  transaction.status,
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
          Text(transaction.orderType,
              style: TextStyles.small
                  .bold()
                  .copyWith(color: const Color(0xFF55565A))),
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
                    Utils.rupiahFormatter(transaction.price),
                    style: TextStyles.small.semibold(),
                  )
                ],
              ),
              Container(
                padding:
                    EdgeInsets.symmetric(horizontal: 1.5.h, vertical: 0.5.h),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    color: const Color(0xFF14AE5C),
                    border:
                        Border.all(color: const Color(0xFF14AE5C), width: 1)),
                child: Text(
                  'Pesan Lagi',
                  style:
                      TextStyles.tiny.semibold().copyWith(color: Colors.white),
                ),
              )
            ],
          )
        ],
      ),
    );
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
            onChanged: (value) {}),
      ),
    );
  }
}
