import 'package:elias_weam_food2/constant/color.dart';
import 'package:elias_weam_food2/generated/assets.dart';
import 'package:elias_weam_food2/view/widget/my_text.dart';
import 'package:flutter/material.dart';

class QuantityManager extends StatelessWidget {
  const QuantityManager({
    Key? key,
    required this.value,
    required this.onLessTap,
    required this.onMoreTap,
  }) : super(key: key);
  final String value;
  final VoidCallback onLessTap, onMoreTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 8,
      ),
      height: 40,
      width: 102,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: kSeoulColor2,
      ),
      child: Row(
        children: [
          GestureDetector(
            onTap: onLessTap,
            child: Image.asset(
              Assets.imagesLess,
              height: 24,
            ),
          ),
          Expanded(
            child: MyText(
              align: TextAlign.center,
              text: value,
              size: 16,
              weight: FontWeight.w500,
            ),
          ),
          GestureDetector(
            onTap: onMoreTap,
            child: Image.asset(
              Assets.imagesMore,
              height: 24,
            ),
          ),
        ],
      ),
    );
  }
}
