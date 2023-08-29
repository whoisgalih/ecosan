import 'package:ecosan/app/models/dropPoint/drop_point_model.dart';
import 'package:ecosan/app/modules/themes/colors.dart';
import 'package:ecosan/app/modules/themes/fonts.dart';
import 'package:ecosan/app/modules/widgets/button.dart';
import 'package:ecosan/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/drop_point_controller.dart';

class DropPointView extends GetView<DropPointController> {
  const DropPointView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Drop Point'),
        leading: InkResponse(
          onTap: () {
            Get.back();
          },
          child: Icon(
            Icons.arrow_back,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 16, vertical: 24),
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
              Obx(
                () => Column(
                  children: List.generate(
                    controller.dropPoints.value.length,
                    (index) => DropPointItem(
                      dropPoint: controller.dropPoints.value[index],
                    ),
                  ),
                ),
              ),
              EcoSanButton(
                  onTap: () {
                    controller.getDropPoint();
                  },
                  child: Text("Cek Lokasi"))
            ],
          ),
        ),
      ),
    );
  }
}

class DropPointItem extends StatelessWidget {
  final DropPoint dropPoint;

  const DropPointItem({
    super.key,
    required this.dropPoint,
  });

  String generateAcceptedTrashType(bool isOrganic, bool isAnorganic) {
    if (isOrganic && isAnorganic) {
      return "Menerima sampah organik dan anorganik";
    } else if (isOrganic) {
      return "Menerima sampah organik";
    } else if (isAnorganic) {
      return "Menerima sampah anorganik";
    } else {
      return "Tidak menerima sampah";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(bottom: 16),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(
            color: Color(0x14000000),
            blurRadius: 15,
            offset: Offset(0, 1),
            spreadRadius: 0,
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            dropPoint.name,
            style: TextStyles.normal.bold(),
          ),
          const SizedBox(
            height: 4,
          ),
          Text(
            dropPoint.address,
            style: TextStyles.tiny,
          ),
          const SizedBox(
            height: 4,
          ),
          Text(
            "Jam operasional ${dropPoint.open} - ${dropPoint.close} WIB",
            style: TextStyles.tiny,
          ),
          const SizedBox(
            height: 4,
          ),
          Text(
            generateAcceptedTrashType(
              dropPoint.isOrganic,
              dropPoint.isAnorganic,
            ),
            style: TextStyles.tiny,
          ),
          const SizedBox(
            height: 4,
          ),
          Text(
            "Jarak pengiriman: 1,0 km",
            style: TextStyles.tiny,
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.only(top: 12),
            alignment: Alignment.centerRight,
            child: Container(
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
              ),
              child: Material(
                color: EcoSanColors.primary,
                child: InkWell(
                  onTap: () {
                    Get.toNamed(
                      Routes.PREVIEW_DROP_POINT,
                      arguments: dropPoint,
                    );
                  },
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                    child: Text(
                      "Cek Lokasi",
                      style: TextStyles.tiny.bold(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
