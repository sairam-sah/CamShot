import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class SplashIcon extends StatelessWidget {
  final String front;
  final String back;
  const SplashIcon({
    super.key,
    required this.front,
    required this.back,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          heightFactor: 1.69,
          child: SvgPicture.asset(
            front,
            width: 50,
            height: 50,
            color: /* ColorFilter.mode( */
                Get.theme.primaryColor /* , BlendMode.color) */,
          ),
        ),
        Center(
          child: SvgPicture.asset(
            back,
            width: 220,
            height: 80,
            color: /*  ColorFilter.mode( */ Get.theme.primaryColor
                .withOpacity(0.1) /* , BlendMode.color) */,
          ),
        ),
      ],
    );
  }
}
