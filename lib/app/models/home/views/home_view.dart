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
            PopupMenuButton(
                icon: const Icon(
                  Icons.more_vert,
                  color: Colors.white,
                ),
                onSelected: (value) {
                  if (value == 'share') {
                    imagePickerController.shareSelectedImages();
                  } else if (value == 'flush') {
                    imagePickerController.flushHiveMemory();
                  }
                },
                itemBuilder: (BuildContext context) => [
                      const PopupMenuItem(
                          value: 'share',
                          child: ListTile(
                            leading: Icon(Icons.share),
                            title: Text('Share'),
                          )),
                      const PopupMenuItem(
                          value: 'flush',
                          child: ListTile(
                            leading: Icon(Icons.delete_sweep),
                            title: Text('Hive flush'),
                          )),
                    ])
          ],
        ),
        body: SafeArea(
          child: Container(
            padding: const EdgeInsets.all(16.0),
            child: Obx(() {
              if (imagePickerController.enlargedImagePath.value.isNotEmpty) {
                return Center(
                    child: SingleChildScrollView(
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                        GestureDetector(
                          onTap: () {
                            imagePickerController.enlargedImagePath.value = '';
                          },
                          child: Image.file(
                            File(imagePickerController.enlargedImagePath.value),
                            fit: BoxFit.contain,
                          ),
                        ),
                        const SizedBox(height:10),
                        ElevatedButton(onPressed: ()async{
                          await imagePickerController.cropImage();
                        }, child: const Text('Crop Image')),
                      ]),
                    ));
              } else {
                return Column(
                  children: [
                    Expanded(
                      child: Obx(() {
                        return GridView.builder(
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    mainAxisSpacing: 10,
                                    crossAxisSpacing: 10),
                            itemCount: imagePickerController.imagePaths.length,
                            itemBuilder: ((context, index) {
                              final imagePath =
                                  imagePickerController.imagePaths[index];
                              final imageDate =
                                  imagePickerController.imageDates[imagePath] ??
                                      '';
                              return GestureDetector(
                                onTap: () {
                                  imagePickerController.enlargeImage(
                                      imagePickerController.imagePaths[index]);
                                },
                                // onLongPress: () {
                                //   imagePickerController.toggleSelection(index);
                                // },
                                child: GridTile(
                                  // ignore: sort_child_properties_last
                                  child: File(imagePickerController
                                              .imagePaths[index])
                                          .existsSync()
                                      ? Image.file(
                                          File(imagePickerController
                                              .imagePaths[index]),
                                          fit: BoxFit.cover)
                                      : Container(
                                          color: Get.theme.colorScheme.primary,
                                          child: Icon(Icons.broken_image,
                                              color: Get
                                                  .theme.colorScheme.primary),
                                        ),
                                  footer: GestureDetector(
                                    onTap: () {
                                       imagePickerController.toggleSelection(index);
                                    },
                                    child: GridTileBar(
                                      leading: Obx(() {
                                        return Icon(
                                          imagePickerController.selectedIndexes
                                                  .contains(index)
                                              ? Icons.check_box
                                              : Icons.check_box_outline_blank,
                                          color: Get.theme.colorScheme.primary,
                                        );
                                      }),
                                      title: Text(
                                        imageDate,
                                        style: const TextStyle(
                                            color: Colors.white, fontSize: 15),
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            }));
                      }),
                    ),
                  ],
                );
              }
            }),
          ),
        ),
        bottomNavigationBar: Obx(() {
          return BottomNavigationBar(
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.image),
                label: 'Gallery',
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.camera_alt), label: 'Camera'),
              BottomNavigationBarItem(icon: Icon(Icons.save), label: 'Save'),
            ],
            currentIndex: controller.selectedIndex.value,
            selectedItemColor: Get.theme.colorScheme.primary,
            unselectedItemColor: Colors.grey,
            onTap: (index) async {
              controller.selectedIndex.value = index;
              if (index == 0) {
                await imagePickerController.pickImageFromGallery();
              } else if (index == 1) {
                await imagePickerController.pickImageFromCamera();
              } else if (index == 2) {
                await imagePickerController.saveSelectedImagesToHive();
              }
            },
          );
        }));
  }
}
