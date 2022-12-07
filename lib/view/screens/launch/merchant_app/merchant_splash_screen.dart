import 'package:elias_weam_food2/generated/assets.dart';
import 'package:elias_weam_food2/view/screens/launch/merchant_app/merchant_get_started.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MerchantSplashScreen extends StatefulWidget {
  @override
  State<MerchantSplashScreen> createState() => _MerchantSplashScreenState();
}

class _MerchantSplashScreenState extends State<MerchantSplashScreen> {
  @override
  void initState() {
    super.initState();
    splashScreenHandler();
  }

  void splashScreenHandler() {
    Future.delayed(
      Duration(seconds: 2),
      () => Get.offAll(
        () => MerchantGetStarted(),
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
