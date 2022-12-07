import 'package:elias_weam_food2/generated/assets.dart';
import 'package:elias_weam_food2/view/screens/launch/driver_app/driver_get_started.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DriverSplashScreen extends StatefulWidget {
  @override
  State<DriverSplashScreen> createState() => _DriverSplashScreenState();
}

class _DriverSplashScreenState extends State<DriverSplashScreen> {
  @override
  void initState() {
    super.initState();
    splashScreenHandler();
  }

  void splashScreenHandler() {
    Future.delayed(
      Duration(seconds: 2),
      () => Get.offAll(
        () => DriverGetStarted(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          Assets.imagesLogo,
          height: 200,
        ),
      ),
    );
  }
}
