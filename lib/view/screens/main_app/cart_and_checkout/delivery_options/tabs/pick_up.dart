import 'package:elias_weam_food2/constant/color.dart';
import 'package:elias_weam_food2/constant/instance.dart';
import 'package:elias_weam_food2/generated/assets.dart';
import 'package:elias_weam_food2/view/widget/common_image_view.dart';
import 'package:elias_weam_food2/view/widget/my_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Pickup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      bool isDark = themeController.isDarkTheme.value;
      return ListView(
        padding: EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 0,
        ),
        shrinkWrap: true,
        physics: BouncingScrollPhysics(),
        children: [
          MyText(
            paddingLeft: 20,
            text: 'You set your order as pick up.',
            size: 11,
            color: isDark ? kPrimaryColor : kBlackColor,
          ),
          MyText(
            paddingTop: 25,
            paddingBottom: 30,
            text:
                'Order tracking will appear after checkout to pick up your order on time.',
            size: 13,
            letterSpacing: 0.3,
            weight: FontWeight.w500,
            color: isDark ? kPrimaryColor : kBlackColor,
          ),
          MyText(
            text: 'Restaurant address',
            size: 16,
            weight: FontWeight.w700,
            paddingBottom: 20,
            color: isDark ? kPrimaryColor : kBlackColor2,
          ),
          CommonImageView(
            imagePath: Assets.imagesPickUpMap,
            height: 288,
            radius: 20.0,
          ),
          MyText(
            paddingTop: 30,
            text: 'King George St 17, Jerusalem',
            size: 14,
            color: isDark
                ? kPrimaryColor.withOpacity(0.5)
                : kBlackColor.withOpacity(0.5),
          ),
        ],
      );
    });
  }
}
