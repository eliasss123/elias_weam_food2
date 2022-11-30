import 'package:elias_weam_food2/constant/color.dart';
import 'package:elias_weam_food2/generated/assets.dart';
import 'package:elias_weam_food2/view/screens/main_app/order_status/delivery_order_status.dart';
import 'package:elias_weam_food2/view/widget/my_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderDeliveryInformation extends StatelessWidget {
  const OrderDeliveryInformation({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 20,
      ),
      height: 70,
      width: Get.width,
      decoration: BoxDecoration(
        color: kPrimaryColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(22),
          topRight: Radius.circular(22),
        ),
        boxShadow: [
          BoxShadow(
            color: kBlackColor.withOpacity(0.25),
            offset: Offset(0, -5),
            blurRadius: 4,
            spreadRadius: 0,
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Image.asset(
                      Assets.imagesLocationIndicator,
                      height: 15,
                    ),
                    MyText(
                      paddingLeft: 10,
                      text: 'Pie Pizza',
                      size: 14,
                      weight: FontWeight.w700,
                      color: kSecondaryColor,
                    ),
                  ],
                ),
                MyText(
                  paddingTop: 5,
                  text: 'Got your order Ashley, Sit back...',
                  size: 12,
                  color: kDarkGreyColor3,
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () => Get.to(
              () => TrackOrder(),
            ),
            child: Container(
              height: 36,
              width: 85,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: kSecondaryColor,
              ),
              child: Center(
                child: MyText(
                  text: 'Track order',
                  size: 13,
                  weight: FontWeight.w700,
                  color: kPrimaryColor,
                  letterSpacing: -0.6,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
