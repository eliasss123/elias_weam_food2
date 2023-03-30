import 'package:elias_weam_food2/constant/color.dart';
import 'package:elias_weam_food2/constant/instance.dart';
import 'package:elias_weam_food2/generated/assets.dart';
import 'package:elias_weam_food2/view/screens/auth/login.dart';
import 'package:elias_weam_food2/view/screens/auth/sign_up/signup_with_email/signup_with_email.dart';
import 'package:elias_weam_food2/view/screens/auth/sign_up/signup_with_phone/verify_otp.dart';
import 'package:elias_weam_food2/view/screens/main_app/bottom_nav_bar/bottom_nav_bar.dart';
import 'package:elias_weam_food2/view/widget/my_button.dart';
import 'package:elias_weam_food2/view/widget/my_text.dart';
import 'package:elias_weam_food2/view/widget/prefix_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Signup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      bool isDark = themeController.isDarkTheme.value;
      bool isEnglish = languageController.isEnglish.value;
      return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: EdgeInsets.only(
                top: 20,
              ),
              height: 270,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    Assets.imagesHeaderBg,
                  ),
                  fit: BoxFit.cover,
                ),
              ),
              child: Center(
                child: Image.asset(
                  Assets.imagesSignUpBg,
                  height: 219,
                ),
              ),
            ),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(
                  horizontal: 40,
                ),
                physics: BouncingScrollPhysics(),
                shrinkWrap: true,
                children: [
                  MyText(
                    onTap: () => Get.offAll(() => BottomNavBar()),
                    paddingTop: 20,
                    align: TextAlign.end,
                    text: 'skip'.tr,
                    weight: FontWeight.w500,
                    color: kGreyColor,
                  ),
                  MyText(
                    text: 'sign_up1'.tr,
                    size: 23,
                    weight: FontWeight.w700,
                    paddingBottom: 8,
                    color: isDark ? kPrimaryColor : kBlackColor2,
                  ),
                  MyText(
                    text: 'order_to_your_location_in_one_click'.tr,
                    color: isDark
                        ? kPrimaryColor.withOpacity(0.71)
                        : kBlackColor2.withOpacity(0.71),
                    paddingBottom: 30,
                  ),
                  PrefixTextField(
                    hintText: 'your_phone_number'.tr,
                    prefixIcon: Assets.imagesPhone,
                    prefixIconSize: 17,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: 1,
                            color: isDark
                                ? kPrimaryColor.withOpacity(0.16)
                                : kDisableColor,
                          ),
                        ),
                        MyText(
                          paddingLeft: 10,
                          paddingRight: 10,
                          text: 'or'.tr,
                          size: 14,
                          color: isDark ? kPrimaryColor : kDarkGreyColor2,
                        ),
                        Expanded(
                          child: Container(
                            height: 1,
                            color: isDark
                                ? kPrimaryColor.withOpacity(0.16)
                                : kDisableColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SocialLogin(
                        isDark: isDark,
                        icon: Assets.imagesApple,
                        iconSize: 25,
                        onTap: () {},
                      ),
                      SizedBox(
                        width: 13,
                      ),
                      SocialLogin(
                        isDark: isDark,
                        icon: Assets.imagesGoogle,
                        iconSize: 22,
                        onTap: () {},
                      ),
                      SizedBox(
                        width: 13,
                      ),
                      SocialLogin(
                        isDark: isDark,
                        icon: Assets.imagesFacebook,
                        iconSize: 25,
                        onTap: () {},
                      ),
                    ],
                  ),
                  MyText(
                    onTap: () => Get.to(() => SignupWithEmail()),
                    paddingTop: isEnglish ? 20 : 15,
                    text: 'i_don\'t_have_social_media'.tr,
                    weight: FontWeight.w500,
                    color: kSecondaryColor,
                    align: TextAlign.end,
                    paddingBottom: isEnglish ? 50 : 40,
                  ),
                  Center(
                    child: SizedBox(
                      width: 213,
                      child: MyButton(
                        height: 52,
                        buttonText: 'sign_up'.tr,
                        onTap: () => Get.to(
                          () => VerifyOtp(),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Wrap(
              alignment: WrapAlignment.center,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                MyText(
                  text: 'already_have_an_account'.tr,
                  color: isDark
                      ? kPrimaryColor.withOpacity(0.71)
                      : kBlackColor2.withOpacity(0.71),
                ),
                MyText(
                  onTap: () => Get.to(
                    () => Login(),
                  ),
                  text: ' ${'sign_in'.tr}',
                  weight: FontWeight.w500,
                  color: kSecondaryColor,
                ),
              ],
            ),
            SizedBox(
              height: 35,
            ),
          ],
        ),
      );
    });
  }
}

class SocialLogin extends StatelessWidget {
  const SocialLogin({
    Key? key,
    required this.onTap,
    required this.icon,
    required this.iconSize,
    required this.isDark,
  }) : super(key: key);

  final VoidCallback onTap;
  final String icon;
  final double iconSize;
  final bool isDark;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 51,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          border: Border.all(
            width: 1.0,
            color: isDark
                ? kDarkBorderColor.withOpacity(0.30)
                : kBlackColor.withOpacity(0.10),
          ),
        ),
        child: Center(
          child: Image.asset(
            icon,
            height: iconSize,
          ),
        ),
      ),
    );
  }
}
