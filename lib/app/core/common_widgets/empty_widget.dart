import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../values/s_image_strings.dart';
import 'splash_widget.dart';

class EmptyWidget extends StatelessWidget {
  const EmptyWidget({
    super.key,
    this.onButtonPress,
    this.isButtonAvailable = false,
    this.buttonText = 'Ok',
    this.message = 'Item not found',
    required this.frontImageString,
    this.backImageString = SImageAssets.iconBg,
  });

  final Function? onButtonPress;
  final bool isButtonAvailable;
  final String buttonText;
  final String message;
  final String frontImageString;
  final String backImageString;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: Get.height * 0.5,
      child: Center(
        child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SplashIcon(
                front: frontImageString,
                back: backImageString,
              ),
              const SizedBox(
                height: 32,
              ),
              Text(
                message,
                maxLines: 5,
                style: Get.textTheme.titleMedium!.copyWith(
                    fontWeight: FontWeight.normal,
                    color: Get.theme.primaryColor),
                textAlign: TextAlign.center,
              ),
              Visibility(
                visible: isButtonAvailable,
                child: Padding(
                    padding: const EdgeInsets.all(32.0),
                    child: OutlinedButton(
                        onPressed: () {
                          onButtonPress!();
                        },
                        child: Text(buttonText))),
              ),
            ]),
      ),
    );
  }
}
