import 'package:elias_weam_food2/constant/color.dart';
import 'package:elias_weam_food2/generated/assets.dart';
import 'package:elias_weam_food2/view/widget/common_image_view.dart';
import 'package:elias_weam_food2/view/widget/my_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LiveTracking extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
                    imagePath: Assets.imagesCurrentLoc,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 50,
            left: 20,
            child: Align(
              alignment: Alignment.topLeft,
              child: GestureDetector(
                onTap: () => Get.back(),
                child: Image.asset(
                  Assets.imagesBackRoundedBlack,
                  height: 43,
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
              msgAboutRider: 'He is on his way to you.',
              time: '6:11 pm',
            ),
          ),
        ],
      ),
    );
  }
}

class DeliveryInformation extends StatelessWidget {
  const DeliveryInformation({
    Key? key,
    required this.riderName,
    required this.msgAboutRider,
    required this.time,
  }) : super(key: key);
  final String riderName, msgAboutRider, time;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      height: 80,
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
                  text: '$riderName just picked up your food',
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
