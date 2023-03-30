import 'package:elias_weam_food2/constant/color.dart';
import 'package:elias_weam_food2/view/widget/my_text.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SimpleToggleButtons extends StatelessWidget {
  SimpleToggleButtons({
    Key? key,
    required this.text,
    required this.isSelected,
    required this.onTap,
    this.paddingHorizontal,
    required this.isDark,
    this.paddingBottom,
    this.paddingTop,
  }) : super(key: key);
  final String text;
  final bool isSelected, isDark;
  final VoidCallback onTap;
  double? paddingHorizontal, paddingTop, paddingBottom;

  @override
  Widget build(BuildContext context) {
    return Align(
      child: AnimatedContainer(
        curve: Curves.easeInOut,
        duration: Duration(
          milliseconds: 110,
        ),
        margin: EdgeInsets.symmetric(
          horizontal: 7,
        ),
        decoration: BoxDecoration(
          color: isSelected
              ? kSecondaryColor
              : isDark
                  ? kDarkInputBgColor
                  : kPrimaryColor,
          borderRadius: BorderRadius.circular(13),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.02),
              spreadRadius: 0,
              blurRadius: 6,
              offset: Offset(0, 0),
            ),
          ],
        ),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(13),
          child: Padding(
            padding: EdgeInsets.only(
              left: paddingHorizontal ?? 17,
              right: paddingHorizontal ?? 17,
              top: paddingTop ?? 14,
              bottom: paddingBottom ?? 14,
            ),
            child: MyText(
              text: text,
              size: 13,
              color: isSelected
                  ? isDark
                      ? kBlackColor2
                      : kPrimaryColor
                  : isDark
                      ? kDarkModeGrey1Color
                      : kGreyColor3,
              weight: isSelected ? FontWeight.w700 : FontWeight.w400,
            ),
          ),
        ),
      ),
    );
  }
}
