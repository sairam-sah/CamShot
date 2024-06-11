import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../values/colors.dart';
import '../values/s_spacing.dart';

class Rating extends StatelessWidget {
  final double value;
  const Rating({super.key, this.value = 0});
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(5, (index) {
        return Icon(
          size: 12,
          index < value
              ? index + 1 <= value
                  ? Icons.star
                  : Icons.star_half
              : Icons.star_border,
        );
      }),
    );
  }
}

class Rating2 extends StatelessWidget {
  final double value;
  const Rating2({super.key, this.value = 0});
  @override
  Widget build(BuildContext context) {
    return Row(mainAxisSize: MainAxisSize.min, children: [
      const Icon(
        Icons.star_half,
        color: SColors.sunsineYellow,
      ),
      SSpacing.xxsW,
      Text(
        value.toStringAsFixed(1),
        style: Get.textTheme.bodyMedium,
      ),
    ]);
  }
}

class Rating3 extends StatelessWidget {
  final double value;
  const Rating3({super.key, this.value = 0});
  @override
  Widget build(BuildContext context) {
    return Row(mainAxisSize: MainAxisSize.min, children: [
      Text(
        value.toStringAsFixed(1),
        style: Get.textTheme.headlineMedium,
      ),
      SSpacing.smW,
      const Icon(
        Icons.star_half,
        size: 24,
        color: SColors.sunsineYellow,
      ),
    ]);
  }
}

class Health extends StatelessWidget {
  final double value;
  const Health({super.key, this.value = 0});
  @override
  Widget build(BuildContext context) {
    return Row(mainAxisSize: MainAxisSize.min, children: [
      Icon(
        Icons.health_and_safety,
        color: Get.theme.primaryColor,
      ),
      SSpacing.xxsW,
      Text(
        value.toInt().toString(),
        style: Get.textTheme.bodyMedium,
      ),
    ]);
  }
}
