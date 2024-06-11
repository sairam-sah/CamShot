// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// import '../values/s_image_strings.dart';

// class CircularNetworkImage extends StatelessWidget {
//   const CircularNetworkImage({
//     super.key,
//     required this.radius,
//     this.height,
//     this.width,
//     required this.image,
//     this.fit,
//     this.border = false,
//   });

//   final double radius;
//   final double? height;
//   final double? width;
//   final BoxFit? fit;
//   final bool border;
//   final String image;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: width ?? 70,
//       height: height ?? 70,
//       clipBehavior: Clip.antiAliasWithSaveLayer,
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(radius),
//         border: border ? Border.all(color: Get.theme.primaryColor) : null,
//       ),
//       child: Image(
//         errorBuilder: (context, error, stackTrace) {
//           return Image.asset(
//               width: width ?? 70,
//               height: height ?? 70,
//               fit: fit ?? BoxFit.fill,
//               SImageAssets.placeholder);
//         },
//         image: NetworkImage(
//           image,
//         ),
//         fit: fit ?? BoxFit.cover,
//         // height: 65,
//       ),
//     );
//   }
// }
