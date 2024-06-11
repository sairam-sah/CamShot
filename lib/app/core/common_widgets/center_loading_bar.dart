import 'dart:math';

import 'package:flutter/material.dart';

import '../values/s_image_strings.dart';

class CenterLoadingBarImage extends StatefulWidget {
  const CenterLoadingBarImage({super.key});

  @override
  State<CenterLoadingBarImage> createState() => _CenterLoadingBarStateImage();
}

class _CenterLoadingBarStateImage extends State<CenterLoadingBarImage>
    with SingleTickerProviderStateMixin {
  var angle = 0;

  late AnimationController animationController;

  @override
  void initState() {
    super.initState();
    //if (animationController != null) animationController.dispose();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    animationController.repeat();
  }

  @override
  dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: SizedBox(
      height: 60,
      width: 60,
      child: AnimatedBuilder(
        animation: animationController,
        builder: (_, child) {
          return Transform.rotate(
            angle: animationController.value * 2 * pi,
            child: child,
          );
        },
        child: Image.asset(SImageAssets.appleLogo),
      ),
    ));
  }
}

class CenterLoadingBar extends StatelessWidget {
  const CenterLoadingBar(
      {super.key,
      this.loadingText = "Loading...",
      this.height = 60,
      this.width = 60,
      this.color});

  final String loadingText;
  final double height;
  final double width;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: SizedBox(
            height: height,
            width: width,
            child: CircularProgressIndicator(
              color: color,
            )));
  }
}
