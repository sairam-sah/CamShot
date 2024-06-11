import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../values/s_image_strings.dart';
import '../values/s_spacing.dart';

class PopularWidget extends StatelessWidget {
  const PopularWidget({
    super.key,
    this.radius = 12.0,
    this.height = 75.0,
    this.width = 75.0,
    required this.name,
    required this.image,
    required this.onPressed,
  });

  final double radius;
  final double? height;
  final double? width;
  final String name;
  final String image;

  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: width,
              height: height,
              padding: SSpacing.smMargin,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              decoration: BoxDecoration(
                  color: Get.theme.colorScheme.outline,
                  borderRadius: BorderRadius.circular(radius),
                  border: Border.all(color: Get.theme.colorScheme.primary)),
              child: Image(
                errorBuilder: (context, error, stackTrace) {
                  return Image.asset(
                      width: width,
                      height: height,
                      fit: BoxFit.contain,
                      SImageAssets.placeholder);
                },
                image: NetworkImage(
                  image,
                ),
                fit: BoxFit.cover,
                // height: 65,
              ),
            ),
            SSpacing.xsH,
            Flexible(
              child: Text(
                name,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: Get.textTheme.labelMedium,
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
      onTap: () {
        onPressed();
      },
    );
  }
}
