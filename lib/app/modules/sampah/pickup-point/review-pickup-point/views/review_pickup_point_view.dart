import 'package:ecosan/app/constants/loading_state.dart';
import 'package:ecosan/app/modules/themes/colors.dart';
import 'package:ecosan/app/modules/themes/fonts.dart';
import 'package:ecosan/app/modules/widgets/button.dart';
import 'package:ecosan/app/modules/widgets/eco_san_map.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/review_pickup_point_controller.dart';

class ReviewPickupPointView extends GetView<ReviewPickupPointController> {
  const ReviewPickupPointView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Review Pickup Poin'),
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
                "Review Pickup Poin",
                style: TextStyles.normal.bold(),
              ),
              const SizedBox(
                height: 16,
              ),
              Obx(
                () => Container(
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    width: double.infinity,
                    height: 200,
                    child: controller.loadingState.value ==
                                LoadingState.loading ||
                            controller.loadingState.value == LoadingState.error
                        ? const Center(
                            child: CircularProgressIndicator(),
                          )
                        : EcoSanMap(
                            latitude: controller.position.value.latitude,
                            longitude: controller.position.value.longitude,
                            markerSize: 40,
                            zoom: 15,
                          )),
              ),
              const SizedBox(
                height: 16,
              ),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0x14832AA0),
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
                      controller.pickupPointController.trashHistory.name,
                      style: TextStyles.small.bold(),
                      textAlign: TextAlign.start,
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Text(
                      controller.pickupPointController.trashHistory.phone,
                      style: TextStyles.tiny,
                      textAlign: TextAlign.start,
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Text(
                      controller.pickupPointController.trashHistory.address!,
                      style: TextStyles.tiny,
                      textAlign: TextAlign.start,
                    ),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0x14832AA0),
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
                      controller.pickupPointController.trashHistory.trashType,
                      style: TextStyles.small.bold(),
                      textAlign: TextAlign.start,
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Text(
                      "${controller.pickupPointController.trashHistory.weight} kg",
                      style: TextStyles.tiny,
                      textAlign: TextAlign.start,
                    ),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0x14832AA0),
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
                      "${controller.pickupPointController.trashHistory.time} WIB",
                      style: TextStyles.small.bold(),
                      textAlign: TextAlign.start,
                    ),
                    controller.pickupPointController.trashHistory.note != ""
                        ? const SizedBox(
                            height: 4,
                          )
                        : const SizedBox(),
                    controller.pickupPointController.trashHistory.note != ""
                        ? Text(
                            controller.pickupPointController.trashHistory.note,
                            style: TextStyles.tiny,
                            textAlign: TextAlign.start,
                          )
                        : const SizedBox(),
                  ],
                ),
              ),
              const SizedBox(
                height: 32,
              ),
              Row(
                children: [
                  Expanded(
                    child: EcoSanButton(
                      color: Colors.white,
                      borderColor: EcoSanColors.primary,
                      onTap: () {
                        Get.back();
                      },
                      child: Text("Edit",
                          style: TextStyles.normal
                              .bold(color: EcoSanColors.primary)),
                    ),
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Expanded(
                    child: EcoSanButton(
                      onTap: () {
                        controller.submit();
                      },
                      child: Text("Jemput",
                          style: TextStyles.normal.bold(color: Colors.white)),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
