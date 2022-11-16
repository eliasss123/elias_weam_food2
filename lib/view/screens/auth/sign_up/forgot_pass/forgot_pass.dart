import 'package:elias_weam_food2/constant/color.dart';
import 'package:elias_weam_food2/generated/assets.dart';
import 'package:elias_weam_food2/view/screens/auth/sign_up/forgot_pass/reset_with_email.dart';
import 'package:elias_weam_food2/view/screens/auth/sign_up/forgot_pass/reset_with_phone.dart';
import 'package:elias_weam_food2/view/widget/forgot_pass_tiles.dart';
import 'package:elias_weam_food2/view/widget/headings.dart';
import 'package:elias_weam_food2/view/widget/my_button.dart';
import 'package:elias_weam_food2/view/widget/my_text.dart';
import 'package:elias_weam_food2/view/widget/simple_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgotPass extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: simpleAppBar(),
      body: ListView(
        shrinkWrap: true,
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 10,
        ),
        children: [
          authHeading('Forgot Password'),
          SizedBox(
            height: 8,
          ),
          authSubHeading('Choose how you want to sign in:'),
          SizedBox(
            height: 40,
          ),
          ForgotPasswordTile(
            icon: Assets.imagesPhone,
            iconSize: 20.57,
            title: 'Phone Number',
            subTitle: 'Send to your phone number',
            onTap: () => Get.to(() => ResetWithPhone()),
          ),
          SizedBox(
            height: 20,
          ),
          ForgotPasswordTile(
            icon: Assets.imagesEmail,
            iconSize: 23,
            title: 'Email',
            subTitle: 'Send to your email',
            onTap: () => Get.to(() => ResetWithEmail()),
          ),
          SizedBox(
            height: 40,
          ),
          MyButton(
            buttonText: 'Continue',
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
