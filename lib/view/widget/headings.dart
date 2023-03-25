import 'package:elias_weam_food2/constant/color.dart';
import 'package:elias_weam_food2/constant/instance.dart';
import 'package:elias_weam_food2/view/widget/my_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget authHeading(String heading) {
  return Obx(() {
    return MyText(
      text: heading,
      size: 24,
      weight: FontWeight.w700,
      color: themeController.isDarkTheme.value ? kPrimaryColor : kBlackColor2,
    );
  });
}

Widget authSubHeading(String heading) {
  return Obx(() {
    return MyText(
      text: heading,
      size: 16,
      color:
          themeController.isDarkTheme.value ? kDarkModeGreyColor : kGreyColor2,
    );
  });
}

Widget headingTiles({
  String? heading,
  VoidCallback? onSeeAll,
}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Obx(() {
          return MyText(
            text: heading,
            size: 17,
            letterSpacing: 0.4,
            weight: FontWeight.w700,
            color: themeController.isDarkTheme.value
                ? kPrimaryColor
                : kBlackColor2,
          );
        }),
        MyText(
          onTap: onSeeAll,
          text: 'see_all'.tr,
          size: 13,
          letterSpacing: 0.4,
          color: kSecondaryColor,
          weight: FontWeight.w700,
        ),
      ],
    ),
  );
}
