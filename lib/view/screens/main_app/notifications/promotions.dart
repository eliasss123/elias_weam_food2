import 'package:elias_weam_food2/constant/color.dart';
import 'package:elias_weam_food2/generated/assets.dart';
import 'package:elias_weam_food2/view/widget/my_text.dart';
import 'package:elias_weam_food2/view/widget/simple_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Promotions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: simpleAppBar(
        title: 'Promotions',
        titleWeight: FontWeight.w700,
      ),
      body: ListView(
        shrinkWrap: true,
        padding: EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 20,
        ),
        physics: BouncingScrollPhysics(),
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 25),
            height: 200,
            width: Get.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14),
              image: DecorationImage(
                image: AssetImage(
                  Assets.imagesBanner,
                ),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                MyText(
                  text: '50% Discount\nOn All Desert',
                  color: kPrimaryColor,
                  size: 24,
                  weight: FontWeight.w700,
                ),
                MyText(
                  paddingTop: 7,
                  paddingBottom: 20,
                  text: 'Grab itu now!',
                  color: kSeoulColor2,
                  size: 14,
                  weight: FontWeight.w500,
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Container(
                    height: 36,
                    width: 121,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14),
                      color: kPrimaryColor,
                    ),
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: () {},
                        borderRadius: BorderRadius.circular(14),
                        child: Center(
                          child: MyText(
                            text: 'Order Now',
                            size: 14,
                            weight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          MyText(
            paddingTop: 30,
            text:
                'Today 50% discount on all desert menus in kupa with online orders worldwide',
            size: 18,
            weight: FontWeight.w600,
            paddingBottom: 20,
          ),
          MyText(
            text:
                'Excuse me… Who could ever resist a discount feast? 👀\n\nHear me out. Today, October 21, 2021, Kupa has a 50% discount for desert. What are you waiting for, let\'s order now before it runs out.\n\nThere are 25 types of deserts in kupa and all of them are discounted, just order through the kupa app to enjoy this discount. From the best to the best we have prepared for you, may you always be happy when ordering at Kupa. Please choose the best menu for you to eat alone or with your best friends and family.\n\nSo, what’s your call? Let’s roll, order your comfort food now 😉',
            size: 14,
            weight: FontWeight.w500,
            color: kGreyColor5,
          ),
        ],
      ),
    );
  }
}
