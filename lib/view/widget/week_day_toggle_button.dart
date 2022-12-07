import 'package:elias_weam_food2/constant/color.dart';
import 'package:elias_weam_food2/view/widget/my_text.dart';
import 'package:flutter/material.dart';

class WeekDayToggleButton extends StatelessWidget {
  const WeekDayToggleButton({
    Key? key,
    required this.weekDay,
    required this.isSelected,
    required this.onTap,
  }) : super(key: key);

  final String weekDay;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 34,
        width: 34,
        decoration: BoxDecoration(
          color: isSelected ? kSecondaryColor : kBlackColor.withOpacity(0.18),
          shape: BoxShape.circle,
        ),
        child: Center(
          child: MyText(
            text: weekDay,
            size: 17,
            weight: FontWeight.w500,
            color: isSelected ? kPrimaryColor : kBlackColor.withOpacity(0.38),
          ),
        ),
      ),
    );
  }
}
