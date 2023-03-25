import 'package:elias_weam_food2/constant/color.dart';
import 'package:elias_weam_food2/constant/instance.dart';
import 'package:elias_weam_food2/generated/assets.dart';
import 'package:elias_weam_food2/view/widget/my_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

AppBar simpleAppBar({
  Color? bgColor,
  String? title,
  FontWeight? titleWeight,
  double? titleSize,
  bool? isDark = false,
}) {
  return AppBar(
    backgroundColor:
    isDark! ? bgColor ?? kDarkPrimaryColor : bgColor ?? kPrimaryColor,
    centerTitle: true,
    leading: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Obx(() {
          return GestureDetector(
            onTap: () => Get.back(),
            child: RotatedBox(
              quarterTurns: languageController.isEnglish.value ? 0 : 2,
              child: Image.asset(
                Assets.imagesArrowBack,
                height: 24,
                color: isDark ? kPrimaryColor : kBlackColor2,
              ),
            ),
          );
        }),
      ],
    ),
    title: MyText(
      text: title ?? '',
      size: titleSize ?? 21,
      color: isDark ? kPrimaryColor : kBlackColor2,
      weight: titleWeight ?? FontWeight.w500,
    ),
  );
}
