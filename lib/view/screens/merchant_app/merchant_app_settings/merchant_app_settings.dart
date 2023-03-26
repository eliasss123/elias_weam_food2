import 'package:elias_weam_food2/constant/color.dart';
import 'package:elias_weam_food2/constant/instance.dart';
import 'package:elias_weam_food2/generated/assets.dart';
import 'package:elias_weam_food2/view/screens/launch/merchant_app/merchant_splash_screen.dart';
import 'package:elias_weam_food2/view/screens/merchant_app/edit_merchant_app/edit_merchant_app.dart';
import 'package:elias_weam_food2/view/screens/merchant_app/merchant_app_settings/m_settings_screens/m_languages.dart';
import 'package:elias_weam_food2/view/screens/merchant_app/merchant_app_settings/m_settings_screens/resutaurants_status.dart';
import 'package:elias_weam_food2/view/screens/support/support.dart';
import 'package:elias_weam_food2/view/widget/my_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MerchantAppSettings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      bool isEnglish = languageController.isEnglish.value;
      return Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: 55,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MyText(
                    text: 'settings'.tr,
                    size: 22,
                    weight: FontWeight.w700,
                  ),
                  Image.asset(
                    Assets.imagesBellBlack,
                    height: 23,
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView(
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                physics: BouncingScrollPhysics(),
                children: [
                  MyText(
                    paddingTop: 25,
                    paddingLeft: isEnglish ? 30 : 0,
                    paddingRight: isEnglish ? 0 : 30,
                    text: 'preferences'.tr,
                    size: 16,
                    weight: FontWeight.w700,
                    paddingBottom: 10,
                  ),
                  InkWell(
                    onTap: () => Get.to(() => MerchantLanguages()),
                    splashColor: kBlackColor.withOpacity(0.05),
                    highlightColor: kBlackColor.withOpacity(0.05),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 30,
                        vertical: 15,
                      ),
                      child: Row(
                        children: [
                          Image.asset(
                            Assets.imagesGlobe,
                            height: 18,
                          ),
                          Expanded(
                            child: MyText(
                              paddingLeft: isEnglish ? 15 : 0,
                              paddingRight: isEnglish ? 0 : 15,
                              text: 'language'.tr,
                              size: 15,
                              color: kBlackColor.withOpacity(0.80),
                            ),
                          ),
                          MyText(
                            paddingRight: isEnglish ? 10 : 0,
                            paddingLeft: isEnglish ? 0 : 10,
                            text: 'English',
                            size: 15,
                            weight: FontWeight.w500,
                            color: kSecondaryColor,
                          ),
                          RotatedBox(
                            quarterTurns: isEnglish ? 0 : 2,
                            child: Image.asset(
                              Assets.imagesNextLight,
                              height: 19,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () => Get.to(() => RestaurantsStatus()),
                    splashColor: kBlackColor.withOpacity(0.05),
                    highlightColor: kBlackColor.withOpacity(0.05),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 30,
                        vertical: 15,
                      ),
                      child: Row(
                        children: [
                          Image.asset(
                            Assets.imagesOpenStatus,
                            height: 18,
                          ),
                          Expanded(
                            child: MyText(
                              paddingLeft: isEnglish ? 15 : 0,
                              paddingRight: isEnglish ? 0 : 15,
                              text: 'restaurant_status'.tr,
                              size: 15,
                              color: kBlackColor.withOpacity(0.80),
                            ),
                          ),
                          MyText(
                            paddingRight: isEnglish ? 10 : 0,
                            paddingLeft: isEnglish ? 0 : 10,
                            text: 'open'.tr,
                            size: 15,
                            weight: FontWeight.w500,
                            color: kSecondaryColor,
                          ),
                          RotatedBox(
                            quarterTurns: isEnglish ? 0 : 2,
                            child: Image.asset(
                              Assets.imagesNextLight,
                              height: 19,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: 30,
                      vertical: 15,
                    ),
                    height: 1,
                    color: kDividerColor,
                  ),
                  MyText(
                    paddingTop: 15,
                    paddingLeft: isEnglish ? 30 : 0,
                    paddingRight: isEnglish ? 0 : 30,
                    text: 'preferences'.tr,
                    size: 16,
                    weight: FontWeight.w700,
                    paddingBottom: 10,
                  ),
                  MerchantProfileTiles(
                    onTap: () {},
                    icon: Assets.imagesCreditCard,
                    title: 'manage_payment_methods'.tr,
                  ),
                  MerchantProfileTiles(
                    onTap: () {},
                    icon: Assets.imagesWithdraw,
                    title: 'withdraw_your_revenues'.tr,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: 30,
                      vertical: 15,
                    ),
                    height: 1,
                    color: kDividerColor,
                  ),
                  MyText(
                    paddingTop: 15,
                    paddingLeft: isEnglish ? 30 : 0,
                    paddingRight: isEnglish ? 0 : 30,
                    text: 'account'.tr,
                    size: 16,
                    weight: FontWeight.w700,
                    paddingBottom: 10,
                  ),
                  MerchantProfileTiles(
                    onTap: () {},
                    icon: Assets.imagesFile,
                    title: 'your_documents'.tr,
                  ),
                  MerchantProfileTiles(
                    onTap: () => Get.to(
                      () => Support(
                        title: 'support'.tr,
                      ),
                    ),
                    icon: Assets.imagesSupport,
                    title: 'support'.tr,
                  ),
                  MerchantProfileTiles(
                    onTap: () {},
                    icon: Assets.imagesHistory,
                    title: 'statements_history'.tr,
                  ),
                  MerchantProfileTiles(
                    onTap: () => Get.to(() => EditMerchantApp()),
                    icon: Assets.imagesEdit,
                    title: 'edit_your_menu'.tr,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: 30,
                      vertical: 15,
                    ),
                    height: 1,
                    color: kDividerColor,
                  ),
                  MerchantProfileTiles(
                    onTap: () => Get.offAll(() => MerchantSplashScreen()),
                    icon: Assets.imagesSignOut,
                    title: 'sign_out'.tr,
                    titleColor: kBlackColor.withOpacity(0.45),
                  ),
                  MerchantProfileTiles(
                    onTap: () {},
                    icon: Assets.imagesDelete,
                    title: 'delete_my_account'.tr,
                    titleColor: kBlackColor.withOpacity(0.45),
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

class MerchantProfileTiles extends StatelessWidget {
  MerchantProfileTiles({
    required this.icon,
    required this.title,
    required this.onTap,
    this.titleColor,
  });

  final String icon, title;
  final VoidCallback onTap;
  Color? titleColor;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      bool isEnglish = languageController.isEnglish.value;
      return InkWell(
        onTap: onTap,
        splashColor: kBlackColor.withOpacity(0.05),
        highlightColor: kBlackColor.withOpacity(0.05),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 30,
            vertical: 15,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                icon,
                height: 18,
              ),
              Expanded(
                child: MyText(
                  paddingLeft: isEnglish ? 15 : 0,
                  paddingRight: isEnglish ? 0 : 15,
                  text: title,
                  size: 15,
                  color: titleColor ?? kBlackColor.withOpacity(0.80),
                ),
              ),
              RotatedBox(
                quarterTurns: isEnglish ? 0 : 2,
                child: Image.asset(
                  Assets.imagesNextLight,
                  height: 19,
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
