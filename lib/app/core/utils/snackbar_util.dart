import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../values/colors.dart';

class SSnackbarUtil {
  SSnackbarUtil._();

  static showSnackbar(String title, String message, SnackbarType? type) {
    var color = Colors.green;
    switch (type ?? SnackbarType.info) {
      case SnackbarType.info:
        color = Colors.grey;
        break;
      case SnackbarType.warning:
        color = Colors.yellow;
        break;
      case SnackbarType.error:
        color = Colors.red;
        break;
      case SnackbarType.success:
        color = Colors.green;
        break;
    }

    Get.rawSnackbar(
      title: title,
      message: message,
      icon: const Icon(Icons.info),
      titleText: Text(
        title,
        style: Get.textTheme.titleMedium!
            .copyWith(color: Get.theme.colorScheme.onPrimary),
      ),
      duration: const Duration(seconds: 10),
      mainButton: TextButton.icon(
        onPressed: () => Get.back(),
        icon: const Icon(
          Icons.cancel,
          color: SColors.white,
        ),
        label: const Text(''),
      ),
      messageText: Text(
        message,
        maxLines: 10,
        style: Get.textTheme.bodyMedium!
            .copyWith(color: Get.theme.colorScheme.onPrimary),
      ),
      borderRadius: 12,
      borderWidth: 2,
      borderColor: color.withOpacity(0.8),
      barBlur: 1,
      snackStyle: SnackStyle.GROUNDED,
      // overlayColor: SColors.white,
      // colorText: SColors.white,
      snackPosition: SnackPosition.TOP,
      backgroundColor: color,
    );
  }
}

enum SnackbarType { info, warning, error, success }
