import 'dart:ui';

import 'package:elias_weam_food2/constant/color.dart';
import 'package:elias_weam_food2/generated/assets.dart';
import 'package:elias_weam_food2/main.dart';
import 'package:elias_weam_food2/utils/instances.dart';
import 'package:elias_weam_food2/view/widget/common_image_view.dart';
import 'package:elias_weam_food2/view/widget/my_text.dart';
import 'package:elias_weam_food2/view/widget/simple_toggle_buttons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RestaurantDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kSeoulColor3,
      body: SafeArea(
        child: NestedScrollView(
          physics: BouncingScrollPhysics(),
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                automaticallyImplyLeading: false,
                backgroundColor: kSeoulColor3,
                expandedHeight: 380,
                flexibleSpace: FlexibleSpaceBar(
                  background: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Stack(
                      children: [
                        CommonImageView(
                          height: Get.height,
                          width: Get.width,
                          radius: 24.0,
                          url: dummyImg3,
                        ),
                        Container(
                          height: Get.height,
                          width: Get.width,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(24),
                            gradient: LinearGradient(
                              colors: [
                                kBlackColor.withOpacity(0.3),
                                kBlackColor.withOpacity(0.3),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  GestureDetector(
                                    onTap: () => Get.back(),
                                    child: Image.asset(
                                      Assets.imagesRoundedBack,
                                      height: 41,
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {},
                                    child: Image.asset(
                                      Assets.imagesHeartEmpty,
                                      height: 25,
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 15),
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    MyText(
                                      text: 'Pansi\nRestaurant',
                                      size: 28,
                                      weight: FontWeight.w700,
                                      color: kPrimaryColor,
                                      paddingBottom: 15,
                                    ),
                                    MyText(
                                      paddingBottom: 10,
                                      text: 'Sandwiches · Salad',
                                      size: 15,
                                      weight: FontWeight.w500,
                                      color: kPrimaryColor.withOpacity(0.88),
                                    ),
                                    MyText(
                                      paddingBottom: 15,
                                      text: 'From 12 am to 11 pm',
                                      size: 15,
                                      color: kPrimaryColor.withOpacity(0.77),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Wrap(
                                          crossAxisAlignment:
                                              WrapCrossAlignment.center,
                                          spacing: 8.0,
                                          children: [
                                            Image.asset(
                                              Assets.imagesStarFill,
                                              height: 15,
                                            ),
                                            MyText(
                                              text: '4.8',
                                              size: 14,
                                              color: kPrimaryColor,
                                              weight: FontWeight.w500,
                                            ),
                                            MyText(
                                              text: '(122 reviews)',
                                              size: 14,
                                              color: kPrimaryColor
                                                  .withOpacity(0.77),
                                            ),
                                          ],
                                        ),
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                          child: BackdropFilter(
                                            filter: ImageFilter.blur(
                                              sigmaY: 2,
                                              sigmaX: 2,
                                            ),
                                            child: Container(
                                              width: 55,
                                              height: 20,
                                              color: kPrimaryColor
                                                  .withOpacity(0.44),
                                              child: Center(
                                                child: MyText(
                                                  text: '0.3 km',
                                                  size: 12,
                                                  weight: FontWeight.w700,
                                                  color: kPrimaryColor,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ];
          },
          body: ListView(
            shrinkWrap: true,
            padding: EdgeInsets.symmetric(vertical: 15),
            physics: BouncingScrollPhysics(),
            children: [
              Container(
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
                            text: '\$1.50',
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
                            text: 'Delivery time',
                            size: 13,
                            color: kBlackColor.withOpacity(0.44),
                          ),
                          MyText(
                            text: '36 min',
                            size: 15,
                            weight: FontWeight.w500,
                            color: kBlackColor,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 8,
              ),
              SizedBox(
                height: 85,
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
                          paddingHorizontal: 20.0,
                          text: value,
                          isSelected:
                              homeController.homeDetailMenuIndex == index,
                          onTap: () => homeController.getHomeDetailMenuIndex(
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
                      child: Container(
                        padding: EdgeInsets.all(10),
                        height: 223,
                        width: 172,
                        margin: EdgeInsets.symmetric(
                          horizontal: 7,
                        ),
                        decoration: BoxDecoration(
                          color: kPrimaryColor,
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.02),
                              spreadRadius: 0,
                              blurRadius: 8,
                              offset: Offset(7, 7),
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Stack(
                              children: [
                                CommonImageView(
                                  height: 137,
                                  width: Get.width,
                                  radius: 11.0,
                                  url: dummyImg3,
                                ),
                                Container(
                                  height: 137,
                                  width: Get.width,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(11),
                                    gradient: LinearGradient(
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                      colors: [
                                        kBlackColor.withOpacity(0.28),
                                        kBlackColor.withOpacity(0.0),
                                        kBlackColor.withOpacity(0.06),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            MyText(
                              paddingTop: 13,
                              paddingBottom: 8,
                              text: 'German hamburger',
                              size: 13,
                              weight: FontWeight.w500,
                              color: kDarkGreyColor,
                            ),
                            MyText(
                              text: '\$19.99',
                              size: 13,
                              weight: FontWeight.w500,
                              color: kSecondaryColor,
                            ),
                          ],
                        ),
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
              MyText(
                text: 'Informations',
                size: 16,
                weight: FontWeight.w700,
                paddingTop: 35,
                paddingLeft: 20,
                paddingBottom: 20,
              ),
              MyText(
                text:
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Tortor orci sem at facilisis duis cras elit. At nibh ultricies diam orci volutpat, non facilisis. Habitasse diam eget lectus venenatis cras enim tellus.\n\nAmet posuere nulla sit laoreet et congue iaculis viverra. Non ultrices faucibus mauris leo.',
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
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 7,
                      ),
                      child: CommonImageView(
                        height: 92,
                        width: 92,
                        url: dummyImg3,
                        radius: 12.0,
                      ),
                    );
                  },
                ),
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
