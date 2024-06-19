import 'dart:io';


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:hive/hive.dart';
import 'package:share_plus/share_plus.dart';


import '../../../core/values/s_datetime_util.dart';

class ImagePickerController extends GetxController {
  final imagePaths = <String>[].obs;
  final selectedIndexes = <int>[].obs;
  final pdfPath = ''.obs; //path of generated pdf
  final loading = false.obs; // Loading state observable
  var enlargedImagePath = ''.obs;
 final imageDates =<String,String>{}.obs;//Map to store image path and their dates

  final ImagePicker _picker = ImagePicker();

  Future<void> pickImageFromGallery() async {
    loading.value = true;
    try {
      final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
      if (image != null) {
        imagePaths.add(image.path);
        imageDates[image.path] = SDateTimeUtil.dateTimeToString(
          DateTime.now(),
          SDateTimeUtil.formatPattern6,
        );
        await saveImagePath(image.path);
        await createPdfFromImages();
      }
    } finally {
      loading.value = false;
    }
  }

  Future<void> pickImageFromCamera() async {
    loading.value = true;

    try {
      final XFile? image = await _picker.pickImage(source: ImageSource.camera);
      if (image != null) {
        imagePaths.add(image.path);
           imageDates[image.path] = SDateTimeUtil.dateTimeToString(
          DateTime.now(),
          SDateTimeUtil.formatPattern6,
        );
        await saveImagePath(image.path);
        await createPdfFromImages();
      }
    } finally {
      loading.value = false;
    }
  }

  void toggleSelection(int index) {
    if (selectedIndexes.contains(index)) {
      selectedIndexes.remove(index);

    } else {
      selectedIndexes.add(index);
    }
  }

  Future<void> createPdfFromImages() async {
    final pdf = pw.Document();

    for (var imagePath in imagePaths) {
      final image = pw.MemoryImage(File(imagePath).readAsBytesSync());
      pdf.addPage(pw.Page(build: (pw.Context context) {
        return pw.Center(
          child: pw.Image(image),
        );
      }));
    }
    
    try {
      final dir = await getApplicationDocumentsDirectory();
      final file = File('${dir.path}/selected_images.pdf');
      await file.writeAsBytes(await pdf.save());
      pdfPath.value = file.path;
      Get.snackbar('Success', 'PDF created ');
    } catch(e){
      print(e);
    }
  }

  Future<void> saveSelectedImagesToHive() async {
    final box = await Hive.openBox<String>('selectedImagesBox');
    for (var index in selectedIndexes) {
      await box.add(imagePaths[index]);
    }
    Get.snackbar('Success', 'Selected images saved to Hive');
  }

  Future<void> saveImagePath(String path) async {
    final box = await Hive.openBox<String>('imagePathsBox');
    if (await File(path).exists()) {
      if(!box.values.contains(path)){
       await box.add(path);
      }
      
    }
  }

  Future<void> loadImagePaths() async {
    final box = await Hive.openBox<String>('imagePathsBox');
    final validPaths =
        box.values.where((path) => File(path).existsSync()).toList();
    imagePaths.addAll(validPaths);
  }

 Future<void> deleteSelectdItems() async{
    final imagePathBox = await Hive.openBox<String>('imagePathBox');
    List<String> pathsToDelete = selectedIndexes.map((index) => imagePaths[index]).toList();

      for (String path in pathsToDelete) {
      final file = File(path);
      if (file.existsSync()) {
        file.deleteSync();
      }
      //Find and delete the path from HIve
      final keyToDelete = 
         imagePathBox.keys.cast().firstWhere((key) => imagePathBox.get(key!) == path,orElse: () => null,);
         if(keyToDelete!=null){
              await imagePathBox.delete(keyToDelete);
            
         }
     
      }

       imagePaths.removeWhere(
        (path) => pathsToDelete.contains(path));
    selectedIndexes.clear();
    
      Get.snackbar('Success','Deleted successfully');

    
   
  }

  Future<void> flushHiveMemory() async {
    final imagePathBox = await Hive.openBox<String>('imagePathBox');
    final selectedImagesBox = await Hive.openBox<String>('selectedImagesBox');
    await imagePathBox.clear();
    await selectedImagesBox.clear();
    imagePaths.clear();
    selectedIndexes.clear();
    pdfPath.value = '';
    Get.snackbar('Success', 'Hive memory flushed');
  }

   void shareSelectedImages() {
    if (selectedIndexes.isNotEmpty) {
     List<String> selectedImagePaths = selectedIndexes.map((index)=>imagePaths[index]).toList();
      selectedImagePaths.map((path) => XFile(path)).toList();
     Share.shareXFiles([XFile(pdfPath.value)], text: 'Here is the PDF of images.');
    } else {
      Get.snackbar('Error', 'No PDF available to share');
    }
  }

  void enlargeImage(String path){
   enlargedImagePath.value = path;
  }

  Future<void> cropImage() async {
    if (enlargedImagePath.value.isNotEmpty) {
      CroppedFile? croppedFile =await ImageCropper().cropImage(
        sourcePath: enlargedImagePath.value,
       uiSettings: [
        AndroidUiSettings(
          toolbarTitle: 'crop Image',
          toolbarColor: Get.theme.colorScheme.primary,
          toolbarWidgetColor: Colors.white,
          initAspectRatio: CropAspectRatioPreset.original,
          lockAspectRatio: false,
        ),
       ]
  
      );

      if (croppedFile != null) {
        // Update the image path in the imagePaths list
        int index = imagePaths.indexOf(enlargedImagePath.value);
        if (index != -1) {
          imagePaths[index] = croppedFile.path;
          await saveImagePath(croppedFile.path);
          enlargedImagePath.value = croppedFile.path;
          // await createPdfFromImages(showSnackbar: false);
        }
      }
    }
  }


  @override
  void onInit() {
    super.onInit();
    loadImagePaths();
  }
}
