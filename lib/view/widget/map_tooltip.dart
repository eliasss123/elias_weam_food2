import 'package:elias_weam_food2/constant/color.dart';
import 'package:elias_weam_food2/view/widget/my_text.dart';
import 'package:flutter/material.dart';

Widget mapToolTip(String location) {
  return Container(
    height: 28,
    padding: EdgeInsets.symmetric(
      horizontal: 10,
    ),
    decoration: BoxDecoration(
      boxShadow: [
        BoxShadow(
          color: kShadowColor.withOpacity(0.25),
          blurRadius: 4,
          offset: Offset(0, 4),
        ),
      ],
      borderRadius: BorderRadius.circular(19),
      color: kPrimaryColor.withOpacity(0.65),
    ),
    child: Center(
      child: MyText(
        text: location,
        size: 12,
        weight: FontWeight.w500,
      ),
    ),
  );
}
