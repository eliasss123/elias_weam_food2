import 'package:elias_weam_food2/constant/color.dart';
import 'package:elias_weam_food2/view/widget/my_text.dart';
import 'package:elias_weam_food2/view/widget/simple_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Finances extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: simpleAppBar(title: ''),
      body: ListView(
        shrinkWrap: true,
        padding: EdgeInsets.all(20),
        physics: BouncingScrollPhysics(),
        children: [
          MyText(
            text: 'finances'.tr,
            size: 22,
            weight: FontWeight.w700,
            paddingBottom: 30,
          ),
          MyText(
            paddingLeft: 10,
            paddingBottom: 5,
            text: 'unpaid'.tr,
            size: 20,
            weight: FontWeight.w500,
            color: kBlackColor,
          ),
          Container(
            height: 1,
            color: kUnSelectedButtonColor,
          ),
          Column(
            children: List.generate(
              2,
              (index) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MyText(
                      paddingTop: 5,
                      paddingLeft: 10,
                      text: '1/4/2022 - 31/4/2022',
                      size: 16,
                    ),
                    MyText(
                      text: '2,000.00₪',
                      size: 16,
                    ),
                  ],
                );
              },
            ),
          ),
          SizedBox(
            height: 30,
          ),
          MyText(
            paddingLeft: 10,
            paddingBottom: 5,
            text: 'paid'.tr,
            size: 20,
            weight: FontWeight.w500,
            color: kBlackColor,
          ),
          Container(
            height: 1,
            color: kUnSelectedButtonColor,
          ),
          Column(
            children: List.generate(
              2,
              (index) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MyText(
                      paddingTop: 5,
                      paddingLeft: 10,
                      text: '1/4/2022 - 31/4/2022',
                      size: 16,
                    ),
                    MyText(
                      text: '2,000.00₪',
                      size: 16,
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
