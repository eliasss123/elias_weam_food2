import 'package:elias_weam_food2/constant/instance.dart';
import 'package:elias_weam_food2/view/screens/main_app/bottom_nav_bar/bottom_nav_bar.dart';
import 'package:elias_weam_food2/view/widget/congrats.dart';
import 'package:elias_weam_food2/view/widget/headings.dart';
import 'package:elias_weam_food2/view/widget/my_button.dart';
import 'package:elias_weam_food2/view/widget/simple_app_bar.dart';
import 'package:elias_weam_food2/view/widget/simple_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Name extends StatefulWidget {
  @override
  State<Name> createState() => _NameState();
}

class _NameState extends State<Name> {
  bool isActive = false;
  TextEditingController fNameCon = TextEditingController();
  TextEditingController lNameCon = TextEditingController();

  void onChanged() {
    if (fNameCon.text.isNotEmpty && lNameCon.text.isNotEmpty) {
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
            authHeading('enter_your_name'.tr),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 28,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SimpleTextField(
                    controller: fNameCon,
                    onChanged: (value) => onChanged(),
                    hintText: 'first_name'.tr,
                  ),
                  SimpleTextField(
                    controller: lNameCon,
                    onChanged: (value) => onChanged(),
                    hintText: 'last_name'.tr,
                    marginBottom: 45,
                  ),
                  MyButton(
                    isActive: isActive,
                    buttonText: 'next'.tr,
                    onTap: () => Get.to(
                      () => Congrats(
                        heading: 'congratulations'.tr,
                        congratsMsg: 'your_account_is_complete'.tr,
                        onContinue: () => Get.offAll(() => BottomNavBar()),
                        buttonText: 'done'.tr,
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
