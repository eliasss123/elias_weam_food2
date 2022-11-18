import 'package:elias_weam_food2/constant/color.dart';
import 'package:elias_weam_food2/generated/assets.dart';
import 'package:elias_weam_food2/view/widget/my_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

AppBar simpleAppBar({
  Color? bgColor,
  String? title,
  FontWeight? titleWeight,
  double? titleSize,
}) {
  return AppBar(
    backgroundColor: bgColor ?? kPrimaryColor,
    centerTitle: true,
    leading: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () => Get.back(),
          child: Image.asset(
            Assets.imagesArrowBack,
            height: 24,
          ),
        ),
      ],
    ),
    title: MyText(
      text: title ?? '',
      size:  titleSize ?? 21,
      weight: titleWeight ?? FontWeight.w500,
    ),
  );
}
