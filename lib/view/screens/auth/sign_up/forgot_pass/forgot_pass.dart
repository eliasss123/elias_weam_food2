import 'package:elias_weam_food2/constant/instance.dart';
import 'package:elias_weam_food2/generated/assets.dart';
import 'package:elias_weam_food2/view/screens/auth/sign_up/forgot_pass/reset_with_email.dart';
import 'package:elias_weam_food2/view/screens/auth/sign_up/forgot_pass/reset_with_phone.dart';
import 'package:elias_weam_food2/view/widget/forgot_pass_tiles.dart';
import 'package:elias_weam_food2/view/widget/headings.dart';
import 'package:elias_weam_food2/view/widget/my_button.dart';
import 'package:elias_weam_food2/view/widget/simple_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgotPass extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      bool isDark = themeController.isDarkTheme.value;
      return Scaffold(
        appBar: simpleAppBar(
          isDark: isDark,
        ),
        body: ListView(
          shrinkWrap: true,
          physics: BouncingScrollPhysics(),
          padding: EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 10,
          ),
          children: [
            authHeading('forgot_password'.tr),
            SizedBox(
              height: 8,
            ),
            authSubHeading('choose_how_you_want_to_sign_in'.tr),
            SizedBox(
              height: 40,
            ),
            ForgotPasswordTile(
              icon: Assets.imagesPhone,
              iconSize: 20.57,
              title: 'phone_number'.tr,
              subTitle: 'send_to_your_phone_number'.tr,
              onTap: () => Get.to(() => ResetWithPhone()),
            ),
            SizedBox(
              height: 20,
            ),
            ForgotPasswordTile(
              icon: Assets.imagesEmail,
              iconSize: 23,
              title: 'email'.tr,
              subTitle: 'send_to_your_email'.tr,
              onTap: () => Get.to(() => ResetWithEmail()),
            ),
            SizedBox(
              height: 40,
            ),
            MyButton(
              buttonText: 'continue'.tr,
              onTap: () {},
            ),
          ],
        ),
      );
    });
  }
}
