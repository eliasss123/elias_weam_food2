import 'package:elias_weam_food2/constant/color.dart';
import 'package:elias_weam_food2/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

AppBar simpleAppBar({Color? bgColor}) {
  return AppBar(
    backgroundColor: bgColor ?? kPrimaryColor,
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
  );
}
