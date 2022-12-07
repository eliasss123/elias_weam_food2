import 'package:elias_weam_food2/constant/color.dart';
import 'package:elias_weam_food2/generated/assets.dart';
import 'package:elias_weam_food2/view/screens/auth/sign_up/forgot_pass/forgot_pass.dart';
import 'package:elias_weam_food2/view/screens/auth/sign_up/sign_up.dart';
import 'package:elias_weam_food2/view/screens/merchant_app/merchant_bottom_nav/merchant_bottom_nav.dart';
import 'package:elias_weam_food2/view/widget/my_button.dart';
import 'package:elias_weam_food2/view/widget/my_text.dart';
import 'package:elias_weam_food2/view/widget/prefix_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MerchantLogin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
            image: AssetImage(Assets.imagesLoginBg),
            alignment: Alignment.topRight,
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
                        text: 'Log In',
                        size: 23,
                        weight: FontWeight.w700,
                        paddingBottom: 8,
                      ),
                      MyText(
                        text: 'Welcome back to Vai',
                        color: Colors.black.withOpacity(0.71),
                        paddingBottom: 30.0,
                      ),
                      PrefixTextField(
                        hintText: 'Email',
                        prefixIcon: Assets.imagesEmailBorder,
                        prefixIconSize: 17,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      PrefixTextField(
                        isObSecure: true,
                        hintText: 'Password',
                        prefixIcon: Assets.imagesLock,
                        prefixIconSize: 17,
                      ),
                      MyText(
                        paddingTop: 13,
                        paddingBottom: 50,
                        align: TextAlign.end,
                        text: 'Forgot password?',
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
                            buttonText: 'Log In',
                            onTap: () => Get.to(() => MerchantBottomNav()),
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
                  text: 'Don’t have an account yet?',
                  color: kBlackColor2.withOpacity(0.71),
                ),
                MyText(
                  onTap: () => Get.offAll(
                    () => Signup(),
                  ),
                  text: ' Sign Up',
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
  }
}