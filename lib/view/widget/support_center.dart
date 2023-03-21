import 'package:elias_weam_food2/constant/color.dart';
import 'package:elias_weam_food2/constant/instance.dart';
import 'package:elias_weam_food2/generated/assets.dart';
import 'package:elias_weam_food2/view/widget/my_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SupportCenter extends StatelessWidget {
  const SupportCenter({
    Key? key,
    required this.orderNo,
  }) : super(key: key);
  final String orderNo;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      bool isDark = themeController.isDarkTheme.value;
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 15),
        height: 76,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          color: isDark ? kDarkInputBgColor2 : kSeoulColor5,
        ),
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isDark ? kDarkPrimaryColor : kPrimaryColor,
              ),
              child: Image.asset(
                Assets.imagesLogo,
                height: 42,
              ),
            ),
            SizedBox(
              width: 15,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MyText(
                    text: 'Support center',
                    size: 14,
                    weight: FontWeight.w700,
                    color: isDark ? kPrimaryColor : kBlackColor2,
                  ),
                  MyText(
                    paddingTop: 6,
                    text: 'Order #$orderNo',
                    size: 13,
                    color: isDark
                        ? kPrimaryColor.withOpacity(0.40)
                        : kBlackColor.withOpacity(0.40),
                  ),
                ],
              ),
            ),
            Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              spacing: isDark ? 5 : 15.0,
              children: [
                Image.asset(
                  isDark ? Assets.imagesCallDark : Assets.imagesCallSupport,
                  height: isDark ? 40 : 35,
                ),
                Image.asset(
                  isDark
                      ? Assets.imagesMessageDark
                      : Assets.imagesMessageSupport,
                  height: isDark ? 40 : 35,
                ),
              ],
            ),
          ],
        ),
      );
    });
  }
}
