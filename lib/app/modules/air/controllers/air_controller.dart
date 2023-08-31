import 'dart:math';

import 'package:camera/camera.dart';
import 'package:ecosan/app/modules/air/widgets/air_history.dart';
import 'package:ecosan/app/repository/transaction_repository.dart';
import 'package:get/get.dart';

class AirController extends GetxController {
  static AirController i = Get.find();
  List<CameraDescription>? cameras; //list out the camera available
  CameraController? controller; //controller for camera
  final random = Random();
  final image = Rxn<XFile?>();
  late final RxInt airIndex = 0.obs;
  SanitasiAirData? airData;
  final isFlashOn = false.obs;
  final isProcessing = false.obs;
  late List<SanitasiAirData> dataKualitasAir;
  late List<int> listBulan;
  final indexBulan = 0.obs;
  final transactionRepository = TransactionRepository();
  @override
  void onInit() async {
    super.onInit();
    listBulan = [];
    bool isTransactionExist = await transactionRepository.isExist();
    if (isTransactionExist) {
      Random random = Random();
      airData = SanitasiAirData(
          DateTime.now().day,
          DateTime.now().month,
          5.0 + random.nextDouble() * 2.5,
          200.0 + random.nextDouble() * 100.0,
          30.0 + random.nextDouble() * 20.0,
          1 + random.nextInt(100),
          DateTime.now().year);
      dataKualitasAir = [];

      DateTime today = DateTime.now();
      DateTime twoMonthsAgo =
          today.subtract(const Duration(days: 60)); // 2 months ago

      for (DateTime date = today.subtract(const Duration(days: 1));
          date.isAfter(twoMonthsAgo);
          date = date.subtract(const Duration(days: 1))) {
        dataKualitasAir.add(
          SanitasiAirData(
            date.day,
            date.month,
            5.0 + random.nextDouble() * 2.5,
            200.0 + random.nextDouble() * 100.0,
            30.0 + random.nextDouble() * 20.0,
            1 + random.nextInt(100),
            date.year,
          ),
        );
      }
      dataKualitasAir = dataKualitasAir.reversed.toList();
      listBulan = dataKualitasAir.map((e) => e.month).toSet().toList();
    }
    cameras = await availableCameras();
    if (cameras != null) {
      try {
        controller = CameraController(cameras![0], ResolutionPreset.high);
        await controller!.initialize();
        await controller!.pausePreview();
      } catch (e) {
        Get.snackbar("Error", e.toString());
      }
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
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    controller!.dispose();
  }

  //generate random value for air quality 1-10

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
}
