import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'app/models/home/controllers/home_controller.dart';
import 'app/routes/app_pages.dart';

Future<void> main() async{
   WidgetsFlutterBinding.ensureInitialized();
     Get.put(HomeController()); // Initialize the HomeController
  runApp(
     GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
    );
}

