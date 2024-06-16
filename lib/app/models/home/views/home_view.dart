import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/home_controller.dart';
import '../controllers/image_picker_controller.dart';

class HomeView extends GetView<HomeController> {
  HomeView({Key? key}) : super(key: key);

  final ImagePickerController imagePickerController =
      Get.put(ImagePickerController());
  // final HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'CamShot',
          style: TextStyle(color: Colors.white),
        ),
        // centerTitle: true,
        backgroundColor: Get.theme.colorScheme.primary,
        actions: [
          IconButton(
              onPressed: () {
                imagePickerController.deleteSelectdItems();
              },
              icon: const Icon(
                Icons.delete,
                color: Colors.white,
              )),
           IconButton(
            onPressed:(){
            
            }, icon: const Icon(Icons.more_vert,color: Colors.white,))   
        ],
      ),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Expanded(
                child: Obx(() {
                  return GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisSpacing: 10,
                              crossAxisSpacing: 10
                              ),
                      itemCount: imagePickerController.imagePaths.length,
                      itemBuilder: ((context, index) {
                        return GestureDetector(
                          onTap: () {
                            imagePickerController.toggleSelection(index);
                          },
                          child: GridTile(
                            // ignore: sort_child_properties_last
                            child:File(imagePickerController.imagePaths[index]).existsSync()?
                            Image.file(
                                File(imagePickerController.imagePaths[index]),
                                fit: BoxFit.cover)
                                :Container(
                                  color: Colors.grey,
                                   child: const Icon(Icons.broken_image, color: Colors.white),
                                ),
                            footer: GridTileBar(
                              // backgroundColor: Get.theme.colorScheme.onPrimaryContainer,
                              leading: Obx(() {
                                return Icon(
                                  imagePickerController.selectedIndexes
                                          .contains(index)
                                      ? Icons.check_box
                                      : Icons.check_box_outline_blank,
                                  color: Colors.white,
                                );
                              }),
                            ),
                          ),
                        );
                      }));
                }),
              ),
              // const SizedBox(height: 20),
              // ElevatedButton(
              //   onPressed: imagePickerController.pickImageFromGallery,
              //   child: const Text('Pick Image from Gallery'),
              // ),
              // const SizedBox(height: 10),
              // ElevatedButton(
              //   onPressed: imagePickerController.pickImageFromCamera,
              //   child: const Text('Take Photo'),
              // ),
              // const SizedBox(height: 10),
              // ElevatedButton(
              //   onPressed: () async {
              //     final pdfFile =
              //         await imagePickerController.createPdfFromImages();
              //     if (pdfFile != null) {
              //       Get.snackbar('Success', 'PDF created at ${pdfFile.path}');
              //     }
              //   },
              //   child: const Text('Create PDF from Selected'),
              // ),
              // const SizedBox(height: 10),
              // ElevatedButton(
              //   onPressed: () async {
              //     await imagePickerController.saveSelectedImagesToHive();
              //   },
              //   child: const Text('Save Selected to Hive'),
              // ),
            ],
          ),
        ),
      ),
      bottomNavigationBar:Obx((){
       return BottomNavigationBar(
        items:const[
          BottomNavigationBarItem(
            icon: Icon(Icons.browse_gallery),
            label: 'Gallery',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.camera_alt),
            label: 'Camera'),
          BottomNavigationBarItem(icon: Icon(Icons.hive),
           label: 'Hive'),
        ],
        
        currentIndex: controller.selectedIndex.value,
        // selectedItemColor: Get.theme.colorScheme.primary,
        onTap: (index) async {
          if (index == 0) {
            await imagePickerController.pickImageFromGallery();
          } else if (index == 1) {
            await imagePickerController.pickImageFromCamera();
            
          } else if (index == 2) {
            await imagePickerController.saveSelectedImagesToHive();
          }
        },
      );
      })
      
      
    );
  }
}
