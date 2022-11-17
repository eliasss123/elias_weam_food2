import 'package:elias_weam_food2/constant/color.dart';
import 'package:elias_weam_food2/view/widget/my_text.dart';
import 'package:flutter/material.dart';

Widget authHeading(String heading) {
  return MyText(
    text: heading,
    size: 24,
    weight: FontWeight.w700,
  );
}

MyText authSubHeading(String heading) {
  return MyText(
    text: heading,
    size: 16,
    color: kGreyColor2,
  );
}

Widget headingTiles({
  String? heading,
  VoidCallback? onSeeAll,
}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        MyText(
          text: heading,
          size: 17,
          weight: FontWeight.w700,
        ),
        MyText(
          onTap: onSeeAll,
          text: 'See All',
          size: 13,
          color: kSecondaryColor,
          weight: FontWeight.w700,
        ),
      ],
    ),
  );
}
