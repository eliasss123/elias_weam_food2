import 'dart:developer';
import 'package:elias_weam_food2/constant/color.dart';
import 'package:elias_weam_food2/generated/assets.dart';
import 'package:elias_weam_food2/utils/instances.dart';
import 'package:elias_weam_food2/view/widget/delivery_fee_and_time.dart';
import 'package:elias_weam_food2/view/widget/home_detail_app_bar.dart';
import 'package:elias_weam_food2/view/widget/home_detail_information.dart';
import 'package:elias_weam_food2/view/widget/menu_item_bottom_sheet.dart';
import 'package:elias_weam_food2/view/widget/menu_item_card.dart';
import 'package:elias_weam_food2/view/widget/my_button.dart';
import 'package:elias_weam_food2/view/widget/my_text.dart';
import 'package:elias_weam_food2/view/widget/out_of_range_dialog.dart';
import 'package:elias_weam_food2/view/widget/simple_toggle_buttons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RestaurantDetails extends StatefulWidget {
  RestaurantDetails({
    required this.isClosed,
    required this.isOutOfRange,
  });

  final bool isClosed, isOutOfRange;

  @override
  State<RestaurantDetails> createState() => _RestaurantDetailsState();
}

class _RestaurantDetailsState extends State<RestaurantDetails> {
  @override
  void initState() {
    super.initState();
    widget.isOutOfRange
        ? showNoteIfOutOfRange()
        : log(
            widget.isOutOfRange.toString(),
          );
  }

  void showNoteIfOutOfRange() {
    Future.delayed(
      Duration(
        seconds: 1,
      ),
      () => showDialog(
        context: context,
        builder: (_) {
          return OutOfRangeDialog();
        },
      ),
    );
  }

  bool showViewCartButton = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kSeoulColor3,
      body: SafeArea(
        child: Stack(
          children: [
            NestedScrollView(
              physics: BouncingScrollPhysics(),
              headerSliverBuilder: (context, innerBoxIsScrolled) {
                return [
                  HomeDetailAppBar(
                    imgUrl: Assets.imagesPicture5,
                    name: 'Pansi\nRestaurant',
                    tagLine: 'Sandwiches · Salad',
                    openingTime: '12',
                    closingTime: '11',
                    totalRating: 4.8,
                    totalReviews: '122',
                    distance: '0.3',
                    isLiked: false,
                    onLiked: () {},
                    isOutOfRange: widget.isOutOfRange,
                    isClosed: widget.isClosed,
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
                      itemCount: homeController.homeDetailMenu.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        var value = homeController.homeDetailMenu[index];
                        return Obx(
                          () {
                            return SimpleToggleButtons(
                              isDark: false,
                              paddingHorizontal: 20.0,
                              text: value,
                              isSelected:
                                  homeController.homeDetailMenuIndex == index,
                              onTap: () =>
                                  homeController.getHomeDetailMenuIndex(
                                index,
                                value,
                              ),
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
                              showModalBottomSheet(
                                context: context,
                                backgroundColor: Colors.transparent,
                                elevation: 0,
                                isScrollControlled: true,
                                builder: (_) => MenuItemBottomSheet(
                                  onAddToCartTap: () {
                                    setState(() {
                                      showViewCartButton = true;
                                    });
                                  },
                                ),
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
            showViewCartButton
                ? Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 10,
                      ),
                      child: MyButton(
                        height: 54,
                        buttonText: '(1) View Cart',
                        onTap: () {},
                      ),
                    ),
                  )
                : SizedBox(),
          ],
        ),
      ),
    );
  }
}
