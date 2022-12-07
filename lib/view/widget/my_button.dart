import 'package:elias_weam_food2/constant/color.dart';
import 'package:elias_weam_food2/view/widget/my_text.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MyButton extends StatelessWidget {
  MyButton({
    required this.buttonText,
    required this.onTap,
    this.height = 48,
    this.textSize,
    this.radius,
    this.fontWeight,
    this.isActive = true,
    this.bgColor,
  });

  final String buttonText;
  final VoidCallback onTap;
  double? height, textSize, radius;
  bool? isActive;
  FontWeight? fontWeight;
  Color? bgColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius ?? 16),
        color: isActive! ? bgColor ?? kSecondaryColor : kDisableColor,
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: isActive! ? onTap : null,
          splashColor: kPrimaryColor.withOpacity(0.1),
          highlightColor: kPrimaryColor.withOpacity(0.1),
          borderRadius: BorderRadius.circular(radius ?? 16),
          child: Center(
            child: MyText(
              text: buttonText,
              size: textSize,
              weight: fontWeight ?? FontWeight.w700,
              color: isActive! ? kPrimaryColor : kDisableTextColor,
            ),
          ),
        ),
      ),
    );
  }
}
