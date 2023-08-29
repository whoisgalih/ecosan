import 'package:ecosan/app/modules/themes/fonts.dart';
import 'package:ecosan/app/modules/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';

import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';

import '../controllers/preview_drop_point_controller.dart';

class PreviewDropPointView extends GetView<PreviewDropPointController> {
  const PreviewDropPointView({Key? key}) : super(key: key);
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
              center: LatLng(
                // give lat long of jakarta here
                -6.1753924,
                106.8271528,
              ),
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
                      "Pengepul Indah Permai",
                      style: TextStyles.normal.semibold(),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      "Jl. S. Supriadi No.38 A, Sebelah Mesjid Al-Huda Jakarta Timur",
                      style: TextStyles.tiny,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      "083567383485",
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
                  onTap: () {},
                  child: Text(
                    "Pilih Lokasi",
                    style: TextStyle(color: Colors.white),
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
