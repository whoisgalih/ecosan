import 'package:ecosan/app/modules/themes/colors.dart';
import 'package:ecosan/app/modules/themes/fonts.dart';
import 'package:ecosan/app/modules/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:url_launcher/url_launcher.dart';

import '../controllers/contact_controller.dart';

class ContactView extends GetView<ContactController> {
  const ContactView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () => Get.back(),
              icon: const Icon(Icons.arrow_back, color: Colors.white)),
          title: Text(
            'Hubungi Kami',
            style: TextStyles.header3.bold().copyWith(color: Colors.white),
          ),
          centerTitle: false,
          backgroundColor: EcoSanColors.primary,
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 3.75.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                height: 212 / 800 * 100.h,
                padding: EdgeInsets.all(2.5.h),
                decoration: BoxDecoration(
                  color: EcoSanColors.primary,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SvgPicture.network(
                      'https://upload.wikimedia.org/wikipedia/commons/6/6b/WhatsApp.svg',
                      width: 50 / 360 * 100.w,
                    ),
                    Text(
                      'ECOSAN Call Center  (Chat Only)',
                      style: TextStyles.normal.semibold(color: Colors.white),
                    ),
                    EcoSanButton(
                        onTap: () {
                          const url =
                              "https://wa.me/628972155433?text=Halo%20saya%20ingin%20bertanya%20seputar%20produk%20ecosan";
                          launchUrl(Uri.parse(url),
                              mode: LaunchMode.externalApplication);
                        },
                        color: Colors.white,
                        borderRadius: 10,
                        child: Text(
                          'Mulai Chat',
                          style: TextStyles.normal
                              .bold(color: EcoSanColors.primary),
                        ))
                  ],
                ),
              ),
              SizedBox(
                height: 3.75.h,
              ),
              Text(
                'Info ECOSAN',
                style: TextStyles.normal.bold(color: EcoSanColors.primary),
              ),
              SizedBox(
                height: 2.5.h,
              ),
              ContactusListTile(
                iconData: Icons.email,
                value: 'ecosan@sanitasi.com',
                ontap: () async {
                  final Uri emailUri = Uri(
                    scheme: 'mailto',
                    path: 'ecosan@sanitasi.com',
                    queryParameters: {'subject': 'Pertanyaan tentang ECOSAN'},
                  );
                  if (await canLaunchUrl(emailUri)) {
                    await launchUrl(emailUri,
                        mode: LaunchMode.externalApplication);
                  } else {
                    throw 'Tidak dapat membuka aplikasi email';
                  }
                },
              ),
              ContactusListTile(
                iconData: Icons.phone,
                value: '08118293995',
                ontap: () async {
                  final Uri telUri = Uri(scheme: 'tel', path: '08118293995');
                  if (await canLaunchUrl(telUri)) {
                    await launchUrl(telUri, mode: LaunchMode.platformDefault);
                  } else {
                    throw 'Tidak dapat melakukan panggilan';
                  }
                },
              ),
              ContactusListTile(
                iconData: Icons.home,
                value: 'Jl. Graha Amerta No. 09 Jakarta Pusat',
              ),
              ContactusListTile(
                iconData: Icons.access_time,
                value: '08.00 AM - 05.00 PM',
              )
            ],
          ),
        ));
  }
}

class ContactusListTile extends StatelessWidget {
  const ContactusListTile({
    super.key,
    required this.iconData,
    required this.value,
    this.ontap,
  });

  final IconData iconData;
  final String value;
  final Function()? ontap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 1.5.h),
        margin: EdgeInsets.only(bottom: 1.25.h),
        decoration: BoxDecoration(
            border: Border(
                bottom: BorderSide(
                    color: EcoSanColors.systemGray[3]!, width: 0.5))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              iconData,
              color: EcoSanColors.primary,
            ),
            SizedBox(
              width: 1.25.h,
            ),
            Text(
              value,
              style: TextStyles.tiny.copyWith(color: Colors.black),
            )
          ],
        ),
      ),
    );
  }
}
