import 'package:elias_weam_food2/constant/color.dart';
import 'package:elias_weam_food2/constant/instance.dart';
import 'package:elias_weam_food2/generated/assets.dart';
import 'package:elias_weam_food2/view/screens/main_app/profile/profile_screens/my_location/set_location_by_pin.dart';
import 'package:elias_weam_food2/view/widget/my_button.dart';
import 'package:elias_weam_food2/view/widget/my_text.dart';
import 'package:elias_weam_food2/view/widget/simple_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyLocation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      bool isDark = themeController.isDarkTheme.value;
      return Scaffold(
        appBar: simpleAppBar(
          title: 'my_location'.tr,
          titleWeight: FontWeight.w700,
          isDark: isDark,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(
                  height: 60,
                ),
                Center(
                  child: Image.asset(
                    Assets.imagesLocationEmptyState,
                    height: 200,
                  ),
                ),
                MyText(
                  paddingTop: 40,
                  text: 'set_your_address_to_start_exploring'.tr,
                  size: 14,
                  weight: FontWeight.w500,
                  color: kGreyColor12,
                  align: TextAlign.center,
                  paddingBottom: 80,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: MyButton(
                    buttonText: 'set_your_address'.tr,
                    onTap: () =>
                        Get.to(
                              () => SetLocationByPin(),
                        ),
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    });
  }
}
