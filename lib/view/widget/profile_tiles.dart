import 'package:elias_weam_food2/constant/color.dart';
import 'package:elias_weam_food2/generated/assets.dart';
import 'package:elias_weam_food2/view/widget/my_text.dart';
import 'package:flutter/material.dart';

Material profileTiles({
  String? icon,
  String? title,
  VoidCallback? onTap,
}) {
  return Material(
    color: Colors.transparent,
    child: InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 10,
        ),
        child: Row(
          children: [
            Image.asset(
              icon!,
              height: 40,
            ),
            Expanded(
              child: MyText(
                paddingLeft: 15,
                text: title,
                size: 16,
                weight: FontWeight.w500,
              ),
            ),
            Image.asset(
              Assets.imagesArrowRight,
              height: 24,
              color: kGreyColor12,
            ),
          ],
        ),
      ),
    ),
  );
}