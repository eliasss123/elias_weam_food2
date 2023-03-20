import 'dart:async';
import 'dart:developer';
import 'package:elias_weam_food2/config/theme/dark_theme.dart';
import 'package:elias_weam_food2/config/theme/light_theme.dart';
import 'package:elias_weam_food2/constant/instance.dart';
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
  }

  void splashScreenHandler() {
    Timer(
      Duration(milliseconds: 2520),
      () => Get.offAll(
        () => OnBoarding(),
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
