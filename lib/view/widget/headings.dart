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
