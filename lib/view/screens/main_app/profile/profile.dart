import 'package:elias_weam_food2/constant/color.dart';
import 'package:elias_weam_food2/constant/instance.dart';
import 'package:elias_weam_food2/generated/assets.dart';
import 'package:elias_weam_food2/main.dart';
import 'package:elias_weam_food2/view/screens/launch/main_app/splash_screen.dart';
import 'package:elias_weam_food2/view/screens/main_app/cart_and_checkout/recent_orders/recent_orders.dart';
import 'package:elias_weam_food2/view/screens/main_app/profile/change_theme.dart';
import 'package:elias_weam_food2/view/screens/main_app/profile/profile_screens/help_center.dart';
import 'package:elias_weam_food2/view/screens/main_app/profile/profile_screens/languages.dart';
import 'package:elias_weam_food2/view/screens/main_app/profile/profile_screens/my_account.dart';
import 'package:elias_weam_food2/view/screens/main_app/profile/profile_screens/my_favorites.dart';
import 'package:elias_weam_food2/view/screens/main_app/profile/profile_screens/my_location/my_location.dart';
import 'package:elias_weam_food2/view/screens/main_app/profile/profile_screens/payment_method/payment_method.dart';
import 'package:elias_weam_food2/view/widget/common_image_view.dart';
import 'package:elias_weam_food2/view/widget/my_text.dart';
import 'package:elias_weam_food2/view/widget/profile_tiles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Profile extends StatelessWidget {
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
          padding: EdgeInsets.fromLTRB(0, 45, 0, 0),
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
              GestureDetector(
                onTap: () => Get.offAll(() => SplashScreen()),
                child: Wrap(
                  spacing: 7,
                  alignment: WrapAlignment.end,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    RotatedBox(
                      quarterTurns: isEnglish ? 0 : 2,
                      child: Image.asset(
                        Assets.imagesLogout,
                        height: 15,
                        color: isDark ? kPrimaryColor : kBlackColor2,
                      ),
                    ),
                    MyText(
                      text: 'logout'.tr,
                      size: 16,
                      paddingLeft: isEnglish ? 0 : 20,
                      paddingRight: isEnglish ? 20 : 0,
                      color: isDark ? kPrimaryColor : kBlackColor2,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
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
                paddingTop: 8,
                text: 'Adam lenken',
                size: 21,
                weight: FontWeight.w700,
                align: TextAlign.center,
                color: isDark ? kPrimaryColor : kBlackColor2,
                paddingBottom: isIos ? 95 : 50,
              ),
              Expanded(
                child: ListView(
                  shrinkWrap: true,
                  padding: EdgeInsets.zero,
                  physics: BouncingScrollPhysics(),
                  children: [
                    profileTiles(
                      icon: isDark
                          ? Assets.imagesAccountDark
                          : Assets.imagesMyAccount,
                      title: 'my_account'.tr,
                      onTap: () => Get.to(
                        () => MyAccount(),
                      ),
                    ),
                    profileTiles(
                      icon: isDark
                          ? Assets.imagesLocationDark
                          : Assets.imagesMyLocationProfile,
                      title: 'my_location'.tr,
                      onTap: () => Get.to(
                        () => MyLocation(),
                      ),
                    ),
                    profileTiles(
                      icon: isDark
                          ? Assets.imagesFavoriteDark
                          : Assets.imagesMyFavorites,
                      title: 'your_favorites'.tr,
                      onTap: () => Get.to(
                        () => MyFavorites(),
                      ),
                    ),
                    profileTiles(
                      icon: isDark
                          ? Assets.imagesOrderHistoryDark
                          : Assets.imagesMyOrderHistory,
                      title: 'order_history'.tr,
                      onTap: () => Get.to(
                        () => RecentOrders(),
                      ),
                    ),
                    profileTiles(
                      icon: isDark
                          ? Assets.imagesPaymentMethodDark
                          : Assets.imagesMyPaymentMethods,
                      title: 'payment_methods'.tr,
                      onTap: () => Get.to(
                        () => PaymentMethod(),
                      ),
                    ),
                    profileTiles(
                      icon: isDark
                          ? Assets.imagesLanguageDark
                          : Assets.imagesMyLanguages,
                      title: 'language'.tr,
                      onTap: () => Get.to(
                        () => Languages(),
                      ),
                    ),
                    profileTiles(
                      icon:
                          isDark ? Assets.imagesThemeIcon : Assets.imagesTheme,
                      title: 'change_theme'.tr,
                      onTap: () => Get.to(
                        () => ChangeTheme(),
                      ),
                    ),
                    profileTiles(
                      icon: isDark
                          ? Assets.imagesDeliverWithVaiDark
                          : Assets.imagesDeliverWithVai,
                      title: 'deliver_with_“vai”'.tr,
                      onTap: () {},
                    ),
                    profileTiles(
                      icon: isDark
                          ? Assets.imagesHelpIcon
                          : Assets.imagesVaiHelpCenter,
                      title: 'help_center'.tr,
                      onTap: () => Get.to(
                        () => HelpCenter(),
                      ),
                    ),
                    SizedBox(
                      height: 15,
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
