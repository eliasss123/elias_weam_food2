import 'package:elias_weam_food2/constant/color.dart';
import 'package:elias_weam_food2/constant/instance.dart';
import 'package:elias_weam_food2/view/widget/my_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DeliveryFeeAndTime extends StatelessWidget {
  const DeliveryFeeAndTime({
    Key? key,
    required this.fee,
    required this.time,
  }) : super(key: key);
  final String fee, time;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      bool isDark = themeController.isDarkTheme.value;
      return Container(
        padding: EdgeInsets.symmetric(
          horizontal: 30,
        ),
        margin: EdgeInsets.symmetric(
          horizontal: 20,
        ),
        height: 84,
        decoration: BoxDecoration(
          color: isDark ? kDarkInputBgColor : kPrimaryColor,
          borderRadius: BorderRadius.circular(14),
          boxShadow: [
            BoxShadow(
              color: kBlackColor.withOpacity(0.02),
              offset: Offset(10, 10),
              blurRadius: 30,
              spreadRadius: 14,
            ),
          ],
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  MyText(
                    text: 'Delivery fee',
                    size: 13,
                    color: isDark
                        ? kPrimaryColor.withOpacity(0.55)
                        : kBlackColor.withOpacity(0.44),
                  ),
                  MyText(
                    text: '\$$fee',
                    size: 15,
                    weight: FontWeight.w500,
                    color: isDark ? kPrimaryColor : kBlackColor,
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(
                horizontal: 30,
              ),
              height: 41,
              width: 1,
              color: kDividerColor,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  MyText(
                    text: 'Delivery time',
                    size: 13,
                    color: isDark
                        ? kPrimaryColor.withOpacity(0.55)
                        : kBlackColor.withOpacity(0.44),
                  ),
                  MyText(
                    text: '$time min',
                    size: 15,
                    weight: FontWeight.w500,
                    color: isDark ? kPrimaryColor : kBlackColor,
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    });
  }
}
