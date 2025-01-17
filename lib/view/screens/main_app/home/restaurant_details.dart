import 'dart:developer';
import 'dart:io';
import 'package:elias_weam_food2/constant/color.dart';
import 'package:elias_weam_food2/constant/instance.dart';
import 'package:elias_weam_food2/generated/assets.dart';
import 'package:elias_weam_food2/utils/instances.dart';
import 'package:elias_weam_food2/view/screens/main_app/cart_and_checkout/my_cart/my_cart.dart';
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
import 'package:elias_weam_food2/api/requests.dart';
import 'package:elias_weam_food2/api/api.dart';
import 'package:provider/provider.dart';

import '../../../../api/ClientSession.dart';

class RestaurantDetails extends StatefulWidget {
  final int id;
  final String name;
  final String address;
  final List<Category> categories;
  final bool isOutOfRange=false;
  final bool isClosed=false;

  RestaurantDetails({
    required this.id,
    required this.name,
    required this.address,
    required this.categories,
  });

  factory RestaurantDetails.fromJson(Map<String, dynamic> json) {
    var categoriesList = json['categorie'] as List;
    List<Category> categories =
    categoriesList.map((category) => Category.fromJson(category)).toList();

    return RestaurantDetails(
      id: json['id'],
      name: json['name'],
      address: json['adress'],
      categories: categories,
    );
  }
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

  List<String> _cats = [
    'popular_items',
    'pizza_pasta',
    'salads',
    'drinks',
    'add_and_save',
  ];

  @override
  Widget build(BuildContext context) {
    ClientSession c = Provider.of<ClientSession>(context);
    return Obx(() {
      bool isDark = themeController.isDarkTheme.value;
      bool isEnglish = languageController.isEnglish.value;
      return Scaffold(
        backgroundColor: isDark ? kDarkPrimaryColor : kSeoulColor3,
        body: SafeArea(
          child: Stack(
            children: [
              NestedScrollView(
                physics: BouncingScrollPhysics(),
                headerSliverBuilder: (context, innerBoxIsScrolled) {
                  return [
                    HomeDetailAppBar(
                      isEnglish: isEnglish,
                      isDark: isDark,
                      imgUrl: Assets.imagesPicture5,
                      name: this.widget.name,
                      tagLine: '${'sandwiches'.tr} · ${'salad'.tr}',
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
                        itemCount: this.widget.categories.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          var value = this.widget.categories[index];
                          return Obx(() {
                            if (languageController.currentIndex.value == 0 ||
                                languageController.currentIndex.value == 2) {
                              return HomeDetailToggleButton(
                                isDark: isDark,
                                paddingHorizontal: 20.0,
                                text: value.name,
                                isSelected:
                                    homeController.homeDetailMenuIndex == index,
                                onTap: () =>
                                    homeController.getHomeDetailMenuIndex(
                                  index,
                                  value.name,
                                ),
                              );
                            } else {
                              return HomeDetailToggleButton(
                                paddingTop: Platform.isIOS
                                    ? index == 2 || index == 3
                                        ? 18
                                        : null
                                    : null,
                                paddingBottom: Platform.isIOS
                                    ? index == 2 || index == 3
                                        ? 10
                                        : null
                                    : null,
                                isDark: isDark,
                                paddingHorizontal: 20.0,
                                text: value.name,
                                isSelected:
                                    homeController.homeDetailMenuIndex == index,
                                onTap: () =>
                                    homeController.getHomeDetailMenuIndex(
                                  index,
                                  value.name,
                                ),
                              );
                            }
                          });
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
                        itemCount: this.widget.categories[homeController.homeDetailMenuIndex.value].items.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          ClientSession c = Provider.of<ClientSession>(context);
                          return Align(
                            child: MenuItemCard(
                              itemImgUrl: index == 0
                                  ? Assets.imagesBurger
                                  : Assets.imagesPepperBeef,
                              itemName: this.widget.categories[homeController.homeDetailMenuIndex.value].items[index].itemName,
                              price: '14.99',
                              onTap: () {
                                showModalBottomSheet(
                                  context: context,
                                  backgroundColor: Colors.transparent,
                                  elevation: 0,
                                  isScrollControlled: true,

                                  builder: (_) => MenuItemBottomSheet(

                                    item: this.widget.categories[homeController.homeDetailMenuIndex.value].items[index],
                                    onAddToCartTap: () {
                                      c.addMenuItem(this.widget.categories[homeController.homeDetailMenuIndex.value].items[index]);
                                      setState(() {
                                        showViewCartButton = true;
                                      });
                                      cartCheckOutController.isEmptyCart.value=false;
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
                      paddingRight: 20,
                      text: 'address'.tr,
                      size: 16,
                      weight: FontWeight.w700,
                      paddingBottom: 25,
                      color: isDark ? kPrimaryColor : kBlackColor2,
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
                      paddingRight: 20,
                      text: 'king_george_st'.tr,
                      color: isDark
                          ? kPrimaryColor.withOpacity(0.5)
                          : kBlackColor.withOpacity(0.5),
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
                          buttonText: '(1) ${'view_cart'.tr}',
                          onTap: ()=>Get.to(MyCart()) ,
                        ),
                      ),
                    )
                  : SizedBox(),
            ],
          ),
        ),
      );
    });
  }
}

class HomeDetailToggleButton extends StatelessWidget {
  HomeDetailToggleButton({
    Key? key,
    required this.text,
    required this.isSelected,
    required this.onTap,
    this.paddingHorizontal,
    required this.isDark,
    this.paddingBottom,
    this.paddingTop,
  }) : super(key: key);
  final String text;
  final bool isSelected, isDark;
  final VoidCallback onTap;
  double? paddingHorizontal, paddingTop, paddingBottom;

  @override
  Widget build(BuildContext context) {
    return Align(
      child: AnimatedContainer(
        height: 45,
        curve: Curves.easeInOut,
        duration: Duration(
          milliseconds: 110,
        ),
        margin: EdgeInsets.symmetric(
          horizontal: 7,
        ),
        decoration: BoxDecoration(
          color: isSelected
              ? kSecondaryColor
              : isDark
                  ? kDarkInputBgColor
                  : kPrimaryColor,
          borderRadius: BorderRadius.circular(13),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.02),
              spreadRadius: 0,
              blurRadius: 6,
              offset: Offset(0, 0),
            ),
          ],
        ),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(13),
          child: MyText(
            paddingLeft: paddingHorizontal ?? 17,
            paddingRight: paddingHorizontal ?? 17,
            paddingTop: paddingTop ?? 14,
            paddingBottom: paddingBottom ?? 14,
            text: text,
            size: 13,
            color: isSelected
                ? isDark
                    ? kBlackColor2
                    : kPrimaryColor
                : isDark
                    ? kDarkModeGrey1Color
                    : kGreyColor3,
            weight: isSelected ? FontWeight.w700 : FontWeight.w400,
          ),
        ),
      ),
    );
  }
}
