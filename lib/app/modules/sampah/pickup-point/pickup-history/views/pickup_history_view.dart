import 'package:ecosan/app/constants/loading_state.dart';
import 'package:ecosan/app/models/trashHistory/trash_history_model.dart';
import 'package:ecosan/app/modules/themes/fonts.dart';
import 'package:ecosan/app/modules/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';

import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';

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
            child: Icon(
              Icons.arrow_back,
            ),
          ),
        ),
        body: Obx(() => controller.loadingState.value == LoadingState.success
            ? SingleChildScrollView(
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 16, vertical: 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Riwayat Pickup Poin",
                        style: TextStyles.normal.bold(),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Container(
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        width: double.infinity,
                        height: 200,
                        child: FlutterMap(
                          options: MapOptions(
                            center: LatLng(
                              controller.trashHistory.value!.latitude!,
                              controller.trashHistory.value!.longitude!,
                            ),
                            zoom: 15.0,
                            enableMultiFingerGestureRace: false,
                            enableScrollWheel: false,
                          ),
                          children: [
                            TileLayer(
                              urlTemplate:
                                  'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                              userAgentPackageName: 'com.example.app',
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                          boxShadow: [
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
                        padding: EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                          boxShadow: [
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
                        padding: EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                          boxShadow: [
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
                      SizedBox(
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
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : Center(
                    child: Text("Terjadi kesalahan"),
                  )));
  }
}
