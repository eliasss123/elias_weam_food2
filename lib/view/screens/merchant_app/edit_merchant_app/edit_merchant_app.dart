import 'package:elias_weam_food2/constant/color.dart';
import 'package:elias_weam_food2/generated/assets.dart';
import 'package:elias_weam_food2/utils/instances.dart';
import 'package:elias_weam_food2/view/screens/merchant_app/edit_merchant_app/change_category.dart';
import 'package:elias_weam_food2/view/screens/merchant_app/edit_merchant_app/update_menu_panel.dart';
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
                          isSelected:
                              editMerchantAppController.menuItemsIndex.value ==
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
                paddingLeft: 20,
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
                paddingLeft: 20,
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
  }
}


