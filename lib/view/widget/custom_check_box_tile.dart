import 'package:elias_weam_food2/constant/color.dart';
import 'package:elias_weam_food2/view/widget/my_text.dart';
import 'package:flutter/material.dart';

class CustomCheckBoxTile extends StatelessWidget {
  CustomCheckBoxTile({
    Key? key,
    required this.onTap,
    required this.isChecked,
    required this.title,
    required this.trailingText,
    this.marginHorizontal = 12.0,
  }) : super(key: key);

  final VoidCallback onTap;
  final bool isChecked;
  final String title, trailingText;
  double? marginHorizontal;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: marginHorizontal!,
        horizontal: 14,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: onTap,
            child: AnimatedContainer(
              height: 22.5,
              width: 22.5,
              duration: Duration(
                milliseconds: 112,
              ),
              curve: Curves.easeInOut,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isChecked ? kSecondaryColor : Colors.transparent,
                border: Border.all(
                  width: 1.5,
                  color: isChecked ? kSecondaryColor : kBorderColor4,
                ),
              ),
              child: Icon(
                Icons.check,
                color: isChecked ? kPrimaryColor : Colors.transparent,
                size: 15,
              ),
            ),
          ),
          Expanded(
            child: MyText(
              paddingLeft: 12,
              text: title,
              size: 16,
              color: Color(0xff292929),
            ),
          ),
          MyText(
            text: trailingText,
            size: 16,
            weight: FontWeight.w500,
            color: kGreyColor4,
          ),
        ],
      ),
    );
  }
}