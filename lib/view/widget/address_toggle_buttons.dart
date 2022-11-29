import 'package:elias_weam_food2/constant/color.dart';
import 'package:elias_weam_food2/view/widget/my_text.dart';
import 'package:flutter/material.dart';

class AddressToggleButton extends StatelessWidget {
  const AddressToggleButton({
    Key? key,
    required this.text,
    required this.isSelected,
    required this.onTap,
  }) : super(key: key);
  final String text;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 8,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: isSelected ? kLightGreenColor : Colors.transparent,
          border: Border.all(
            color: isSelected ? kLightGreenColor : kBorderColor3,
            width: 1.0,
          ),
        ),
        child: MyText(
          text: text,
          size: 12,
          weight: FontWeight.w500,
          color: kSecondaryColor,
        ),
      ),
    );
  }
}