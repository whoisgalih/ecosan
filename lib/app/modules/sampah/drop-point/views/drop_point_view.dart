import 'package:ecosan/app/models/dropPoint/drop_point_model.dart';
import 'package:ecosan/app/modules/themes/fonts.dart';
import 'package:ecosan/app/modules/widgets/drop_point_item.dart';
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
          child: const Icon(
            Icons.arrow_back,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
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
                    (index) {
                      final DropPoint dropPoint =
                          controller.dropPoints.value[index];
                      return DropPointItem(
                        dropPoint: dropPoint,
                        distance: dropPoint.getDistance(
                          controller.position.value.latitude,
                          controller.position.value.longitude,
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
