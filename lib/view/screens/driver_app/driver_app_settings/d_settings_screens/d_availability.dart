import 'package:elias_weam_food2/constant/color.dart';
import 'package:elias_weam_food2/constant/instance.dart';
import 'package:elias_weam_food2/view/widget/my_text.dart';
import 'package:elias_weam_food2/view/widget/simple_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:get/get.dart';

class SetAvailability extends StatefulWidget {
  @override
  State<SetAvailability> createState() => _SetAvailabilityState();
}

class _SetAvailabilityState extends State<SetAvailability> {
  bool isAvailable = false;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      bool isDark = themeController.isDarkTheme.value;
      return Scaffold(
        backgroundColor: isDark ? kDarkPrimaryColor : kSeoulColor6,
        appBar: simpleAppBar(
          bgColor: isDark ? kDarkPrimaryColor : kSeoulColor6,
          title: 'set_availability'.tr,
          titleWeight: FontWeight.w700,
          isDark: isDark,
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                height: 51,
                padding: EdgeInsets.symmetric(
                  horizontal: 15,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: isDark ? kDarkInputBgColor : kPrimaryColor,
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: MyText(
                        text: 'available'.tr,
                        size: 20,
                        color: isDark ? kPrimaryColor : kBlackColor,
                      ),
                    ),
                    FlutterSwitch(
                      width: 46.01,
                      height: 26.71,
                      value: isAvailable,
                      onToggle: (value) {
                        setState(() {
                          isAvailable = !isAvailable;
                        });
                      },
                      activeColor: kSecondaryColor,
                      inactiveColor: kInActiveSwitchColor,
                      borderRadius: 50.0,
                      toggleSize: 22.0,
                      padding: 2.2,
                      showOnOff: false,
                      toggleColor: isDark ? kDarkPrimaryColor : kPrimaryColor,
                      inactiveToggleColor: kPrimaryColor,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
