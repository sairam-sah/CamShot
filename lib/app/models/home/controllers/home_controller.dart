import 'package:get/get.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController

  final count = 0.obs;
  var selectedIndex = 0.obs;

void changeIndex(int index){
  selectedIndex.value = index;
}

  @override
  void onInit() {
    super.onInit();
    // _initCamera();
  }
  
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
