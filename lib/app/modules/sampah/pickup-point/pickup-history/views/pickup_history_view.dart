import 'package:ecosan/app/constants/loading_state.dart';
import 'package:ecosan/app/models/trashHistory/trash_history_model.dart';
import 'package:ecosan/app/modules/themes/fonts.dart';
import 'package:ecosan/app/modules/widgets/button.dart';
import 'package:ecosan/app/modules/widgets/eco_san_map.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/pickup_history_controller.dart';

class PickupHistoryView extends GetView<PickupHistoryController> {
  const PickupHistoryView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Riwayat Pickup Poin'),
          leading: InkResponse(
            onTap: () {
              Get.back();
            },
            child: const Icon(
              Icons.arrow_back,
            ),
          ),
        ),
        body: Obx(() => controller.loadingState.value == LoadingState.success
            ? SingleChildScrollView(
                child: Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Riwayat Pickup Poin",
                        style: TextStyles.normal.bold(),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Container(
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        width: double.infinity,
                        height: 200,
                        child: EcoSanMap(
                          latitude: controller.trashHistory.value!.latitude!,
                          longitude: controller.trashHistory.value!.longitude!,
                          markerSize: 40,
                        ),
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
                              controller.trashHistory.value!.name,
                              style: TextStyles.small.bold(),
                              textAlign: TextAlign.start,
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                            Text(
                              controller.trashHistory.value!.phone,
                              style: TextStyles.tiny,
                              textAlign: TextAlign.start,
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                            Text(
                              controller.trashHistory.value!.address!,
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
                              controller.trashHistory.value!.trashType,
                              style: TextStyles.small.bold(),
                              textAlign: TextAlign.start,
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                            Text(
                              "${controller.trashHistory.value!.weight} kg",
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
                              "${controller.trashHistory.value!.time} WIB",
                              style: TextStyles.small.bold(),
                              textAlign: TextAlign.start,
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                            Text(
                              controller.trashHistory.value!.note,
                              style: TextStyles.tiny,
                              textAlign: TextAlign.start,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 32,
                      ),
                      EcoSanButton(
                        isEnabled: controller.trashHistory.value!.status !=
                            TrashHistoryStatus.completed,
                        onTap: () {
                          controller.changeTrashHistoryStatus();
                        },
                        child: Text("Serahkan ke Kurir",
                            style: TextStyles.normal.bold(color: Colors.white)),
                      )
                    ],
                  ),
                ),
              )
            : controller.loadingState.value == LoadingState.loading
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : const Center(
                    child: Text("Terjadi kesalahan"),
                  )));
  }
}
