import 'package:elias_weam_food2/constant/color.dart';
import 'package:elias_weam_food2/view/screens/support/support.dart';
import 'package:elias_weam_food2/view/widget/my_button.dart';
import 'package:elias_weam_food2/view/widget/my_text.dart';
import 'package:elias_weam_food2/view/widget/simple_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:get/get.dart';

class DProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: simpleAppBar(title: ''),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: ListView(
              shrinkWrap: true,
              padding: EdgeInsets.all(20),
              physics: BouncingScrollPhysics(),
              children: [
                MyText(
                  text: 'profile'.tr,
                  size: 22,
                  weight: FontWeight.w700,
                  paddingBottom: 30,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          MyText(
                            text: 'full_name'.tr,
                            size: 16,
                            weight: FontWeight.w500,
                          ),
                          MyText(
                            text: 'Alex Balde',
                            size: 16,
                            weight: FontWeight.w500,
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 6),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            MyText(
                              text: 'phone_number'.tr,
                              size: 16,
                              weight: FontWeight.w500,
                            ),
                            MyText(
                              text: '+972501234567',
                              size: 16,
                              weight: FontWeight.w500,
                            ),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          MyText(
                            text: 'mail'.tr,
                            size: 16,
                            weight: FontWeight.w600,
                          ),
                          MyText(
                            text: 'Alex@gmail.com',
                            size: 16,
                            weight: FontWeight.w600,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    children: [
                      Expanded(
                        child: MyText(
                          text: 'status'.tr,
                          size: 20,
                          weight: FontWeight.w500,
                          color: kSecondaryColor,
                        ),
                      ),
                      FlutterSwitch(
                        width: 46.01,
                        height: 26.71,
                        value: false,
                        onToggle: (value) {},
                        activeColor: kSecondaryColor,
                        inactiveColor: kInActiveSwitchColor,
                        borderRadius: 50.0,
                        toggleSize: 22.0,
                        padding: 2.2,
                        showOnOff: false,
                        toggleColor: kPrimaryColor,
                        inactiveToggleColor: kPrimaryColor,
                      ),
                    ],
                  ),
                ),
                MyText(
                  paddingTop: 30,
                  paddingLeft: 10,
                  paddingBottom: 5,
                  text: 'gear'.tr,
                  size: 16,
                  weight: FontWeight.w500,
                  color: kBlackColor,
                ),
                Container(
                  height: 1,
                  color: kUnSelectedButtonColor,
                ),
                Column(
                  children: List.generate(
                    2,
                    (index) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          MyText(
                            paddingTop: 5,
                            paddingLeft: 10,
                            text: 'Summer T-shirt',
                            size: 16,
                          ),
                          MyText(
                            text: '3/7/2020',
                            size: 16,
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(45, 20, 45, 20),
            child: MyButton(
              buttonText: 'contact_support'.tr,
              onTap: () => Get.to(
                () => Support(
                  title: 'support'.tr,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
