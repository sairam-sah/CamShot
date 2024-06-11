import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/values/s_dimension.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'CamShot',
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
          backgroundColor: Get.theme.colorScheme.primary,
        ),
        body: SafeArea(
            child: Container(
                height: Get.height,
                width: Get.width,
                padding: const EdgeInsets.symmetric(
                    horizontal: SDimension.sm, vertical: SDimension.jumbo),
                // decoration: BoxDecoration(color: Get.theme.colorScheme.secondary),
                child: SingleChildScrollView(
                    child: Column(children: [
                  FloatingActionButton(
                    onPressed: () async {
                      if (controller.cameraController != null &&
                          controller.cameraController!.value.isInitialized) {
                        Get.to(() => CameraPreviewScreen());
                      } else {
                        Get.snackbar('Error', 'Camera initialization failed');
                      }
                    },
                    child: const Icon(Icons.camera_alt_rounded),
                  )
                ])))));
  }
}

class CameraPreviewScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.find();
    if (controller.cameraController == null ||
        !controller.cameraController!.value.isInitialized) {
      return const Center(child: CircularProgressIndicator());
    }
    return Scaffold(
        appBar: AppBar(
          title: const Text('Camera Preview'),
        ),
        body: Stack(
          children: [
            CameraPreview(controller.cameraController!),
            Positioned(
              bottom: 200,
              left: 0,
              right: 0,
              child:Center(
                child: FloatingActionButton(
                  onPressed: () async{
                    // try(
                      // ignore: unused_local_variable
                      final image = await controller.takePicture();
                      // if(image!=null){
                      //   Get.snackbar('Success', 'Picture taken: ${image.path}');
                      // }
                    // )
                  }),
              ) )
          ],
        ));
  }
}
