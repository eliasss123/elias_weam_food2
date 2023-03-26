import 'package:elias_weam_food2/constant/color.dart';
import 'package:elias_weam_food2/constant/instance.dart';
import 'package:elias_weam_food2/generated/assets.dart';
import 'package:elias_weam_food2/view/widget/common_image_view.dart';
import 'package:elias_weam_food2/view/widget/my_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LiveTracking extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      bool isDark = themeController.isDarkTheme.value;
      bool isEnglish = languageController.isEnglish.value;
      return Scaffold(
        body: Stack(
          children: [
            Container(
              height: Get.height,
              width: Get.width,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    Assets.imagesSimpleMap,
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              bottom: 120,
              right: 20,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Align(
                    child: CommonImageView(
                      height: 45,
                      width: 45,
                      radius: 12.0,
                      imagePath: isDark
                          ? Assets.imagesDarkModeLoc
                          : Assets.imagesCurrentLoc,
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: 50,
              left: isEnglish ? 20 : 0,
              right: isEnglish ? 0 : 20,
              child: Align(
                alignment: isEnglish ? Alignment.topLeft : Alignment.topRight,
                child: GestureDetector(
                  onTap: () => Get.back(),
                  child: RotatedBox(
                    quarterTurns: isEnglish ? 0 : 2,
                    child: Image.asset(
                      isDark
                          ? Assets.imagesArrowBackDark
                          : Assets.imagesBackRoundedBlack,
                      height: 43,
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 20,
              left: 20,
              right: 20,
              child: DeliveryInformation(
                riderName: 'Leo',
                msgAboutRider: 'he_is_on_his_way_to_you'.tr,
                time: '6:11 pm',
                isEnglish: isEnglish,
              ),
            ),
          ],
        ),
      );
    });
  }
}

class DeliveryInformation extends StatelessWidget {
  const DeliveryInformation({
    Key? key,
    required this.riderName,
    required this.msgAboutRider,
    required this.time,
    required this.isEnglish,
  }) : super(key: key);
  final String riderName, msgAboutRider, time;
  final bool isEnglish;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      height: isEnglish ? 80: 90,
      width: Get.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        color: kBlackColor6,
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MyText(
                  text: '$riderName ${'just_picked_up_your_food'.tr}',
                  weight: FontWeight.w500,
                  color: kPrimaryColor,
                  letterSpacing: 0.0,
                ),
                MyText(
                  paddingTop: 7,
                  text: msgAboutRider,
                  size: 12,
                  color: kPrimaryColor.withOpacity(0.70),
                  letterSpacing: 0.0,
                ),
              ],
            ),
          ),
          Container(
            height: 28,
            width: 52,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              color: kDarkGreenColor,
            ),
            child: Center(
              child: MyText(
                text: time,
                size: 12,
                weight: FontWeight.w500,
                color: kPrimaryColor,
                letterSpacing: 0.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
