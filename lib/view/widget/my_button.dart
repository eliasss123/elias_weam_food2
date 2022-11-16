import 'package:elias_weam_food2/constant/color.dart';
import 'package:elias_weam_food2/view/widget/my_text.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MyButton extends StatelessWidget {
  MyButton({
    required this.buttonText,
    required this.onTap,
    this.height = 48,
    this.isActive = true,
  });

  final String buttonText;
  final VoidCallback onTap;
  double? height;
  bool? isActive;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: isActive! ? kSecondaryColor : kDisableColor,
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: isActive! ? onTap : null,
          splashColor: kPrimaryColor.withOpacity(0.1),
          highlightColor: kPrimaryColor.withOpacity(0.1),
          borderRadius: BorderRadius.circular(16),
          child: Center(
            child: MyText(
              text: buttonText,
              weight: FontWeight.w700,
              color: isActive! ? kPrimaryColor : kDisableTextColor,
            ),
          ),
        ),
      ),
    );
  }
}
