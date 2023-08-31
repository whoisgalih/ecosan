import 'package:ecosan/app/models/dropPoint/drop_point_model.dart';
import 'package:ecosan/app/modules/themes/fonts.dart';
import 'package:ecosan/app/modules/widgets/button.dart';
import 'package:ecosan/app/modules/widgets/eco_san_map.dart';
import 'package:ecosan/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/preview_drop_point_controller.dart';

class PreviewDropPointView extends GetView<PreviewDropPointController> {
  final DropPoint dropPoint;

  const PreviewDropPointView({
    Key? key,
    required this.dropPoint,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pengepul Indah Permai'),
        centerTitle: false,
        leading: InkResponse(
          onTap: () {
            Get.back();
          },
          child: const Icon(
            Icons.arrow_back,
          ),
        ),
      ),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          EcoSanMap(
            latitude: dropPoint.latitude,
            longitude: dropPoint.longitude,
            markerSize: 40,
          ),
          Wrap(
            children: [
              Container(
                margin: const EdgeInsets.all(16),
                padding: const EdgeInsets.all(16),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      dropPoint.name,
                      style: TextStyles.normal.semibold(),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      dropPoint.address,
                      style: TextStyles.tiny,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      dropPoint.phone,
                      style: TextStyles.tiny,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: 16,
                  right: 16,
                  bottom: MediaQuery.of(context).padding.bottom + 16,
                ),
                child: EcoSanButton(
                  onTap: () {
                    Get.toNamed(Routes.INPUT_TRASH, arguments: dropPoint.name);
                  },
                  child: Text(
                    "Antar Sekarang",
                    style: TextStyles.normal.semibold(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
