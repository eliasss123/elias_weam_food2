import 'package:elias_weam_food2/constant/color.dart';
import 'package:elias_weam_food2/constant/instance.dart';
import 'package:elias_weam_food2/generated/assets.dart';
import 'package:elias_weam_food2/view/screens/driver_app/driver_login.dart';
import 'package:elias_weam_food2/view/widget/my_button.dart';
import 'package:elias_weam_food2/view/widget/my_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DriverGetStarted extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      bool isDark = themeController.isDarkTheme.value;
      bool isEnglish = languageController.isEnglish.value;
      return Scaffold(
        body: Container(
          height: Get.height,
          width: Get.width,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                Assets.imagesGetStartedBg,
              ),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: 60,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Center(
                    child: Image.asset(
                      Assets.imagesVaiGetStarted,
                      height: 79.8,
                      color: isDark ? kDarkPrimaryColor : null,
                    ),
                  ),
                  MyText(
                    paddingTop: 60,
                    paddingLeft: 35,
                    paddingRight: 35,
                    paddingBottom: 50,
                    text:
                        'Enim augue aliquam maecenas cursus nisi, vitae. Congue et blandit amet.',
                    size: 16,
                    letterSpacing: 0.0,
                    color: isDark ? kDarkPrimaryColor : kPrimaryColor,
                    height: 1.8,
                    align: TextAlign.center,
                  ),
                  Center(
                    child: SizedBox(
                      width: 207,
                      child: MyButton(
                        textColor: isDark ? kDarkPrimaryColor : kPrimaryColor,
                        height: 52,
                        textSize: 16,
                        buttonText: 'login'.tr,
                        onTap: () => Get.to(() => DriverLogin()),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: Container(
                      width: 207,
                      height: 51,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                          width: 1.0,
                          color: isDark ? kDarkPrimaryColor : kPrimaryColor,
                        ),
                      ),
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: () {},
                          splashColor: isDark
                              ? kDarkPrimaryColor.withOpacity(0.1)
                              : kPrimaryColor.withOpacity(0.1),
                          highlightColor: isDark
                              ? kDarkPrimaryColor.withOpacity(0.1)
                              : kPrimaryColor.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(16),
                          child: Center(
                            child: MyText(
                              text: 'sign_Up'.tr,
                              size: 16,
                              weight: FontWeight.w500,
                              color: isDark ? kDarkPrimaryColor : kPrimaryColor,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    margin: EdgeInsets.only(
                      bottom: 40,
                      right: isEnglish ? 40 : 0,
                      left: isEnglish ? 0 : 40,
                    ),
                    height: 51,
                    width: 51,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: isDark
                          ? kDarkPrimaryColor.withOpacity(0.70)
                          : kPrimaryColor,
                    ),
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: () => Get.to(() => DriverLogin()),
                        splashColor: kSecondaryColor.withOpacity(0.05),
                        highlightColor: kSecondaryColor.withOpacity(0.05),
                        borderRadius: BorderRadius.circular(100),
                        child: Center(
                          child: RotatedBox(
                            quarterTurns: isEnglish ? 0 : 2,
                            child: Image.asset(
                              Assets.imagesArrowRightNormal,
                              height: 19,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    });
  }
}
