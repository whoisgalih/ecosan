import 'package:ecosan/app/modules/air/controllers/air_controller.dart';
import 'package:ecosan/app/modules/home/controllers/sanitation_controller.dart';
import 'package:ecosan/app/modules/air/widgets/air_quality.dart';
import 'package:ecosan/app/modules/air/widgets/sensor_air.dart';
import 'package:ecosan/app/modules/themes/colors.dart';
import 'package:ecosan/app/modules/themes/fonts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class AirHistory extends StatelessWidget {
  const AirHistory({
    super.key,
    required this.sanitationController,
  });

  final AirController sanitationController;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              IconButton(
                  onPressed: () => sanitationController.indexBulan > 0
                      ? sanitationController.indexBulan.value--
                      : null,
                  icon: Icon(Icons.arrow_left)),
              Text(sanitationController.getNamaBulan(sanitationController
                  .listBulan
                  .elementAt(sanitationController.indexBulan.value))),
              IconButton(
                  onPressed: () => sanitationController.indexBulan <
                          sanitationController.listBulan.length - 1
                      ? sanitationController.indexBulan.value++
                      : null,
                  icon: Icon(Icons.arrow_right)),
            ],
          ),
        ),
        SfCartesianChart(
            primaryXAxis: CategoryAxis(),
            // Chart title
            title: ChartTitle(text: 'Grafik Kualitas Air'),
            // Enable legend
            legend: Legend(isVisible: false),
            series: <LineSeries<SanitasiAirData, String>>[
              LineSeries<SanitasiAirData, String>(
                  name: 'Kualitas Air',
                  dataSource: sanitationController.dataKualitasAir
                      .where((element) =>
                          element.month ==
                          sanitationController.listBulan
                              .elementAt(sanitationController.indexBulan.value))
                      .toList(),
                  xValueMapper: (SanitasiAirData sales, _) =>
                      sales.date.toString(),
                  xAxisName: 'tanggal',
                  yValueMapper: (SanitasiAirData sales, _) => sales.value,
                  markerSettings: MarkerSettings(isVisible: true),
                  onPointTap: (pointInteractionDetails) {
                    final airData = sanitationController.dataKualitasAir
                        .where((element) =>
                            element.month ==
                            sanitationController.listBulan.elementAt(
                                sanitationController.indexBulan.value))
                        .toList()
                        .elementAt(pointInteractionDetails.pointIndex!);
                    Get.bottomSheet(Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 2.h, horizontal: 2.h),
                      width: double.infinity,
                      height: 600 / 800 * 100.h,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30)),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: 30 / 360 * 100.h,
                            height: 3,
                            color: EcoSanColors.systemGray,
                          ),
                          SizedBox(
                            height: 2.8.h,
                          ),
                          Text(
                            'Status Air pada ${airData.date} ${sanitationController.getNamaBulan(airData.month)} ${airData.year}',
                            style: TextStyles.normal
                                .semibold()
                                .copyWith(color: Colors.black),
                          ),
                          SizedBox(
                            height: 2.5.h,
                          ),
                          AirQuality(
                            airQuality: airData.value,
                          ),
                          SizedBox(
                            height: 2.5.h,
                          ),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: 211 / 360 * 100.w,
                                  child: Text(
                                    'Rincian Kualitas Air',
                                    style: TextStyles.small.semibold(),
                                    textAlign: TextAlign.start,
                                  ),
                                )
                              ]),
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Flexible(
                                  flex: 1,
                                  child: WaterQualityContainer(
                                    indicator: 'pH',
                                    value: airData.pH.toStringAsFixed(1),
                                    unit: '',
                                  ),
                                ),
                                SizedBox(
                                  width: 2.h,
                                ),
                                Flexible(
                                  flex: 1,
                                  child: WaterQualityContainer(
                                    indicator: 'ORP',
                                    value: airData.orp.toStringAsFixed(0),
                                    unit: 'mV',
                                  ),
                                ),
                                SizedBox(
                                  width: 2.h,
                                ),
                                Flexible(
                                  flex: 1,
                                  child: WaterQualityContainer(
                                    indicator: 'TDS',
                                    value: airData.tds.toStringAsFixed(0),
                                    unit: 'ppm',
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ));
                  })
            ])
      ]),
    );
  }
}

class SanitasiAirData {
  SanitasiAirData(this.date, this.month, this.orp, this.pH, this.tds,
      this.value, this.year);
  final int date;
  final int month;
  final int year;
  final int value;
  final double pH;
  final double orp;
  final double tds;
}
