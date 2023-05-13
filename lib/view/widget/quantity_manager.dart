import 'package:elias_weam_food2/constant/color.dart';
import 'package:elias_weam_food2/constant/instance.dart';
import 'package:elias_weam_food2/generated/assets.dart';
import 'package:elias_weam_food2/view/widget/my_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class QuantityManager extends StatelessWidget {
  const QuantityManager({
    Key? key,
    required this.value,
    required this.onLessTap,
    required this.onMoreTap,
  }) : super(key: key);
  final int value;
  final VoidCallback onLessTap, onMoreTap;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      bool isDark = themeController.isDarkTheme.value;
      return Container(
        padding: EdgeInsets.symmetric(
          horizontal: 8,
        ),
        height: 40,
        width: 102,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: isDark ? kDarkInputBgColor2 : kSeoulColor2,
        ),
        child: Row(
          children: [
            GestureDetector(
              onTap: onLessTap,
              child: Image.asset(
                Assets.imagesLess,
                height: 24,
              ),
            ),
            Expanded(
              child: MyText(
                align: TextAlign.center,
                text: value,
                size: 16,
                weight: FontWeight.w500,
                color: isDark ? kPrimaryColor : kBlackColor2,
              ),
            ),
            GestureDetector(
              onTap: onMoreTap,
              child: Image.asset(
                Assets.imagesMore,
                height: 24,
              ),
            ),
          ],
        ),
      );
    });
  }
}
