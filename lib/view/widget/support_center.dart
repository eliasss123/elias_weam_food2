import 'package:elias_weam_food2/constant/color.dart';
import 'package:elias_weam_food2/generated/assets.dart';
import 'package:elias_weam_food2/view/widget/my_text.dart';
import 'package:flutter/material.dart';

class SupportCenter extends StatelessWidget {
  const SupportCenter({
    Key? key,
    required this.orderNo,
  }) : super(key: key);
  final String orderNo;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      height: 76,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        color: kSeoulColor5,
      ),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: kPrimaryColor,
            ),
            child: Image.asset(
              Assets.imagesLogo,
              height: 42,
            ),
          ),
          SizedBox(
            width: 15,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MyText(
                  text: 'Support center',
                  size: 14,
                  weight: FontWeight.w700,
                ),
                MyText(
                  paddingTop: 6,
                  text: 'Order #$orderNo',
                  size: 13,
                  color: kBlackColor.withOpacity(0.40),
                ),
              ],
            ),
          ),
          Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            spacing: 15.0,
            children: [
              Image.asset(
                Assets.imagesCallSupport,
                height: 35,
              ),
              Image.asset(
                Assets.imagesMessageSupport,
                height: 35,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
