import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileMenuWidget extends StatelessWidget {
  const ProfileMenuWidget({
    Key? key,
    required this.title,
    // required this.subtitle,
    required this.icon,
    required this.onPress,
    this.endIcon = true,
    this.textColor,
  }) : super(key: key);

  final String title;
  // final String subtitle;
  final IconData icon;
  final VoidCallback onPress;
  final bool endIcon;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Container(
              width: 24,
              height: 24,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  // color: isDark
                  //     ? Colors.amber.withOpacity(0.1)
                  //     : Colors.amber.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(40)),
              child: Icon(
                icon,
                color: textColor,
                // color: isDark ? Colors.amber : Colors.amberAccent,
              ),
            ),
            const SizedBox(
              width: 8,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: Get.textTheme.labelLarge!.copyWith(color: textColor),
                ),
                // Text(
                //   subtitle,
                //   style: Get.textTheme.labelSmall!.copyWith(color: textColor),
                // ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class ProfileMenuWidget2 extends StatelessWidget {
  const ProfileMenuWidget2({
    Key? key,
    required this.title,
    // required this.subtitle,
    required this.icon,
    required this.onPress,
    this.endIcon = true,
    this.textColor,
  }) : super(key: key);

  final String title;
  // final String subtitle;
  final IconData icon;
  final VoidCallback onPress;
  final bool endIcon;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Row(
        children: [
          Container(
            width: 24,
            height: 24,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                // color: isDark
                //     ? Colors.amber.withOpacity(0.1)
                //     : Colors.amber.withOpacity(0.1),
                borderRadius: BorderRadius.circular(40)),
            child: Icon(
              icon,
              color: textColor,
              // color: isDark ? Colors.amber : Colors.amberAccent,
            ),
          ),
          const SizedBox(
            width: 8,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: Get.textTheme.bodyMedium!.copyWith(color: textColor),
              ),
              // Text(
              //   subtitle,
              //   style: Get.textTheme.labelSmall!.copyWith(color: textColor),
              // ),
            ],
          ),
          const Spacer(),
          IconButton(
              onPressed: () {
                onPress();
              },
              icon: const Icon(
                FluentSystemIcons.ic_fluent_chevron_right_regular,
                size: 14,
              ))
        ],
      ),
    );
  }
}
