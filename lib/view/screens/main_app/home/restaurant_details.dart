import 'dart:developer';
import 'package:elias_weam_food2/constant/color.dart';
import 'package:elias_weam_food2/constant/instance.dart';
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

  List<String> _cats = [
    'popular_items',
    'pizza_pasta',
    'salads',
    'drinks',
    'add_and_save',
  ];

  @override
  Widget build(BuildContext context) {
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
                      name: 'pansi_restaurant'.tr,
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
                        itemCount: homeController.homeDetailMenu.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          var value = homeController.homeDetailMenu[index];
                          return Obx(() {
                            if (languageController.currentIndex.value == 0 ||
                                languageController.currentIndex.value == 2) {
                              return HomeDetailToggleButton(
                                isDark: isDark,
                                paddingHorizontal: 20.0,
                                text: _cats[index].tr,
                                isSelected:
                                    homeController.homeDetailMenuIndex == index,
                                onTap: () =>
                                    homeController.getHomeDetailMenuIndex(
                                  index,
                                  value,
                                ),
                              );
                            } else {
                              return HomeDetailToggleButton(
                                paddingTop:
                                    index == 2 || index == 3 ? 16 : null,
                                paddingBottom:
                                    index == 2 || index == 3 ? 12 : null,
                                isDark: isDark,
                                paddingHorizontal: 20.0,
                                text: _cats[index].tr,
                                isSelected:
                                    homeController.homeDetailMenuIndex == index,
                                onTap: () =>
                                    homeController.getHomeDetailMenuIndex(
                                  index,
                                  value,
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
                        itemCount: 5,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Align(
                            child: MenuItemCard(
                              itemImgUrl: index == 0
                                  ? Assets.imagesBurger
                                  : Assets.imagesPepperBeef,
                              itemName: 'german_hamburger'.tr,
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
                          onTap: () {},
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
