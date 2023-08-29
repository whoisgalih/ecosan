import 'package:ecosan/app/modules/themes/colors.dart';
import 'package:ecosan/app/modules/themes/fonts.dart';
import 'package:ecosan/app/modules/widgets/bottom_bar.dart';
import 'package:ecosan/app/modules/widgets/history_sanitasi_sampah_item.dart';
import 'package:ecosan/app/modules/widgets/icon_container.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/sampah_controller.dart';

class SampahView extends GetView<SampahController> {
  const SampahView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sanitasi Sampah'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 24),
                  width: double.infinity,
                  color: EcoSanColors.primary,
                  height: 100,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 24),
                  child: Row(
                    children: [
                      _buttonSampah(
                          icon: Icons.delivery_dining,
                          title: "Pickup Point",
                          onTap: () {
                            Get.toNamed('/sampah/pickup-point');
                          }),
                      const SizedBox(
                        width: 24,
                      ),
                      _buttonSampah(
                          icon: Icons.pin_drop_rounded,
                          title: "Drop Point",
                          onTap: () {
                            Get.toNamed('/sampah/drop-point');
                          }),
                    ],
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            Container(
              margin: EdgeInsets.all(16),
              width: double.infinity,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    _filterItem(title: "All", onTap: () {}),
                    _filterItem(title: "Riwayat Pickup Poin", onTap: () {}),
                    _filterItem(title: "Riwayat Drop Poin", onTap: () {}),
                  ],
                ),
              ),
            ),
            Column(
              children: [
                HistorySanitasiSampahItem(),
                HistorySanitasiSampahItem(),
              ],
            )
          ],
        ),
      ),
      bottomNavigationBar: const BottomBar(),
    );
  }

  Container _filterItem(
      {required String title, required GestureTapCallback onTap}) {
    return Container(
      margin: EdgeInsets.only(left: 8),
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Material(
        color: EcoSanColors.primary[50],
        child: InkWell(
          onTap: onTap,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            child: Text(
              title,
              style: TextStyles.tiny.copyWith(
                color: EcoSanColors.primary,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Expanded _buttonSampah({
    required IconData icon,
    required String title,
    required GestureTapCallback onTap,
  }) {
    return Expanded(
      child: Container(
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Color(0x26000000),
              blurRadius: 15,
              offset: Offset(0, 1),
              spreadRadius: 0,
            )
          ],
        ),
        child: Material(
          color: Colors.white,
          child: InkWell(
            onTap: onTap,
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                children: [
                  IconContainer(icon: icon),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    title,
                    style: TextStyles.small.bold(),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
