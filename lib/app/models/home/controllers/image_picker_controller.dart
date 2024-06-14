import 'dart:io';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:hive/hive.dart';

class ImagePickerController extends GetxController {
  RxList<String> imagePaths = <String>[].obs;
  RxList<int> selectedIndexes = <int>[].obs;

  final ImagePicker _picker = ImagePicker();

  Future<void> pickImageFromGallery() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      imagePaths.add(image.path);
      await saveImagePath(image.path);
    }
  }

  Future<void> pickImageFromCamera() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.camera);
    if (image != null) {
      imagePaths.add(image.path);
      await saveImagePath(image.path);
    }
  }

  void toggleSelection(int index) {
    if (selectedIndexes.contains(index)) {
      selectedIndexes.remove(index);
    } else {
      selectedIndexes.add(index);
    }
  }

  Future<File?> createPdfFromImages() async {
    final pdf = pw.Document();

    for (var index in selectedIndexes) {
      final imagePath = imagePaths[index];
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
      return file;
    } catch (e) {
      print(e);
      return null;
    }
  }
  Future<void> saveSelectedImagesToHive() async {
    final box = await Hive.openBox<String>('selectedImagesBox');
    for (var index in selectedIndexes) {
      await box.add(imagePaths[index]);
    }
  }

  Future<void> saveImagePath(String path) async {
    final box = await Hive.openBox<String>('imagePathsBox');
    await box.add(path);
  }

  Future<void> loadImagePaths() async {
    final box = await Hive.openBox<String>('imagePathsBox');
    imagePaths.addAll(box.values);
  }

  @override
  void onInit() {
    super.onInit();
    loadImagePaths();
  }
}
