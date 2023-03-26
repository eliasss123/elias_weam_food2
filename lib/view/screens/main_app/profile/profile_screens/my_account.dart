import 'package:elias_weam_food2/constant/color.dart';
import 'package:elias_weam_food2/constant/instance.dart';
import 'package:elias_weam_food2/generated/assets.dart';
import 'package:elias_weam_food2/main.dart';
import 'package:elias_weam_food2/view/widget/common_image_view.dart';
import 'package:elias_weam_food2/view/widget/my_button.dart';
import 'package:elias_weam_food2/view/widget/my_text.dart';
import 'package:elias_weam_food2/view/widget/profile_filled_text_field.dart';
import 'package:elias_weam_food2/view/widget/simple_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyAccount extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var platform = Theme.of(context).platform;
    bool isIos = platform == TargetPlatform.iOS;
    return Obx(() {
      bool isDark = themeController.isDarkTheme.value;
      bool isEnglish = languageController.isEnglish.value;
      return Scaffold(
        body: Container(
          height: Get.height,
          width: Get.width,
          padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
          decoration: BoxDecoration(
            color: isDark ? kDarkPrimaryColor : kSeoulColor6,
            image: DecorationImage(
              image: AssetImage(
                Assets.imagesProfileBgEffect,
              ),
              alignment: Alignment.topCenter,
              fit: BoxFit.fitWidth,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              simpleAppBar(
                bgColor: isDark ? Colors.transparent : Colors.transparent,
                isDark: isDark,
                title: 'my_account'.tr,
                titleWeight: FontWeight.w700,
              ),
              Center(
                child: CommonImageView(
                  height: 100,
                  width: 100,
                  url: dummyImg1,
                  radius: 100.0,
                ),
              ),
              MyText(
                paddingTop: 3,
                text: 'change_picture'.tr,
                size: 16,
                weight: FontWeight.w700,
                align: TextAlign.center,
                paddingBottom: 50,
                color: isDark ? kPrimaryColor : kBlackColor2,
              ),
              Expanded(
                child: ListView(
                  shrinkWrap: true,
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  physics: BouncingScrollPhysics(),
                  children: [
                    SizedBox(
                      height: isIos ? 35 : 15,
                    ),
                    ProfileFilledTextField(
                      labelText: 'name'.tr,
                      hintText: '',
                    ),
                    ProfileFilledTextField(
                      labelText: 'email'.tr,
                      hintText: '',
                    ),
                    ProfileFilledTextField(
                      labelText: 'phone_number'.tr,
                      havePrefix: true,
                      prefix: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            Assets.imagesPhone,
                            height: 17,
                          ),
                        ],
                      ),
                      hintText: '',
                    ),
                    ProfileFilledTextField(
                      isObSecure: true,
                      labelText: 'password'.tr,
                      hintText: '',
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: 45,
                  right: 45,
                  bottom: isIos ? 25 : 15,
                  top: 15,
                ),
                child: MyButton(
                  buttonText: 'save_changes'.tr,
                  onTap: () {},
                ),
              ),
            ],
          ),
        ),
      );
    });
  }

  Material profileTiles({
    String? icon,
    String? title,
    VoidCallback? onTap,
  }) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 10,
          ),
          child: Row(
            children: [
              Image.asset(
                icon!,
                height: 40,
              ),
              Expanded(
                child: MyText(
                  paddingLeft: 15,
                  text: title,
                  size: 16,
                  weight: FontWeight.w500,
                ),
              ),
              Image.asset(
                Assets.imagesArrowRight,
                height: 24,
                color: kGreyColor12,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
