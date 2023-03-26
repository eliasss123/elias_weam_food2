import 'package:elias_weam_food2/constant/color.dart';
import 'package:elias_weam_food2/constant/instance.dart';
import 'package:elias_weam_food2/generated/assets.dart';
import 'package:elias_weam_food2/utils/instances.dart';
import 'package:elias_weam_food2/view/screens/merchant_app/edit_merchant_app/change_category.dart';
import 'package:elias_weam_food2/view/screens/merchant_app/edit_merchant_app/update_menu_panel.dart';
import 'package:elias_weam_food2/view/widget/common_image_view.dart';
import 'package:elias_weam_food2/view/widget/delivery_fee_and_time.dart';
import 'package:elias_weam_food2/view/widget/edit_merchant_app_bar.dart';
import 'package:elias_weam_food2/view/widget/home_detail_information.dart';
import 'package:elias_weam_food2/view/widget/menu_item_card.dart';
import 'package:elias_weam_food2/view/widget/my_text.dart';
import 'package:elias_weam_food2/view/widget/simple_toggle_buttons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditMerchantApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      bool isEnglish = languageController.isEnglish.value;
      return Scaffold(
        backgroundColor: kSeoulColor3,
        body: SafeArea(
          child: NestedScrollView(
            physics: BouncingScrollPhysics(),
            headerSliverBuilder: (context, innerBoxIsScrolled) {
              return [
                EditMerchantAppBar(
                  imgUrl: Assets.imagesPicture5,
                  name: 'Pansi\nRestaurant',
                  tagLine: 'Sandwiches · Salad',
                  openingTime: '12',
                  closingTime: '11',
                  totalReviews: '122',
                  distance: '0.3',
                ),
              ];
            },
            body: ListView(
              shrinkWrap: true,
              padding: EdgeInsets.symmetric(vertical: 15),
              physics: BouncingScrollPhysics(),
              children: [
                DeliveryFeeAndTime(
                  fee: '1.50',
                  time: '36',
                ),
                SizedBox(
                  height: 15,
                ),
                SizedBox(
                  height: 65,
                  child: ListView.builder(
                    shrinkWrap: true,
                    padding: EdgeInsets.symmetric(
                      horizontal: 13,
                    ),
                    physics: BouncingScrollPhysics(),
                    itemCount: editMerchantAppController.menuItems.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      var value = editMerchantAppController.menuItems[index];
                      return Obx(
                        () {
                          return SimpleToggleButtons(
                            isDark: false,
                            paddingHorizontal: 20.0,
                            text: value,
                            isSelected: editMerchantAppController
                                    .menuItemsIndex.value ==
                                index,
                            onTap: () {
                              showDialog(
                                context: context,
                                builder: (_) {
                                  return changeCategory(context);
                                },
                              );
                            },
                          );
                        },
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: 250,
                  child: ListView.builder(
                    shrinkWrap: true,
                    padding: EdgeInsets.symmetric(
                      horizontal: 13,
                    ),
                    physics: BouncingScrollPhysics(),
                    itemCount: 5,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Align(
                        child: MenuItemCard(
                          itemImgUrl: index == 0
                              ? Assets.imagesBurger
                              : Assets.imagesPepperBeef,
                          itemName: 'German hamburger',
                          price: '14.99',
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (_) {
                                return updateMenuInPanel(context);
                              },
                            );
                          },
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  child: Image.asset(
                    Assets.imagesDivider,
                    width: Get.width,
                  ),
                ),
                Information(
                  info:
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Tortor orci sem at facilisis duis cras elit. At nibh ultricies diam orci volutpat, non facilisis. Habitasse diam eget lectus venenatis cras enim tellus.\n\nAmet posuere nulla sit laoreet et congue iaculis viverra. Non ultrices faucibus mauris leo.',
                  relatedImages: [
                    Assets.imagesSteak,
                    Assets.imagesBbq,
                    Assets.imagesFish,
                    Assets.imagesPizza,
                  ],
                ),
                SizedBox(
                  height: 35,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  child: Image.asset(
                    Assets.imagesDivider,
                    width: Get.width,
                  ),
                ),
                MyText(
                  paddingTop: 35,
                  paddingLeft: isEnglish ? 20 : 0,
                  paddingRight: isEnglish ? 0 : 20,
                  text: 'Address',
                  size: 16,
                  weight: FontWeight.w700,
                  paddingBottom: 25,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  child: Image.asset(
                    Assets.imagesHomeDetailMapView,
                    height: 288,
                  ),
                ),
                MyText(
                  paddingLeft: isEnglish ? 20 : 0,
                  paddingRight: isEnglish ? 0 : 20,
                  paddingTop: 25,
                  paddingBottom: 30,
                  text: 'King George St 17, Jerusalem',
                  color: kBlackColor.withOpacity(0.5),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}

class DeliveryFeeAndTime extends StatelessWidget {
  const DeliveryFeeAndTime({
    Key? key,
    required this.fee,
    required this.time,
  }) : super(key: key);
  final String fee, time;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 30,
      ),
      margin: EdgeInsets.symmetric(
        horizontal: 20,
      ),
      height: 84,
      decoration: BoxDecoration(
        color: kPrimaryColor,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: kBlackColor.withOpacity(0.02),
            offset: Offset(10, 10),
            blurRadius: 30,
            spreadRadius: 14,
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                MyText(
                  text: 'Delivery fee',
                  size: 13,
                  color: kBlackColor.withOpacity(0.44),
                ),
                MyText(
                  text: '\$$fee',
                  size: 15,
                  weight: FontWeight.w500,
                  color: kBlackColor,
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(
              horizontal: 30,
            ),
            height: 41,
            width: 1,
            color: kDividerColor,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                MyText(
                  text: 'Delivery time'.tr,
                  size: 13,
                  color: kBlackColor.withOpacity(0.44),
                ),
                MyText(
                  text: '$time min',
                  size: 15,
                  weight: FontWeight.w500,
                  color: kBlackColor,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Information extends StatelessWidget {
  const Information({
    Key? key,
    required this.info,
    required this.relatedImages,
  }) : super(key: key);

  final String info;
  final List<String> relatedImages;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        MyText(
          text: 'Information',
          size: 16,
          weight: FontWeight.w700,
          paddingTop: 35,
          paddingLeft: 20,
          paddingRight: 20,
          paddingBottom: 20,
        ),
        MyText(
          text: info,
          color: kBlackColor.withOpacity(0.5),
          height: 1.8,
          paddingRight: 20,
          paddingLeft: 20,
          paddingBottom: 25,
        ),
        SizedBox(
          height: 92,
          child: ListView.builder(
            shrinkWrap: true,
            physics: BouncingScrollPhysics(),
            padding: EdgeInsets.symmetric(
              horizontal: 13,
            ),
            scrollDirection: Axis.horizontal,
            itemCount: relatedImages.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 7,
                ),
                child: CommonImageView(
                  height: 92,
                  width: 92,
                  imagePath: relatedImages[index],
                  radius: 12.0,
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
