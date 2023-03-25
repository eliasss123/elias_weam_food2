import 'package:elias_weam_food2/constant/color.dart';
import 'package:elias_weam_food2/constant/instance.dart';
import 'package:elias_weam_food2/generated/assets.dart';
import 'package:elias_weam_food2/view/widget/common_image_view.dart';
import 'package:elias_weam_food2/view/widget/custom_check_box_tile.dart';
import 'package:elias_weam_food2/view/widget/my_button.dart';
import 'package:elias_weam_food2/view/widget/my_text.dart';
import 'package:elias_weam_food2/view/widget/quantity_manager.dart';
import 'package:elias_weam_food2/view/widget/simple_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class MenuItemBottomSheet extends StatefulWidget {
  MenuItemBottomSheet({
    Key? key,
    required this.onAddToCartTap,
    this.buttonText,
  }) : super(key: key);

  final VoidCallback? onAddToCartTap;
  String? buttonText;

  @override
  State<MenuItemBottomSheet> createState() => _MenuItemBottomSheetState();
}

class _MenuItemBottomSheetState extends State<MenuItemBottomSheet> {
  bool isLiked = false;

  void onLikeTap() {
    setState(() {
      isLiked = !isLiked;
    });
  }

  @override
  Widget build(BuildContext context) {
    var platform = Theme.of(context).platform;
    return Obx(() {
      bool isDark = themeController.isDarkTheme.value;
      bool isEnglish = languageController.isEnglish.value;
      return SimpleBottomSheet(
        height: Get.height * 0.9,
        content: Stack(
          children: [
            ListView(
              shrinkWrap: true,
              padding: EdgeInsets.fromLTRB(20, 10, 20, 100),
              physics: BouncingScrollPhysics(),
              children: [
                CommonImageView(
                  height: 204,
                  radius: 16.0,
                  imagePath: Assets.imagesBurgerLarge,
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          MyText(
                            text: 'german_hamburger'.tr,
                            size: 20,
                            color: isDark ? kPrimaryColor : kBlackColor2,
                            weight: FontWeight.w700,
                          ),
                          MyText(
                            paddingTop: 8,
                            text: 'pansi_restaurant'.tr,
                            size: 14,
                            weight: FontWeight.w500,
                            color: kTertiaryColor,
                          ),
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: onLikeTap,
                      child: Image.asset(
                        isLiked
                            ? Assets.imagesHeartFill
                            : Assets.imagesHeartEmpty,
                        height: 22,
                        color: kSecondaryColor,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    QuantityManager(
                      onLessTap: () {},
                      value: '1',
                      onMoreTap: () {},
                    ),
                    MyText(
                      paddingLeft: 15,
                      paddingRight: isEnglish ? 0 : 15,
                      text: '\$19.99',
                      size: 16,
                      weight: FontWeight.w500,
                      color: kSecondaryColor,
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Image.asset(
                  Assets.imagesDivider,
                  width: Get.width,
                  color: isDark ? kDarkBorderColor2 : null,
                ),
                SizedBox(
                  height: 30,
                ),
                customHeading('sauce'.tr),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: isDark ? kDarkInputBgColor2 : Colors.transparent,
                    border: Border.all(
                      color: isDark ? kDarkBorderColor2 : kBorderColor3,
                      width: 1.0,
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      CustomCheckBoxTile(
                        title: 'teriyaki'.tr,
                        trailingText: '+\$0',
                        isChecked: true,
                        onTap: () {},
                      ),
                      Image.asset(
                        Assets.imagesDivider,
                        width: Get.width,
                        color: isDark ? kDarkBorderColor2 : null,
                      ),
                      CustomCheckBoxTile(
                        title: 'yakiniku'.tr,
                        trailingText: '+\$0',
                        isChecked: false,
                        onTap: () {},
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                customHeading('add_a_topping'.tr),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: isDark ? kDarkInputBgColor2 : Colors.transparent,
                    border: Border.all(
                      color: isDark ? kDarkBorderColor2 : kBorderColor3,
                      width: 1.0,
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      CustomCheckBoxTile(
                        title: 'omelet'.tr,
                        trailingText: '+\$2',
                        isChecked: false,
                        onTap: () {},
                      ),
                      Image.asset(
                        Assets.imagesDivider,
                        width: Get.width,
                        color: isDark ? kDarkBorderColor2 : null,
                      ),
                      CustomCheckBoxTile(
                        title: 'sausage'.tr,
                        trailingText: '+\$3',
                        isChecked: true,
                        onTap: () {},
                      ),
                      Image.asset(
                        Assets.imagesDivider,
                        width: Get.width,
                        color: isDark ? kDarkBorderColor2 : null,
                      ),
                      CustomCheckBoxTile(
                        title: 'cheese'.tr,
                        trailingText: '+\$5',
                        isChecked: true,
                        onTap: () {},
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: platform == TargetPlatform.iOS ? 23 : 20,
                ),
                child: MyButton(
                  height: 54,
                  buttonText: widget.buttonText ?? '${'add_to_cart'.tr} (\$41.99)',
                  onTap: widget.onAddToCartTap!,
                ),
              ),
            ),
          ],
        ),
      );
    });
  }

  Widget customHeading(String heading) {
    return Obx(() {
      return MyText(
        text: heading,
        size: 18,
        weight: FontWeight.w500,
        paddingBottom: 12,
        color: themeController.isDarkTheme.value ? kPrimaryColor : kBlackColor2,
      );
    });
  }
}
