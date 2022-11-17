import 'package:elias_weam_food2/constant/color.dart';
import 'package:elias_weam_food2/view/widget/common_image_view.dart';
import 'package:elias_weam_food2/view/widget/my_text.dart';
import 'package:flutter/material.dart';

class ToggleButtonsWithImage extends StatelessWidget {
  const ToggleButtonsWithImage({
    Key? key,
    required this.img,
    required this.title,
    required this.isSelected,
    required this.onTap,
  }) : super(key: key);
  final String img, title;
  final bool isSelected;
  final VoidCallback onTap;

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
        height: 60,
        width: 125,
        decoration: BoxDecoration(
          color: isSelected ? kSecondaryColor : kPrimaryColor,
          borderRadius: BorderRadius.circular(13),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.02),
              spreadRadius: 5,
              blurRadius: 10,
              offset: Offset(7, 7),
            ),
          ],
        ),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(13),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: [
                CommonImageView(
                  height: 43,
                  width: 43,
                  radius: 8.0,
                  imagePath: img,
                ),
                Expanded(
                  child: MyText(
                    paddingLeft: 10,
                    text: title,
                    size: 12,
                    color: isSelected ? kPrimaryColor : kBlackColor2,
                    weight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
