import 'package:elias_weam_food2/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

AppBar simpleAppBar() {
  return AppBar(
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
