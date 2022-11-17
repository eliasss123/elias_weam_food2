import 'package:elias_weam_food2/constant/color.dart';
import 'package:elias_weam_food2/generated/assets.dart';
import 'package:elias_weam_food2/view/widget/my_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OutOfRangeDialog extends StatelessWidget {
  const OutOfRangeDialog({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Card(
          margin: EdgeInsets.symmetric(horizontal: 20),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40),
          ),
          child: Padding(
            padding: const EdgeInsets.all(30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: GestureDetector(
                    onTap: () => Get.back(),
                    child: Image.asset(
                      Assets.imagesX,
                      height: 19,
                    ),
                  ),
                ),
                MyText(
                  align: TextAlign.center,
                  text: 'Note',
                  size: 26,
                  weight: FontWeight.w500,
                  color: kRedColor2,
                  paddingBottom: 35,
                ),
                MyText(
                  text:
                      'Restaurant\'s whose distance is more than 9 kilometers from your location will not be able to provide you with the delivery service.',
                  size: 15,
                  weight: FontWeight.w500,
                  align: TextAlign.center,
                  height: 1.7,
                  paddingBottom: 50,
                ),
                MyText(
                  text:
                      'But you still have an option to pick up the delivery from the restaurant.',
                  size: 15,
                  weight: FontWeight.w500,
                  align: TextAlign.center,
                  height: 1.7,
                ),
                SizedBox(
                  height: Get.height * 0.25,
                ),
                Image.asset(
                  Assets.imagesLogoHorizBlk,
                  height: 53,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
