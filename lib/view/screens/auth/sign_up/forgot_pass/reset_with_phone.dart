import 'package:elias_weam_food2/constant/instance.dart';
import 'package:elias_weam_food2/generated/assets.dart';
import 'package:elias_weam_food2/view/screens/auth/sign_up/forgot_pass/verification_code_for_phone.dart';
import 'package:elias_weam_food2/view/widget/filled_text_field.dart';
import 'package:elias_weam_food2/view/widget/headings.dart';
import 'package:elias_weam_food2/view/widget/my_button.dart';
import 'package:elias_weam_food2/view/widget/simple_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResetWithPhone extends StatefulWidget {
  @override
  State<ResetWithPhone> createState() => _ResetWithPhoneState();
}

class _ResetWithPhoneState extends State<ResetWithPhone> {
  bool isActive = false;

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
            authHeading('reset_password'.tr),
            SizedBox(
              height: 8,
            ),
            authSubHeading(
              'we_will_send_verification_code_to_phone'.tr,
            ),
            SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  FilledTextField(
                    havePrefix: true,
                    prefix: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          Assets.imagesPhone,
                          height: 17.08,
                        ),
                      ],
                    ),
                    labelText: 'phone_number'.tr,
                    hintText: '(+1) 234 567 890',
                    onChanged: (value) {
                      setState(() {
                        value.isNotEmpty ? isActive = true : isActive = false;
                      });
                    },
                    marginBottom: 25.0,
                  ),
                  MyButton(
                    isActive: isActive,
                    buttonText: 'send'.tr,
                    onTap: () => Get.to(() => VerifyCodeForPhone()),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    });
  }
}
