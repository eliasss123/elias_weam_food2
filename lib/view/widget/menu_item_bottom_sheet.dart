import 'package:elias_weam_food2/constant/color.dart';
import 'package:elias_weam_food2/constant/instance.dart';
import 'package:elias_weam_food2/constant/sizes_constant.dart';
import 'package:elias_weam_food2/generated/assets.dart';
import 'package:elias_weam_food2/view/screens/main_app/home/restaurant_details.dart';
import 'package:elias_weam_food2/view/widget/common_image_view.dart';
import 'package:elias_weam_food2/view/widget/custom_check_box_tile.dart';
import 'package:elias_weam_food2/view/widget/my_button.dart';
import 'package:elias_weam_food2/view/widget/my_text.dart';
import 'package:elias_weam_food2/view/widget/quantity_manager.dart';
import 'package:elias_weam_food2/view/widget/simple_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../api/api.dart';
import '../../utils/instances.dart';

// ignore: must_be_immutable
class MenuItemBottomSheet extends StatefulWidget {
  MenuItemBottomSheet({
    Key? key,
    required this.item,
    required this.onAddToCartTap,
    this.buttonText,

  }) : super(key: key);


  final Menuitem item;
  final VoidCallback? onAddToCartTap;
  String? buttonText;

  @override
  State<MenuItemBottomSheet> createState() => _MenuItemBottomSheetState();
}

class _MenuItemBottomSheetState extends State<MenuItemBottomSheet> {
  bool isLiked = false;
  late int quantity;

  @override
  void initState() {
    super.initState();
    quantity = this.widget.item.quantity; // Initialize the quantity
  }

  void onLessTap() {
    setState(() {
      if (quantity > 1) {
        quantity--;
        this.widget.item.quantity=quantity ;
      }
    });
  }

  void onMoreTap() {
    setState(() {
      quantity++;
      this.widget.item.quantity=quantity ;

    });
  }
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
                            text: this.widget.item.itemName,
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
                      value: this.quantity,
                      onLessTap: onLessTap


                      ,
                      onMoreTap:onMoreTap ,
                    ),
                    MyText(
                      paddingLeft: 15,
                      paddingRight: isEnglish ? 0 : 15,
                      text: '₪'+(this.quantity*this.widget.item.price).toString(),
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
                customHeading(this.widget.item.itemOptions[0].name),
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
                        title: this.widget.item.itemOptions[0].options[0].name,
                        trailingText: '+₪0',
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
                        trailingText: '+₪0',
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
                        trailingText: '+₪2',
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
                        trailingText: '+₪3',
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
                        trailingText: '+₪5',
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
                  vertical: platform == TargetPlatform.iOS ? IOS_DEFAULT_MARGIN : 20,
                ),
                child: MyButton(
                  height: 54,
                  buttonText: widget.buttonText ?? '${'add_to_cart'.tr} (₪41.99)',
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
