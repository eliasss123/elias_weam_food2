import 'package:elias_weam_food2/constant/color.dart';
import 'package:elias_weam_food2/view/widget/my_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DropOff extends StatelessWidget {
  const DropOff({
    Key? key,
    required this.address,
    required this.time,
  }) : super(key: key);
  final String address, time;

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
                  text: 'Drop off',
                  weight: FontWeight.w500,
                  color: kPrimaryColor,
                  size: 15,
                  letterSpacing: 0.0,
                ),
                MyText(
                  paddingTop: 7,
                  text: '731 S. High Point Street',
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
                text: 'time',
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