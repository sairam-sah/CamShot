import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart' as http;
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
   checkForUpdate();
  }

  Future<void> checkForUpdate() async{
    final packageInfo = await PackageInfo.fromPlatform();
    final String currentVersion = packageInfo.version;

    final  latestVersion = await fetchLatestVersionFromPlaystore(packageInfo.packageName);

    if (  latestVersion != null && isUpdateAvailable(currentVersion,latestVersion)){
      promptUserToUpdate();
    }

  }
  
  Future<String?> fetchLatestVersionFromPlaystore(String packageName) async{
    try{
      final response = await http.get(Uri.parse('https://play.google.com/store/apps/details?id=$packageName&hl=en'));
        if (response.statusCode == 200) {
        final regex = RegExp(r'Current Version</div><span class="htlgb"><div class="IQ1z0d"><span class="htlgb">([^<]+)</span></div></span>');
        final match = regex.firstMatch(response.body);
        if (match != null) {
          return match.group(1)?.trim();
        }
      }
    }catch (e){
      print('Failed to fetch latest version:$e');
    }
    return null;

  }

  bool isUpdateAvailable(String currentVersion, String latestVersion){
    return latestVersion.compareTo(currentVersion)> 0;
  }

  void promptUserToUpdate(){
    Get.dialog(
      AlertDialog(
        title: const Text('Update Available'),
        content: const Text('A new version of the app is available. Please update to the latest version.'),
        actions:[
          TextButton(onPressed: (){
            Get.back();
          }, child: const Text('cancel')
          ),

          TextButton(
            onPressed: () async {
              final url = 'https://play.google.com/store/apps/details?id=${PackageInfo.fromPlatform().then((packageInfo) => packageInfo.packageName)}';
              if (await canLaunch(url )){
                await launch(url);

              } else {
                Get.snackbar('Error', 'could not lunch the play Store');
              }
            },
            child: const Text('Update'),
          )
        ]
      )
    );
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
