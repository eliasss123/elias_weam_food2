import 'package:elias_weam_food2/constant/color.dart';
import 'package:elias_weam_food2/generated/assets.dart';
import 'package:elias_weam_food2/view/screens/auth/login.dart';
import 'package:elias_weam_food2/view/screens/auth/sign_up/signup_with_email/signup_with_email.dart';
import 'package:elias_weam_food2/view/screens/auth/sign_up/signup_with_phone/verify_otp.dart';
import 'package:elias_weam_food2/view/widget/my_button.dart';
import 'package:elias_weam_food2/view/widget/my_text.dart';
import 'package:elias_weam_food2/view/widget/prefix_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Signup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
                  paddingTop: 20,
                  align: TextAlign.end,
                  text: 'Skip',
                  weight: FontWeight.w500,
                  color: kGreyColor,
                ),
                MyText(
                  text: 'Sign Up',
                  size: 23,
                  weight: FontWeight.w700,
                  paddingBottom: 8,
                ),
                MyText(
                  text: 'Order to your location in one click!',
                  color: kBlackColor2.withOpacity(0.71),
                  paddingBottom: 30,
                ),
                PrefixTextField(
                  hintText: 'Your phone number',
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
                          color: kDisableColor,
                        ),
                      ),
                      MyText(
                        paddingLeft: 10,
                        paddingRight: 10,
                        text: 'or',
                        size: 14,
                        color: kDarkGreyColor2,
                      ),
                      Expanded(
                        child: Container(
                          height: 1,
                          color: kDisableColor,
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SocialLogin(
                      icon: Assets.imagesApple,
                      iconSize: 25,
                      onTap: () {},
                    ),
                    SizedBox(
                      width: 13,
                    ),
                    SocialLogin(
                      icon: Assets.imagesGoogle,
                      iconSize: 22,
                      onTap: () {},
                    ),
                    SizedBox(
                      width: 13,
                    ),
                    SocialLogin(
                      icon: Assets.imagesFacebook,
                      iconSize: 25,
                      onTap: () {},
                    ),
                  ],
                ),
                MyText(
                  onTap: () => Get.to(() => SignupWithEmail()),
                  paddingTop: 20,
                  text: 'I don’t have social media',
                  weight: FontWeight.w500,
                  color: kSecondaryColor,
                  align: TextAlign.end,
                  paddingBottom: 50,
                ),
                Center(
                  child: SizedBox(
                    width: 213,
                    child: MyButton(
                      height: 52,
                      buttonText: 'Sign Up',
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
            height: 30,
          ),
          Wrap(
            alignment: WrapAlignment.center,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              MyText(
                text: 'Already have an account?',
                color: kBlackColor2.withOpacity(0.71),
              ),
              MyText(
                onTap: () => Get.to(
                  () => Login(),
                ),
                text: ' Sign In',
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
  }
}

class SocialLogin extends StatelessWidget {
  const SocialLogin({
    Key? key,
    required this.onTap,
    required this.icon,
    required this.iconSize,
  }) : super(key: key);

  final VoidCallback onTap;
  final String icon;
  final double iconSize;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 51,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          border: Border.all(
            width: 1.0,
            color: kBlackColor.withOpacity(0.10),
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
