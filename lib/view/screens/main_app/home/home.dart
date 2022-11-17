import 'package:elias_weam_food2/constant/color.dart';
import 'package:elias_weam_food2/generated/assets.dart';
import 'package:elias_weam_food2/main.dart';
import 'package:elias_weam_food2/utils/instances.dart';
import 'package:elias_weam_food2/view/widget/common_image_view.dart';
import 'package:elias_weam_food2/view/widget/headings.dart';
import 'package:elias_weam_food2/view/widget/my_text.dart';
import 'package:elias_weam_food2/view/widget/search_bar.dart';
import 'package:elias_weam_food2/view/widget/toggle_buttons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kSeoulColor3,
      body: NestedScrollView(
        physics: BouncingScrollPhysics(),
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverAppBar(
              toolbarHeight: 70,
              backgroundColor: kSeoulColor3,
              titleSpacing: 20.0,
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  MyText(
                    text: 'Deliver now',
                    size: 22,
                    weight: FontWeight.w700,
                    paddingBottom: 8,
                  ),
                  Wrap(
                    children: [
                      MyText(
                        text: 'City Center Hotel Jerusalem ',
                        size: 14,
                        weight: FontWeight.w500,
                        color: kSecondaryColor,
                      ),
                      Image.asset(
                        Assets.imagesArrowDropDown,
                        height: 13.5,
                      ),
                    ],
                  ),
                ],
              ),
              actions: [
                Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: Center(
                    child: Image.asset(
                      Assets.imagesBell,
                      height: 23,
                    ),
                  ),
                ),
              ],
              pinned: true,
              expandedHeight: 245,
              flexibleSpace: FlexibleSpaceBar(
                background: ListView(
                  shrinkWrap: true,
                  physics: BouncingScrollPhysics(),
                  padding: EdgeInsets.fromLTRB(0, 120, 0, 10),
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        children: [
                          Expanded(
                            child: SearchBar(),
                          ),
                          SizedBox(
                            width: 13,
                          ),
                          Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(14),
                              color: kSecondaryColor,
                            ),
                            child: Center(
                              child: Image.asset(
                                Assets.imagesFilters,
                                height: 22,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 120,
                      child: ListView.builder(
                        shrinkWrap: true,
                        padding: EdgeInsets.symmetric(
                          horizontal: 13,
                        ),
                        physics: BouncingScrollPhysics(),
                        itemCount: homeController.instantFilterList.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          var data = homeController.instantFilterList[index];
                          return Obx(
                            () {
                              return ToggleButtonsWithImage(
                                img: data['img'],
                                title: data['title'],
                                isSelected: homeController
                                        .currentInstantFilterIndex.value ==
                                    index,
                                onTap: () =>
                                    homeController.getSelectedInstantFilerIndex(
                                  index,
                                  data['title'],
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ];
        },
        body: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.symmetric(vertical: 10),
          physics: BouncingScrollPhysics(),
          children: [
            headingTiles(
              heading: 'Nearby Restaurants',
              onSeeAll: () {},
            ),
            SizedBox(
              height: 280,
              child: ListView.builder(
                shrinkWrap: true,
                padding: EdgeInsets.symmetric(
                  horizontal: 13,
                ),
                physics: BouncingScrollPhysics(),
                itemCount: 10,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  // var data = homeController.instantFilterList[index];
                  return Align(
                    child: RestaurantsThumbnail(
                      imgUrl: dummyImg3,
                      name: 'Marina Coastal Food',
                      deliveryTime: '30',
                      totalRating: 4.8,
                      totalReviews: '122',
                      deliveryFee: 10.0,
                      isClosed: false,
                      isFeatured: false,
                      isFreeDelivery: index == 0 ? true : false,
                      isLiked: index == 0 ? true : false,
                      onLikeTap: () {},
                      onTap: () {},
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class RestaurantsThumbnail extends StatelessWidget {
  RestaurantsThumbnail({
    Key? key,
    required this.imgUrl,
    required this.name,
    required this.deliveryTime,
    required this.totalReviews,
    required this.totalRating,
    required this.deliveryFee,
    required this.isFreeDelivery,
    required this.isFeatured,
    required this.isClosed,
    required this.isLiked,
    this.horizontalMargin,
    this.width,
    this.onTap,
    this.onLikeTap,
  }) : super(key: key);

  final String imgUrl, name, deliveryTime, totalReviews;
  final double totalRating, deliveryFee;
  final bool isFreeDelivery, isFeatured, isClosed, isLiked;
  double? width, horizontalMargin;
  VoidCallback? onTap, onLikeTap;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: EdgeInsets.symmetric(
            horizontal: horizontalMargin ?? 7,
          ),
          height: 250,
          width: width ?? 265,
          decoration: BoxDecoration(
            color: kPrimaryColor,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.02),
                spreadRadius: 0,
                blurRadius: 10,
                offset: Offset(7, 7),
              ),
            ],
          ),
          child: InkWell(
            onTap: onTap,
            borderRadius: BorderRadius.circular(15),
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 13,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  CommonImageView(
                    height: 164,
                    width: Get.width,
                    radius: 11.0,
                    url: imgUrl,
                  ),
                  SizedBox(
                    height: 13,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      MyText(
                        text: name,
                        size: 13,
                        color: kDarkGreyColor,
                        weight: FontWeight.w500,
                      ),
                      MyText(
                        text: '$deliveryTime min',
                        size: 12,
                        color: kBlackColor,
                        weight: FontWeight.w500,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 13,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Wrap(
                        crossAxisAlignment: WrapCrossAlignment.center,
                        spacing: 5.0,
                        children: [
                          Image.asset(
                            Assets.imagesStarFill,
                            height: 13,
                          ),
                          MyText(
                            text: '$totalRating',
                            size: 12,
                            color: kRatingColor,
                            weight: FontWeight.w500,
                          ),
                          MyText(
                            text: '($totalReviews reviews)',
                            size: 12,
                            color: kBlackColor.withOpacity(0.4),
                          ),
                        ],
                      ),
                      MyText(
                        text: isFreeDelivery
                            ? 'Free Delivery'
                            : '\$$deliveryFee Delivery fee',
                        size: 12,
                        color: kBlackColor.withOpacity(0.4),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          top: 20,
          right: 20,
          child: GestureDetector(
            onTap: onLikeTap,
            child: Image.asset(
              isLiked ? Assets.imagesHeartFill : Assets.imagesHeartEmpty,
              height: 17,
            ),
          ),
        ),
      ],
    );
  }
}
