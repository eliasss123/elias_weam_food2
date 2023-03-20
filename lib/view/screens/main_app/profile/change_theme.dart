import 'package:elias_weam_food2/constant/color.dart';
import 'package:elias_weam_food2/constant/instance.dart';
import 'package:elias_weam_food2/view/widget/my_text.dart';
import 'package:elias_weam_food2/view/widget/simple_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:get/get.dart';

class ChangeTheme extends StatelessWidget {
  const ChangeTheme({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kSeoulColor6,
      appBar: simpleAppBar(
        bgColor: kSeoulColor6,
        title: 'Change theme',
        titleWeight: FontWeight.w700,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Obx(() {
              return Container(
                height: 51,
                padding: EdgeInsets.symmetric(
                  horizontal: 15,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: kPrimaryColor,
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: MyText(
                        text: themeController.isDarkTheme.value
                            ? 'Light Mode'
                            : 'Dark Mode',
                        size: 20,
                        color: kBlackColor,
                      ),
                    ),
                    FlutterSwitch(
                      width: 40.01,
                      height: 20.71,
                      value: themeController.isDarkTheme.value,
                      onToggle: (value) => themeController.onToggle(),
                      activeColor: kSecondaryColor,
                      inactiveColor: kInActiveSwitchColor,
                      borderRadius: 50.0,
                      toggleSize: 17.0,
                      padding: 1.5,
                      toggleColor: kPrimaryColor,
                      inactiveToggleColor: kPrimaryColor,
                    ),
                  ],
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
