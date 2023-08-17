import 'package:camera/camera.dart';
import 'package:get/get.dart';

class SanitationController extends GetxController {
  static SanitationController i = Get.find();
  List<CameraDescription>? cameras; //list out the camera available
  CameraController? controller; //controller for camera
  final image = Rxn<XFile?>();
  final airIndex = 0.obs;
  final Rx<int?> airQuality = 90.obs;
  final isFlashOn = false.obs;
  final isProcessing = false.obs;
  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
    cameras = await availableCameras();
    if (cameras != null) {
      controller = CameraController(cameras![0], ResolutionPreset.high);
      controller!.initialize().then((value) => null);
    } else {
      Get.snackbar("Error", "Camera not found");
    }
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
}
