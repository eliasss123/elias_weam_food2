import 'package:elias_weam_food2/constant/color.dart';
import 'package:elias_weam_food2/view/widget/my_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomTabButton extends StatelessWidget {
  const CustomTabButton({
    Key? key,
    required this.text,
    required this.onTap,
    required this.isSelected,
  }) : super(key: key);
  final String text;
  final VoidCallback onTap;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: Get.height,
          decoration: isSelected
              ? BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: kBlackColor.withOpacity(0.02),
                blurRadius: 10,
                offset: Offset(0, 4),
              ),
            ],
            borderRadius: BorderRadius.circular(8),
            color: kPrimaryColor,
          )
              : BoxDecoration(),
          child: Center(
            child: MyText(
              text: text,
              size: 12,
              weight: isSelected ? FontWeight.w500 : FontWeight.w400,
              color: kDarkGreyColor4,
            ),
          ),
        ),
      ),
    );
  }
}