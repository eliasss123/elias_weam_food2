import 'package:elias_weam_food2/constant/color.dart';
import 'package:elias_weam_food2/constant/instance.dart';
import 'package:elias_weam_food2/generated/assets.dart';
import 'package:elias_weam_food2/view/widget/my_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DeliveryCard extends StatelessWidget {
  const DeliveryCard({
    Key? key,
    required this.address,
    required this.distance,
    required this.onTap,
    required this.isPickUp,
  }) : super(key: key);

  final String address, distance;
  final VoidCallback onTap;
  final bool isPickUp;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      bool isDark = themeController.isDarkTheme.value;
      bool isEnglish = languageController.isEnglish.value;
      return Container(
        height: 101,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: kSecondaryColor,
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: onTap,
            splashColor: kPrimaryColor.withOpacity(0.1),
            highlightColor: kPrimaryColor.withOpacity(0.1),
            borderRadius: BorderRadius.circular(16),
            child: Padding(
              padding: EdgeInsets.fromLTRB(20, 10, 16, 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      MyText(
                        text: isPickUp ? 'pick_up'.tr : 'delivery_to_home'.tr,
                        size: 16,
                        weight: FontWeight.w700,
                        color: isDark ? kBlackColor2 : kPrimaryColor,
                        paddingBottom: 2,
                      ),
                      RotatedBox(
                        quarterTurns: isEnglish ? 0 : 2,
                        child: Image.asset(
                          Assets.imagesArrowRight,
                          height: 24,
                          color: isDark ? kBlackColor2 : kPrimaryColor,
                        ),
                      ),
                    ],
                  ),
                  MyText(
                    text: '$address',
                    size: 14,
                    weight: FontWeight.w400,
                    color: isDark ? kBlackColor2 : kPrimaryColor,
                    paddingBottom: 7,
                  ),
                  Container(
                    height: 24,
                    width: 59,
                    padding: EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: isDark ? kBlackColor2 : kPrimaryColor,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Center(
                      child: MyText(
                        text: '$distance ${'km'.tr}',
                        size: 12,
                        weight: FontWeight.w700,
                        color: kSecondaryColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
