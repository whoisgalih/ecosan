import 'package:ecosan/app/models/dropPoint/drop_point_model.dart';
import 'package:ecosan/app/modules/themes/fonts.dart';
import 'package:ecosan/app/modules/widgets/button.dart';
import 'package:ecosan/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';

import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';

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
          child: Icon(
            Icons.arrow_back,
          ),
        ),
      ),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          FlutterMap(
            options: MapOptions(
              center: LatLng(dropPoint.latitude, dropPoint.longitude),
              zoom: 15.0,
              enableMultiFingerGestureRace: false,
              enableScrollWheel: false,
            ),
            children: [
              TileLayer(
                urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                userAgentPackageName: 'com.example.app',
              ),
            ],
          ),
          Wrap(
            children: [
              Container(
                margin: EdgeInsets.all(16),
                padding: EdgeInsets.all(16),
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
                    Get.toNamed(Routes.INPUT_TRASH);
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
