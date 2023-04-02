import 'dart:developer';

import 'package:elias_weam_food2/constant/color.dart';
import 'package:elias_weam_food2/constant/instance.dart';
import 'package:elias_weam_food2/generated/assets.dart';
import 'package:elias_weam_food2/shared_preferences/user_simple_preferences.dart';
import 'package:elias_weam_food2/view/screens/launch/main_app/on_boarding.dart';
import 'package:elias_weam_food2/view/screens/main_app/bottom_nav_bar/bottom_nav_bar.dart';
import 'package:elias_weam_food2/view/widget/my_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:math' as math;

// ignore: must_be_immutable
class ChooseLanguage extends StatelessWidget {
  ChooseLanguage({Key? key}) : super(key: key);

  final List<String> languagesList = [
    'English',
    'Hebrew',
    'Arabic',
  ];

  List<String> languages = [
    'English',
    'עברית',
    'العربية',
  ];

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      bool isDark = themeController.isDarkTheme.value;
      return Scaffold(
        body: Container(
          padding: EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 80),
                    child: Image.asset(
                      isDark
                          ? Assets.imagesVaiLight
                          : Assets.imagesLogoHorizBlk,
                      height: 52.93,
                    ),
                  ),
                  MyText(
                    paddingTop: 32.8,
                    text: 'Choose your preferred language:',
                    size: 16,
                    align: TextAlign.center,
                    color: isDark ? kPrimaryColor : kDarkInputBgColor,
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 40),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: _languageToggleButton(
                        onTap: () async {
                          languageController.onLanguageChanged(
                            languagesList[0],
                            0,
                          );
                          await UserSimplePreferences.isFirstLaunch(false);
                        },
                        text: languages[0],
                        isSelected: languageController.currentIndex.value == 0,
                        align: Alignment.topLeft,
                        Angle: 15,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 5, bottom: 18),
                      child: _languageToggleButton(
                        onTap: () async {
                          languageController.onLanguageChanged(
                            languagesList[1],
                            1,
                          );
                          await UserSimplePreferences.isFirstLaunch(false);
                        },
                        text: languages[1],
                        isSelected: languageController.currentIndex.value == 1,
                        align: Alignment.centerRight,
                        Angle: -15,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 32),
                      child: _languageToggleButton(
                        onTap: () async {
                          languageController.onLanguageChanged(
                            languagesList[2],
                            2,
                          );
                          await UserSimplePreferences.isFirstLaunch(false);
                        },
                        text: languages[2],
                        isSelected: languageController.currentIndex.value == 2,
                        align: Alignment.topLeft,
                        Angle: 15,
                      ),
                    ),
                  ],
                ),
              ),
              Center(
                child: Container(
                  width: 213,
                  margin: EdgeInsets.fromLTRB(40, 40, 40, 50),
                  height: 56,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: languageController.currentIndex.value != -1
                        ? kSecondaryColor
                        : isDark
                            ? kPrimaryColor.withOpacity(0.10)
                            : kDisableColor,
                  ),
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: languageController.currentIndex.value != -1
                          ? () => Get.offAll(() => OnBoarding())
                          : () {},
                      splashColor: kPrimaryColor.withOpacity(0.1),
                      highlightColor: kPrimaryColor.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(16),
                      child: Center(
                        child: MyText(
                          text: 'Get Started',
                          weight: FontWeight.w700,
                          color: languageController.currentIndex.value != -1
                              ? kPrimaryColor
                              : isDark
                                  ? kPrimaryColor.withOpacity(0.26)
                                  : kDisableTextColor,
                          paddingRight: 8,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }

  Widget _languageToggleButton({
    required VoidCallback onTap,
    required String text,
    required bool isSelected,
    required Alignment align,
    required double Angle,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Align(
        alignment: align,
        child: Transform.rotate(
          angle: math.pi / Angle,
          child: Obx(() {
            bool isDark = themeController.isDarkTheme.value;
            return AnimatedContainer(
              curve: Curves.easeInOut,
              duration: Duration(
                milliseconds: 110,
              ),
              height: 96,
              width: 96,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.0),
                color: isSelected
                    ? kSecondaryColor
                    : isDark
                        ? kDarkInputBgColor
                        : kPrimaryColor,
                boxShadow: [
                  BoxShadow(
                    blurRadius: 10,
                    offset: Offset(0, 0),
                    color: Color(0xff020202).withOpacity(.20),
                  ),
                ],
              ),
              child: Center(
                child: MyText(
                  text: text,
                  size: 20,
                  weight: FontWeight.w600,
                  color: isSelected
                      ? Color(0xffF6F6F6)
                      : isDark
                          ? kPrimaryColor.withOpacity(0.30)
                          : kBlackColor.withOpacity(0.25),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
