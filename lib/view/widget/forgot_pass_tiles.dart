import 'package:elias_weam_food2/constant/color.dart';
import 'package:elias_weam_food2/constant/instance.dart';
import 'package:elias_weam_food2/view/widget/my_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgotPasswordTile extends StatelessWidget {
  const ForgotPasswordTile({
    Key? key,
    required this.icon,
    required this.iconSize,
    required this.title,
    required this.subTitle,
    required this.onTap,
  }) : super(key: key);
  final String icon, title, subTitle;
  final double iconSize;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      bool isDark = themeController.isDarkTheme.value;
      return Container(
        height: languageController.isEnglish.value ? 72.22 : 82.22,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: isDark ? kDarkInputBgColor : kSeoulColor,
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: onTap,
            splashColor: kTertiaryColor.withOpacity(0.1),
            highlightColor: kTertiaryColor.withOpacity(0.1),
            borderRadius: BorderRadius.circular(16),
            child: Padding(
              padding: EdgeInsets.all(15),
              child: Row(
                children: [
                  Container(
                    height: 45,
                    width: 45,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: kSecondaryColor.withOpacity(0.1),
                    ),
                    child: Center(
                      child: Image.asset(
                        icon,
                        height: iconSize,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        MyText(
                          text: title,
                          weight: FontWeight.w600,
                          color: isDark ? kPrimaryColor : kBlackColor2,
                        ),
                        MyText(
                          text: subTitle,
                          size: 16,
                          color: kTertiaryColor,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
