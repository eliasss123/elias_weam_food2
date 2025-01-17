import 'package:elias_weam_food2/constant/instance.dart';
import 'package:elias_weam_food2/view/screens/auth/sign_up/forgot_pass/verify_code_for_email.dart';
import 'package:elias_weam_food2/view/widget/filled_text_field.dart';
import 'package:elias_weam_food2/view/widget/headings.dart';
import 'package:elias_weam_food2/view/widget/my_button.dart';
import 'package:elias_weam_food2/view/widget/simple_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResetWithEmail extends StatefulWidget {
  @override
  State<ResetWithEmail> createState() => _ResetWithEmailState();
}

class _ResetWithEmailState extends State<ResetWithEmail> {
  bool isActive = false;
  TextEditingController emailCon = TextEditingController();
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
              'we_will_send_verification_code_to_email'.tr,
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
                    controller: emailCon,
                    labelText: 'email'.tr,
                    hintText: 'louisiana12232@email.com',
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
                    onTap: () => Get.to(() => VerifyCodeForEmail(email: this.emailCon.text,)),
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
