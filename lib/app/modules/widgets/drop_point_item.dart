import 'package:ecosan/app/models/dropPoint/drop_point_model.dart';
import 'package:ecosan/app/modules/themes/colors.dart';
import 'package:ecosan/app/modules/themes/fonts.dart';
import 'package:ecosan/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DropPointItem extends StatelessWidget {
  final DropPoint dropPoint;
  final String distance;

  const DropPointItem({
    super.key,
    required this.dropPoint,
    required this.distance,
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
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
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
            "Jarak pengiriman: $distance",
            style: TextStyles.tiny,
          ),
          Container(
            width: double.infinity,
            margin: const EdgeInsets.only(top: 12),
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
