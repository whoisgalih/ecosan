import 'package:accordion/accordion.dart';
import 'package:ecosan/app/modules/themes/colors.dart';
import 'package:ecosan/app/modules/themes/fonts.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../controllers/faq_controller.dart';

class FaqView extends GetView<FaqController> {
  const FaqView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () => Get.back(),
              icon: const Icon(Icons.arrow_back, color: Colors.white)),
          title: Text(
            'FAQs',
            style: TextStyles.header3.bold().copyWith(color: Colors.white),
          ),
          centerTitle: false,
          backgroundColor: EcoSanColors.primary,
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(vertical: 2.5.h, horizontal: 2.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
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
              SizedBox(
                height: 3.75.h,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Tentang Sanitasi Air',
                    style: TextStyles.normal.bold(color: EcoSanColors.primary),
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  Accordion(
                      paddingListTop: 0,
                      paddingListBottom: 0,
                      paddingListHorizontal: 0,
                      headerPadding: EdgeInsets.symmetric(vertical: 1.h),
                      contentHorizontalPadding: 0,
                      headerBackgroundColor: Colors.white,
                      contentBackgroundColor: Colors.white,
                      rightIcon: Icon(
                        Icons.keyboard_arrow_down,
                        color: EcoSanColors.systemGray[2],
                      ),
                      contentBorderColor: Colors.white,
                      children: controller.sanitasiAirAccordionData
                          .map((data) => AccordionSection(
                              header: Text(
                                data['header']!,
                                style:
                                    TextStyles.tiny.bold(color: Colors.black),
                              ),
                              content: Text(
                                data['content']!,
                                style: TextStyles.tiny2,
                              )))
                          .toList()),
                  SizedBox(
                    height: 3.75.h,
                  ),
                  Text(
                    'Tentang Sanitasi Air',
                    style: TextStyles.normal.bold(color: EcoSanColors.primary),
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  Accordion(
                      paddingListTop: 0,
                      paddingListBottom: 0,
                      paddingListHorizontal: 0,
                      headerPadding: EdgeInsets.symmetric(vertical: 1.h),
                      contentHorizontalPadding: 0,
                      headerBackgroundColor: Colors.white,
                      contentBackgroundColor: Colors.white,
                      rightIcon: Icon(
                        Icons.keyboard_arrow_down,
                        color: EcoSanColors.systemGray[2],
                      ),
                      contentBorderColor: Colors.white,
                      children: controller.sanitasiSampahAccordionData
                          .map((data) => AccordionSection(
                              header: Text(
                                data['header']!,
                                style:
                                    TextStyles.tiny.bold(color: Colors.black),
                              ),
                              content: Text(
                                data['content']!,
                                style: TextStyles.tiny2,
                              )))
                          .toList()),
                ],
              )
            ],
          ),
        ));
  }
}
