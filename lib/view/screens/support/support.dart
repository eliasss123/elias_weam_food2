import 'package:elias_weam_food2/constant/color.dart';
import 'package:elias_weam_food2/constant/instance.dart';
import 'package:elias_weam_food2/generated/assets.dart';
import 'package:elias_weam_food2/view/widget/my_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class Support extends StatelessWidget {
  Support({
    this.title = 'Contact Support',
  });

  String? title;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      bool isDark = themeController.isDarkTheme.value;
      bool isEnglish = languageController.isEnglish.value;
      return Scaffold(
        backgroundColor: isDark ? kDarkPrimaryColor : kSeoulColor6,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 50, 20, 0),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () => Get.back(),
                    child: RotatedBox(
                      quarterTurns: isEnglish ? 0 : 2,
                      child: Image.asset(
                        Assets.imagesArrowBack,
                        height: 24,
                        width: 24,
                        color: isDark ? kPrimaryColor : kBlackColor2,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Center(
                      child: MyText(
                        text: title,
                        size: 24,
                        weight: FontWeight.w700,
                        align: TextAlign.center,
                        color: isDark ? kPrimaryColor : kBlackColor2,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 30,
                  ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Image.asset(
                  isDark ? Assets.imagesSupportCall : Assets.imagesCallUs,
                  height: 94,
                ),
                SizedBox(
                  height: 10,
                ),
                Image.asset(
                  isDark ? Assets.imagesSupportEmail : Assets.imagesEmailUs,
                  height: 94,
                ),
                SizedBox(
                  height: 10,
                ),
                Image.asset(
                  isDark ? Assets.imagesSupportChat : Assets.imagesChat,
                  height: 94,
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 60),
              child: Image.asset(
                Assets.imagesVaiSupport,
                height: 81.93,
              ),
            ),
          ],
        ),
      );
    });
  }
}
