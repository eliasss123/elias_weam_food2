import 'package:elias_weam_food2/constant/color.dart';
import 'package:elias_weam_food2/constant/instance.dart';
import 'package:elias_weam_food2/generated/assets.dart';
import 'package:elias_weam_food2/view/screens/main_app/location/pin_location.dart';
import 'package:elias_weam_food2/view/widget/common_image_view.dart';
import 'package:elias_weam_food2/view/widget/map_tooltip.dart';
import 'package:elias_weam_food2/view/widget/my_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Delivery extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      bool isDark = themeController.isDarkTheme.value;
      bool isEnglish = languageController.isEnglish.value;
      return ListView(
        shrinkWrap: true,
        padding: EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 0,
        ),
        physics: BouncingScrollPhysics(),
        children: [
          MyText(
            paddingLeft: isEnglish ? 20 : 0,
            paddingRight: isEnglish ? 0 : 20,
            text: 'you_set_your_order_as_delivery'.tr,
            size: 11,
            color: isDark ? kPrimaryColor : kBlackColor,
            paddingBottom: 40,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  Container(
                    height: 44,
                    width: 44,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: isDark
                          ? kSecondaryColor.withOpacity(0.1)
                          : kLightGreenColor,
                    ),
                    child: Center(
                      child: Image.asset(
                        Assets.imagesPhMapPinFill,
                        height: 22,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Column(
                    children: [
                      MyText(
                        text: 'saved_as'.tr,
                        size: 12,
                        weight: FontWeight.w500,
                        color: isDark ? kGreyColor12 : kGreyColor5,
                      ),
                      MyText(
                        text: 'home'.tr,
                        size: 12,
                        weight: FontWeight.w500,
                        color: isDark ? kPrimaryColor : kBlackColor2,
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                width: 15,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    MyText(
                      text: 'John’s apartment',
                      size: 16,
                      weight: FontWeight.w700,
                      paddingBottom: 7,
                      color: isDark ? kPrimaryColor : kBlackColor2,
                    ),
                    MyText(
                      text: '27H8+RC Mi’ilya, bornad street, Israel',
                      size: 14,
                      weight: FontWeight.w500,
                      color: isDark ? kGreyColor12 : kGreyColor5,
                      paddingBottom: 15,
                    ),
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () => Get.to(
                            () => PinLocation(),
                          ),
                          child: Container(
                            height: 32,
                            width: 80,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: isDark
                                  ? kSecondaryColor.withOpacity(0.2)
                                  : kLightGreenColor,
                            ),
                            child: Center(
                              child: MyText(
                                text: 'change'.tr,
                                size: 12,
                                weight: FontWeight.w700,
                                color: kSecondaryColor,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: 30,
          ),
          Stack(
            children: [
              CommonImageView(
                imagePath: Assets.imagesPickUpMap,
                height: 180,
                width: Get.width,
                radius: 20.0,
              ),
              Positioned(
                top: 20,
                right: 60,
                child: mapToolTip('27H8+RC Mi’ilya'),
              ),
            ],
          ),
        ],
      );
    });
  }
}
