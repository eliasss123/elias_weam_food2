import 'package:elias_weam_food2/constant/color.dart';
import 'package:elias_weam_food2/constant/instance.dart';
import 'package:elias_weam_food2/generated/assets.dart';
import 'package:elias_weam_food2/view/screens/auth/sign_up/forgot_pass/forgot_pass.dart';
import 'package:elias_weam_food2/view/screens/auth/sign_up/sign_up.dart';
import 'package:elias_weam_food2/view/screens/main_app/bottom_nav_bar/bottom_nav_bar.dart';
import 'package:elias_weam_food2/view/widget/my_button.dart';
import 'package:elias_weam_food2/view/widget/my_text.dart';
import 'package:elias_weam_food2/view/widget/prefix_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      bool isDark = themeController.isDarkTheme.value;
      return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          height: Get.height,
          width: Get.width,
          padding: EdgeInsets.symmetric(
            horizontal: 40,
          ),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(Assets.imagesLoginBgNew),
              alignment: Alignment.topRight,
              scale: 4.2,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(),
                    Row(
                      children: [
                        Image.asset(
                          Assets.imagesLogoHorizBlk,
                          height: 53.2,
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        MyText(
                          text: 'login'.tr.camelCase,
                          size: 23,
                          weight: FontWeight.w700,
                          paddingBottom: 8,
                          color: isDark ? kPrimaryColor : kBlackColor2,
                        ),
                        MyText(
                          text: 'welcome_back_to_vai'.tr,
                          color: isDark
                              ? kPrimaryColor.withOpacity(0.71)
                              : Colors.black.withOpacity(0.71),
                          paddingBottom: 30.0,
                        ),
                        PrefixTextField(
                          hintText: 'email'.tr,
                          prefixIcon: Assets.imagesEmailBorder,
                          prefixIconSize: 17,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        PrefixTextField(
                          isObSecure: true,
                          hintText: 'password'.tr,
                          prefixIcon: Assets.imagesLock,
                          prefixIconSize: 17,
                        ),
                        MyText(
                          paddingTop: 13,
                          paddingBottom: 50,
                          align: TextAlign.end,
                          text: 'forgot_password'.tr,
                          size: 14,
                          weight: FontWeight.w500,
                          color: kSecondaryColor,
                          onTap: () => Get.to(
                            () => ForgotPass(),
                          ),
                        ),
                        Center(
                          child: SizedBox(
                            width: 213,
                            child: MyButton(
                              height: 52,
                              buttonText: 'login'.tr.camelCase!,
                              onTap: () => Get.offAll(() => BottomNavBar()),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Wrap(
                alignment: WrapAlignment.center,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  MyText(
                    text: 'dont_have_an_account_yet'.tr,
                    color: isDark
                        ? kPrimaryColor.withOpacity(0.71)
                        : kBlackColor2.withOpacity(0.71),
                  ),
                  MyText(
                    onTap: () => Get.offAll(
                      () => Signup(),
                    ),
                    text: 'sign_Up'.tr,
                    weight: FontWeight.w500,
                    color: kSecondaryColor,
                  ),
                ],
              ),
              SizedBox(
                height: 80,
              ),
            ],
          ),
        ),
      );
    });
  }
}
