import 'dart:async';
import 'package:elias_weam_food2/constant/instance.dart';
import 'package:elias_weam_food2/controller/language_controller/language_controller.dart';
import 'package:elias_weam_food2/generated/assets.dart';
import 'package:elias_weam_food2/shared_preferences/user_simple_preferences.dart';
import 'package:elias_weam_food2/view/screens/launch/merchant_app/merchant_get_started.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class MerchantSplashScreen extends StatefulWidget {
  @override
  State<MerchantSplashScreen> createState() => _MerchantSplashScreenState();
}

class _MerchantSplashScreenState extends State<MerchantSplashScreen> {
  @override
  void initState() {
    super.initState();
    splashScreenHandler();
    getLanguage();
  }

  void splashScreenHandler() {
    Timer(
      Duration(seconds: 3),
      () => Get.offAll(
        () => MerchantGetStarted(),
        transition: Transition.fadeIn,
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Lottie.asset(
          Assets.imagesLightModeAnimatedLogo,
        ),
      ),
    );
  }
}
