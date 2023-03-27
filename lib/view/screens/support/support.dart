import 'package:elias_weam_food2/constant/color.dart';
import 'package:elias_weam_food2/constant/instance.dart';
import 'package:elias_weam_food2/generated/assets.dart';
import 'package:elias_weam_food2/view/widget/my_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class Support extends StatelessWidget {
  Support({
    this.title,
  });

  String? title;

  final List<String> icons = [
    Assets.imagesCallSupport,
    Assets.imagesEmailSupport,
    Assets.imagesChatSupport,
  ];

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
                        text: title ?? 'contact_support'.tr,
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
              children: [
                supportButton(
                  isDark: isDark,
                  isEnglish: isEnglish,
                  icon: Assets.imagesPhone,
                  text: 'call_us'.tr,
                  onTap: () {},
                ),
                supportButton(
                  isDark: isDark,
                  isEnglish: isEnglish,
                  icon: Assets.imagesEmailSupport,
                  text: 'email_us'.tr,
                  onTap: () {},
                ),
                supportButton(
                  isDark: isDark,
                  isEnglish: isEnglish,
                  icon: Assets.imagesChatSupport,
                  text: 'chat'.tr,
                  onTap: () {},
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

  Widget supportButton({
    required bool isDark,
    required bool isEnglish,
    required String text,
    required String icon,
    required VoidCallback onTap,
  }) {
    return Center(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: 94,
          width: 110,
          margin: EdgeInsets.only(bottom: 26),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: isDark ? Color(0xff292929) : kSeoulColor4,
            boxShadow: [
              BoxShadow(
                color: kBlackColor.withOpacity(0.2),
                offset: Offset(0, 0),
                blurRadius: 10,
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 44,
                width: 44,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: kSecondaryColor.withOpacity(0.2),
                ),
                child: Center(
                  child: Transform(
                    transform: Matrix4.identity()
                      ..scale(isEnglish ? 1.0 : -1.0, 1.0, 1.0),
                    alignment: Alignment.center,
                    child: Image.asset(
                      icon,
                      height: 21,
                    ),
                  ),
                ),
              ),
              MyText(
                paddingTop: 7,
                text: text,
                size: 14.5,
                weight: FontWeight.w700,
                color: kSecondaryColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
