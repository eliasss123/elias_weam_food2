import 'dart:async';
import 'dart:developer';
import 'package:elias_weam_food2/config/theme/dark_theme.dart';
import 'package:elias_weam_food2/config/theme/light_theme.dart';
import 'package:elias_weam_food2/constant/instance.dart';
import 'package:elias_weam_food2/controller/language_controller/language_controller.dart';
import 'package:elias_weam_food2/generated/assets.dart';
import 'package:elias_weam_food2/shared_preferences/user_simple_preferences.dart';
import 'package:elias_weam_food2/view/screens/launch/main_app/on_boarding.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    splashScreenHandler();
    getTheme();
    getLanguage();
  }

  void splashScreenHandler() {
    Timer(
      Duration(milliseconds: 2520),
      () => Get.offAll(
        () => OnBoarding(),
      ),
    );
  }

  void getLanguage() async {
    languageController.currentIndex.value =
        await UserSimplePreferences.getLanguageIndex() ?? 0;
    languageController.currentIndex.value != 0
        ? languageController.isEnglish.value = false
        : languageController.isEnglish.value = true;
    if (languageController.currentIndex.value == 0) {
      Localization().selectedLocale('English');
    } else if (languageController.currentIndex.value == 1) {
      Localization().selectedLocale('Hebrew');
    } else if (languageController.currentIndex.value == 2) {
      Localization().selectedLocale('Arabic');
    }
  }

  void getTheme() async {
    final theme = await UserSimplePreferences.getTheme();
    setState(() {
      log(theme.toString());
      if (theme == 'DARK_MODE') {
        Get.changeTheme(darkTheme);
        themeController.isDarkTheme.value = true;
      } else {
        themeController.isDarkTheme.value = false;
        Get.changeTheme(lightTheme);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Obx(() {
          return Lottie.asset(
            themeController.isDarkTheme.value
                ? Assets.imagesDarkModeAnimatedLogo
                : Assets.imagesLightModeAnimatedLogo,
          );
        }),
      ),
    );
  }
}
