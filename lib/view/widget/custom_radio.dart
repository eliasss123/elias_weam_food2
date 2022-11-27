import 'package:elias_weam_food2/constant/color.dart';
import 'package:flutter/material.dart';

class CustomRadio extends StatelessWidget {
  const CustomRadio({
    Key? key,
    required this.isSelected,
    required this.onTap,
  }) : super(key: key);

  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 23,
        width: 23,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            width: 1.0,
            color: kSecondaryColor,
          ),
        ),
        child: Center(
          child: isSelected
              ? Container(
            height: 12,
            width: 12,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: kSecondaryColor,
            ),
          )
              : SizedBox(),
        ),
      ),
    );
  }
}