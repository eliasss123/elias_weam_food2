import 'dart:async';
import 'dart:developer';
import 'package:elias_weam_food2/config/theme/dark_theme.dart';
import 'package:elias_weam_food2/config/theme/light_theme.dart';
import 'package:elias_weam_food2/constant/instance.dart';
import 'package:elias_weam_food2/controller/language_controller/language_controller.dart';
import 'package:elias_weam_food2/generated/assets.dart';
import 'package:elias_weam_food2/shared_preferences/user_simple_preferences.dart';
import 'package:elias_weam_food2/view/screens/launch/driver_app/driver_get_started.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class DriverSplashScreen extends StatefulWidget {
  @override
  State<DriverSplashScreen> createState() => _DriverSplashScreenState();
}

class _DriverSplashScreenState extends State<DriverSplashScreen> {
  @override
  void initState() {
    super.initState();
    splashScreenHandler();
    getTheme();
    getLanguage();
  }

  void splashScreenHandler() {
    Timer(
      Duration(seconds: 3),
      () => Get.offAll(
        () => DriverGetStarted(),
        transition: Transition.fadeIn,
      ),
    );
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
