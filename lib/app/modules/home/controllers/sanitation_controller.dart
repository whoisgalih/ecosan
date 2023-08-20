import 'dart:math';

import 'package:camera/camera.dart';
import 'package:ecosan/app/modules/home/widgets/air_history.dart';
import 'package:get/get.dart';

import '../segments/air.dart';

class SanitationController extends GetxController {
  static SanitationController i = Get.find();
  List<CameraDescription>? cameras; //list out the camera available
  CameraController? controller; //controller for camera
  final random = Random();
  final image = Rxn<XFile?>();
  late final RxInt airIndex = 0.obs;
  final Rx<int?> airQuality = 90.obs;
  final isFlashOn = false.obs;
  final isProcessing = false.obs;
  late List<SanitasiAirData> dataKualitasAir;
  late List<int> listBulan;
  final indexBulan = 0.obs;
  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
    cameras = await availableCameras();
    if (cameras != null) {
      controller = CameraController(cameras![0], ResolutionPreset.high);
      await controller!.initialize().then((value) => null);
      await controller!.pausePreview();
    } else {
      Get.snackbar("Error", "Camera not found");
    }
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    airIndex(0);
    ever(airIndex, (index) async {
      if (index == 1) {
        await controller!.resumePreview();
      } else {
        await controller!.pausePreview();
      }
    });
    dataKualitasAir = <SanitasiAirData>[
      for (int day = 1; day <= 31; day++)
        SanitasiAirData(
          day,
          1,
          5.0 + random.nextDouble() * 2.5, // pH antara 5.0 dan 7.5
          200.0 + random.nextDouble() * 100.0, // orp antara 200.0 dan 300.0
          30.0 + random.nextDouble() * 20.0, // tds antara 30.0 dan 50.0
          1 + random.nextInt(100), // value antara 1 dan 100
          2023,
        ),

      // Bulan 2
      for (int day = 1; day <= 20; day++)
        SanitasiAirData(
          day,
          2,
          5.0 + random.nextDouble() * 2.5, // pH antara 5.0 dan 7.5
          200.0 + random.nextDouble() * 100.0, // orp antara 200.0 dan 300.0
          30.0 + random.nextDouble() * 20.0, // tds antara 30.0 dan 50.0
          1 + random.nextInt(100), // value antara 1 dan 100
          2023,
        ),
    ];
    listBulan = dataKualitasAir.map((e) => e.month).toSet().toList();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    controller!.dispose();
  }

  Future<void> flashToggle() async {
    if (isFlashOn.value) {
      await controller!.setFlashMode(FlashMode.off);
      isFlashOn.value = false;
    } else {
      await controller!.setFlashMode(FlashMode.torch);
      isFlashOn.value = true;
    }
  }

  Future<void> takePicture() async {
    if (image.value == null) {
      controller!.setFlashMode(FlashMode.off);
      final xfile = await controller!.takePicture();
      image.value = xfile;
      print(image.value!.path);
      controller!.pausePreview();
    } else {
      print('resume');
      image.value = null;
      controller!.resumePreview();
    }
  }

  String getNamaBulan(int bulan) {
    switch (bulan) {
      case 1:
        return 'Januari';
      case 2:
        return 'Februari';
      case 3:
        return 'Maret';
      case 4:
        return 'April';
      case 5:
        return 'Mei';
      case 6:
        return 'Juni';
      case 7:
        return 'Juli';
      case 8:
        return 'Agustus';
      case 9:
        return 'September';
      case 10:
        return 'Oktober';
      case 11:
        return 'November';
      case 12:
        return 'Desember';
      default:
        return '';
    }
  }
}
