import 'dart:io';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:hive/hive.dart';
import 'package:share_plus/share_plus.dart';

class ImagePickerController extends GetxController {
  RxList<String> imagePaths = <String>[].obs;
  RxList<int> selectedIndexes = <int>[].obs;
  RxString pdfPath = ''.obs; //path of generated pdf
  RxBool loading = false.obs; // Loading state observable

  final ImagePicker _picker = ImagePicker();

  Future<void> pickImageFromGallery() async {
    loading.value = true;
    try {
      final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
      if (image != null) {
        imagePaths.add(image.path);
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
      Get.snackbar('Success', 'PDF created at ${file.path}');
    } catch (e) {
      print(e);
      Get.snackbar('Error', 'Failed to create PDF');
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
      await box.add(path);
    }
  }

  Future<void> loadImagePaths() async {
    final box = await Hive.openBox<String>('imagePathsBox');
    final validPaths =
        box.values.where((path) => File(path).existsSync()).toList();
    imagePaths.addAll(validPaths);
  }

  void deleteSelectdItems() {
    selectedIndexes.forEach((index) {
      final file = File(imagePaths[index]);
      if (file.existsSync()) {
        file.deleteSync();
      }
    });
    imagePaths.removeWhere(
        (path) => selectedIndexes.contains(imagePaths.indexOf(path)));
    selectedIndexes.clear();
    createPdfFromImages();
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

  //  void sharePdf() {
  //   if (pdfPath.value.isNotEmpty) {
  //     Share.shareFiles([pdfPath.value], text: 'Here is the PDF of images.');
  //   } else {
  //     Get.snackbar('Error', 'No PDF available to share');
  //   }
  // }

  @override
  void onInit() {
    super.onInit();
    loadImagePaths();
  }
}
