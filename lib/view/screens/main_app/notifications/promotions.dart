import 'package:elias_weam_food2/constant/color.dart';
import 'package:elias_weam_food2/constant/instance.dart';
import 'package:elias_weam_food2/generated/assets.dart';
import 'package:elias_weam_food2/view/widget/my_text.dart';
import 'package:elias_weam_food2/view/widget/simple_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Promotions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      bool isDark = themeController.isDarkTheme.value;
      bool isEnglish = languageController.isEnglish.value;
      return Scaffold(
        appBar: simpleAppBar(
          title: 'promotions'.tr,
          titleWeight: FontWeight.w700,
          isDark: isDark,
        ),
        body: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 20,
          ),
          physics: BouncingScrollPhysics(),
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 25),
              height: isEnglish ? 200 : 220,
              width: Get.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                image: DecorationImage(
                  image: AssetImage(
                    Assets.imagesBanner,
                  ),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  MyText(
                    text: '50%_discount_on_all_desert'.tr,
                    color: kPrimaryColor,
                    size: 24,
                    weight: FontWeight.w700,
                  ),
                  MyText(
                    paddingTop: 7,
                    paddingBottom: 20,
                    text: 'grab_itu_now'.tr,
                    color: kSeoulColor2,
                    size: 14,
                    weight: FontWeight.w500,
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                      height: 36,
                      width: 121,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        color: kPrimaryColor,
                      ),
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: () {},
                          borderRadius: BorderRadius.circular(14),
                          child: Center(
                            child: MyText(
                              text: 'order_now'.tr,
                              size: 14,
                              weight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            MyText(
              paddingTop: 30,
              text: 'promo_heading'.tr,
              size: 18,
              weight: FontWeight.w600,
              paddingBottom: 20,
              color: isDark ? kPrimaryColor : kBlackColor2,
            ),
            MyText(
              text: 'promo_subHeading'.tr,
              size: 14,
              weight: FontWeight.w500,
              color: kGreyColor5,
            ),
          ],
        ),
      );
    });
  }
}
