import 'package:elias_weam_food2/constant/color.dart';
import 'package:elias_weam_food2/constant/instance.dart';
import 'package:elias_weam_food2/generated/assets.dart';
import 'package:elias_weam_food2/view/screens/support/support.dart';
import 'package:elias_weam_food2/view/widget/common_image_view.dart';
import 'package:elias_weam_food2/view/widget/profile_tiles.dart';
import 'package:elias_weam_food2/view/widget/simple_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HelpCenter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      bool isDark = themeController.isDarkTheme.value;
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
                bgColor: Colors.transparent,
                title: 'help_center'.tr,
                titleWeight: FontWeight.w700,
                isDark: isDark,
              ),
              SizedBox(
                height: 10,
              ),
              Center(
                child: Image.asset(
                  height: 90,
                  width: 90,
                  Assets.imagesHelpCenterLocation,
                  color: isDark ? kPrimaryColor : null,
                ),
              ),
              SizedBox(
                height: 90,
              ),
              Expanded(
                child: ListView(
                  shrinkWrap: true,
                  padding: EdgeInsets.zero,
                  physics: BouncingScrollPhysics(),
                  children: [
                    profileTiles(
                      icon: isDark
                          ? Assets.imagesContactUsDark
                          : Assets.imagesContactUs,
                      title: 'contact_us'.tr,
                      onTap: () => Get.to(
                        () => Support(
                          title: 'contact_us'.tr,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    profileTiles(
                      icon: isDark
                          ? Assets.imagesVisitUsDark
                          : Assets.imagesVisitUs,
                      title: 'visit_us'.tr,
                      onTap: () {},
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    profileTiles(
                      icon: isDark
                          ? Assets.imagesDeliverWithVaiDark
                          : Assets.imagesDeliverWithVaiContact,
                      title: 'deliver_with_“vai”'.tr,
                      onTap: () {},
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    profileTiles(
                      icon: isDark ? Assets.imagesFaqDark : Assets.imagesFaq,
                      title: 'faqs'.tr,
                      onTap: () {},
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    profileTiles(
                      icon: isDark
                          ? Assets.imagesPrivacyDark
                          : Assets.imagesPrivacyPolicies,
                      title: 'privacy_polices'.tr,
                      onTap: () {},
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    profileTiles(
                      icon: isDark
                          ? Assets.imagesDeleteAccountDark
                          : Assets.imagesDeleteAcc,
                      title: 'delete_account'.tr,
                      onTap: () {},
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
