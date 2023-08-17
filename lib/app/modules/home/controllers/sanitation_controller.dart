import 'package:camera/camera.dart';
import 'package:get/get.dart';

class SanitationController extends GetxController {
  static SanitationController i = Get.find();
  List<CameraDescription>? cameras; //list out the camera available
  CameraController? controller; //controller for camera
  final image = Rxn<XFile?>();
  final airIndex = 0.obs;
  final Rx<int?> airQuality = 90.obs;

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

  Future<void> takePicture() async {
    if (image.value == null) {
      final xfile = await controller!.takePicture();
      image.value = xfile;
      print(image.value!.path);
    } else {
      image.value = null;
    }
  }
}
