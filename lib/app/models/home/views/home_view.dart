import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/home_controller.dart';
import '../controllers/image_picker_controller.dart';

class HomeView extends GetView<HomeController> {
  HomeView({Key? key}) : super(key: key);

  final ImagePickerController imagePickerController =
      Get.put(ImagePickerController());

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
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Obx(() {
                return imagePickerController.imagePath.isNotEmpty
                    ? Image.file(File(imagePickerController.imagePath.value))
                    : const Text('No image selected.');
              }),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: imagePickerController.pickImageFromGallery,
                child: const Text('Pick Image from Gallery'),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: imagePickerController.pickImageFromCamera,
                child: const Text('Take Photo'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}