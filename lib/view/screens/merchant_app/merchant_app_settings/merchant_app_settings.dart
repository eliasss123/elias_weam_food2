import 'package:elias_weam_food2/constant/color.dart';
import 'package:elias_weam_food2/generated/assets.dart';
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
                  text: 'Settings',
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
                  paddingLeft: 30,
                  text: 'Preferences',
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
                            paddingLeft: 15,
                            text: 'Language',
                            size: 15,
                            color: kBlackColor.withOpacity(0.80),
                          ),
                        ),
                        MyText(
                          paddingRight: 10,
                          text: 'English',
                          size: 15,
                          weight: FontWeight.w500,
                          color: kSecondaryColor,
                        ),
                        Image.asset(
                          Assets.imagesNextLight,
                          height: 19,
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
                            paddingLeft: 15,
                            text: 'Restaurant status',
                            size: 15,
                            color: kBlackColor.withOpacity(0.80),
                          ),
                        ),
                        MyText(
                          paddingRight: 10,
                          text: 'Open',
                          size: 15,
                          weight: FontWeight.w500,
                          color: kSecondaryColor,
                        ),
                        Image.asset(
                          Assets.imagesNextLight,
                          height: 19,
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
                  paddingLeft: 30,
                  text: 'Preferences',
                  size: 16,
                  weight: FontWeight.w700,
                  paddingBottom: 10,
                ),
                MerchantProfileTiles(
                  onTap: () {},
                  icon: Assets.imagesCreditCard,
                  title: 'Manage payment methods',
                ),
                MerchantProfileTiles(
                  onTap: () {},
                  icon: Assets.imagesWithdraw,
                  title: 'Withdraw your revenues',
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
                  paddingLeft: 30,
                  text: 'Account',
                  size: 16,
                  weight: FontWeight.w700,
                  paddingBottom: 10,
                ),
                MerchantProfileTiles(
                  onTap: () {},
                  icon: Assets.imagesFile,
                  title: 'Your Documents',
                ),
                MerchantProfileTiles(
                  onTap: () => Get.to(
                    () => Support(
                      title: 'Support',
                    ),
                  ),
                  icon: Assets.imagesSupport,
                  title: 'Support',
                ),
                MerchantProfileTiles(
                  onTap: () {},
                  icon: Assets.imagesHistory,
                  title: 'Statements & History',
                ),
                MerchantProfileTiles(
                  onTap: () => Get.to(() => EditMerchantApp()),
                  icon: Assets.imagesEdit,
                  title: 'Edit your menu',
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
                  onTap: () {},
                  icon: Assets.imagesSignOut,
                  title: 'Sign Out',
                  titleColor: kBlackColor.withOpacity(0.45),
                ),
                MerchantProfileTiles(
                  onTap: () {},
                  icon: Assets.imagesDelete,
                  title: 'Delete my account',
                  titleColor: kBlackColor.withOpacity(0.45),
                ),
              ],
            ),
          ),
        ],
      ),
    );
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
                paddingLeft: 15,
                text: title,
                size: 15,
                color: titleColor ?? kBlackColor.withOpacity(0.80),
              ),
            ),
            Image.asset(
              Assets.imagesNextLight,
              height: 19,
            ),
          ],
        ),
      ),
    );
  }
}
