import 'package:elias_weam_food2/constant/color.dart';
import 'package:elias_weam_food2/generated/assets.dart';
import 'package:elias_weam_food2/view/widget/my_text.dart';
import 'package:flutter/material.dart';

class DeliveryCard extends StatelessWidget {
  const DeliveryCard({
    Key? key,
    required this.deliveryTo,
    required this.address,
    required this.distance,
    required this.onTap,
  }) : super(key: key);

  final String deliveryTo, address, distance;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
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
                      text: 'Delivery to $deliveryTo',
                      size: 16,
                      weight: FontWeight.w700,
                      color: kPrimaryColor,
                      paddingBottom: 2,
                    ),
                    Image.asset(
                      Assets.imagesArrowRight,
                      height: 24,
                    ),
                  ],
                ),
                MyText(
                  text: '$address',
                  size: 14,
                  weight: FontWeight.w400,
                  color: kPrimaryColor,
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
                    color: kPrimaryColor,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Center(
                    child: MyText(
                      text: '$distance km',
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
  }
}