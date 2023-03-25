import 'package:elias_weam_food2/constant/instance.dart';
import 'package:elias_weam_food2/view/widget/congrats.dart';
import 'package:elias_weam_food2/view/widget/headings.dart';
import 'package:elias_weam_food2/view/widget/my_button.dart';
import 'package:elias_weam_food2/view/widget/password_field.dart';
import 'package:elias_weam_food2/view/widget/simple_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateNewPass extends StatefulWidget {
  @override
  State<CreateNewPass> createState() => _CreateNewPassState();
}

class _CreateNewPassState extends State<CreateNewPass> {
  bool isActive = false;
  TextEditingController passCon = TextEditingController();
  TextEditingController cPassCon = TextEditingController();

  void onChanged() {
    if (passCon.text == cPassCon.text) {
      setState(() {
        isActive = true;
      });
    } else {
      setState(() {
        isActive = false;
      });
    }
  }

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
            authHeading('create_password'.tr),
            SizedBox(
              height: 8,
            ),
            authSubHeading(
              'your_password_must_be_at_least_8_characters'.tr,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 40,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  PasswordField(
                    labelText: 'enter_password'.tr,
                    hintText: 'password'.tr,
                    controller: passCon,
                    onChanged: (value) => onChanged(),
                    marginBottom: 18,
                  ),
                  PasswordField(
                    labelText: 'confirm_password'.tr,
                    hintText: 'password'.tr,
                    controller: cPassCon,
                    onChanged: (value) => onChanged(),
                    marginBottom: 40,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: MyButton(
                      isActive: isActive,
                      buttonText: 'next'.tr,
                      onTap: () => Get.to(
                        () => Congrats(
                          heading: 'password_changed'.tr,
                          congratsMsg: 'password_changed_successfully'.tr,
                          onContinue: () {},
                          buttonText: 'done'.tr,
                        ),
                      ),
                    ),
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
