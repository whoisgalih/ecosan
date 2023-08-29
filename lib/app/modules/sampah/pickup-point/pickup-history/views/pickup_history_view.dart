import 'package:ecosan/app/modules/themes/fonts.dart';
import 'package:ecosan/app/modules/widgets/button.dart';
import 'package:ecosan/app/routes/app_pages.dart';
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
      body: SingleChildScrollView(
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
                    center: LatLng(-6.1753924, 106.8249641),
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
                      "Aditya Saputra",
                      style: TextStyles.small.bold(),
                      textAlign: TextAlign.start,
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Text(
                      "08877663633",
                      style: TextStyles.tiny,
                      textAlign: TextAlign.start,
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Text(
                      "Perumahan Indah Permai No. 10, Jakarta",
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
                      "Non-organik",
                      style: TextStyles.small.bold(),
                      textAlign: TextAlign.start,
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Text(
                      "8 kg",
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
                      "10.00 WIB",
                      style: TextStyles.small.bold(),
                      textAlign: TextAlign.start,
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Text(
                      "Gunakan kendaraan dengan kapasitas yang luas untuk mengambil sampah",
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
                onTap: () {
                  Get.offNamedUntil(Routes.CLAIM, (route) {
                    return route.settings.name == Routes.SAMPAH;
                  });
                },
                child: Text("Serahkan ke Kurir",
                    style: TextStyles.normal.bold(color: Colors.white)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
