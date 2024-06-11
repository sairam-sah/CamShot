import 'package:camera/camera.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController
   CameraController? cameraController;
    List<CameraDescription>? cameras;

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    _initCamera();
  }

  Future<void>_initCamera()async{
    try {
      cameras = await availableCameras();
      cameraController = CameraController(cameras![0], ResolutionPreset.high);
      await cameraController!.initialize();
    } catch(e){
      Get.snackbar('Error', 'Camera initialization failed');
    }
  }

  Future<void> takePicture() async {
    if (cameraController == null || !cameraController!.value.isInitialized) {
      return null;
    }

    if (cameraController!.value.isTakingPicture) {
      // A capture is already pending, do nothing.
      return null;
    }
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    cameraController?.dispose();
    super.onClose();
  }

  void increment() => count.value++;
}
