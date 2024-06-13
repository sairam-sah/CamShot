import 'package:get/get.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    // _initCamera();
  }

  // RxString imagepath = ''.obs;

  // Future<void> _initCamera() async {
  //   try {
  //     cameras = await availableCameras();
  //     cameraController = CameraController(cameras![0], ResolutionPreset.high);
  //     await cameraController!.initialize();
  //   } catch (e) {
  //     Get.snackbar('Error', 'Camera initialization failed');
  //   }
  // }

  // Future getImage() async {
  //   final ImagePicker _picker = ImagePicker();
  //   final image = await _picker.pickImage(source: ImageSource.camera);
  //   if (image!= null){
  //     imagepath.value = image.path.toString();
  //   }

  //   if (cameraController == null || !cameraController!.value.isInitialized) {
  //     return null;
  //   }

  //   if (cameraController!.value.isTakingPicture) {
  //     // A capture is already pending, do nothing.
  //     return null;
  //   }
  //   try{
  //     return await cameraController!.takePicture();
  //   }catch(e){
  //       Get.snackbar('Error', 'Failed to take picture: $e');
  //     return null;
  //   }
  // }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    // cameraController?.dispose();
    super.onClose();
  }

  void increment() => count.value++;
}
