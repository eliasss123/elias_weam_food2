import 'package:elias_weam_food2/constant/color.dart';
import 'package:elias_weam_food2/view/widget/common_image_view.dart';
import 'package:elias_weam_food2/view/widget/my_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BrowseThumbnails extends StatelessWidget {
  const BrowseThumbnails({
    Key? key,
    required this.bgImg,
    required this.title,
    required this.onTap,
  }) : super(key: key);

  final String bgImg, title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CommonImageView(
          height: Get.height,
          width: Get.width,
          radius: 12.0,
          imagePath: bgImg,
        ),
        Container(
          height: Get.height,
          width: Get.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.0),
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
                kBlackColor3.withOpacity(0.34),
                kBlackColor3.withOpacity(0.34),
              ],
            ),
          ),
          child: Center(
            child: MyText(
              text: title,
              size: 16,
              weight: FontWeight.w700,
              color: kPrimaryColor,
            ),
          ),
        ),
      ],
    );
  }
}
