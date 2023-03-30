import 'package:elias_weam_food2/constant/color.dart';
import 'package:elias_weam_food2/constant/instance.dart';
import 'package:elias_weam_food2/generated/assets.dart';
import 'package:elias_weam_food2/utils/instances.dart';
import 'package:elias_weam_food2/view/screens/main_app/home/browse_by_location.dart';
import 'package:elias_weam_food2/view/screens/main_app/home/filter.dart';
import 'package:elias_weam_food2/view/screens/main_app/home/nearby_restaurants.dart';
import 'package:elias_weam_food2/view/screens/main_app/location/pin_location.dart';
import 'package:elias_weam_food2/view/screens/main_app/home/popular_restaurants.dart';
import 'package:elias_weam_food2/view/screens/main_app/home/restaurant_details.dart';
import 'package:elias_weam_food2/view/screens/main_app/location/set_location_for_first_time.dart';
import 'package:elias_weam_food2/view/screens/main_app/notifications/notifications.dart';
import 'package:elias_weam_food2/view/widget/headings.dart';
import 'package:elias_weam_food2/view/widget/my_text.dart';
import 'package:elias_weam_food2/view/widget/order_delivery_information.dart';
import 'package:elias_weam_food2/view/widget/restaurants_thumbnails.dart';
import 'package:elias_weam_food2/view/widget/search_bar.dart';
import 'package:elias_weam_food2/view/widget/simple_toggle_buttons.dart';
import 'package:elias_weam_food2/view/widget/toggle_buttons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<String> _cats = [
    'all_places',
    'grocery_shop',
    'fast_food',
  ];
  final List<String> popularList = [
    'all',
    'italian',
    'vegetarian',
    'healthy_food',
    'asian',
  ];

  // bool isForFirstTime = true;
  //
  // @override
  // void initState() {
  //   super.initState();
  //   isForFirstTime
  //       ? Future.delayed(
  //           Duration(seconds: 2),
  //           () {
  //             Get.to(
  //               () => SetLocationForFirstTime(),
  //             );
  //             isForFirstTime = false;
  //           },
  //         )
  //       : () {};
  // }

  @override
  Widget build(BuildContext context) {
    var platform = Theme.of(context).platform;
    return Obx(() {
      bool isDark = themeController.isDarkTheme.value;
      bool isEnglish = languageController.isEnglish.value;

      return Scaffold(
        backgroundColor: isDark ? kDarkPrimaryColor : kSeoulColor3,
        body: Stack(
          children: [
            ScrollConfiguration(
              behavior: ScrollBehavior(),
              child: GlowingOverscrollIndicator(
                axisDirection: AxisDirection.down,
                color: isDark
                    ? Colors.transparent
                    : kSeoulColor3.withOpacity(0.05),
                child: CustomScrollView(
                  physics: ClampingScrollPhysics(),
                  slivers: [
                    SliverAppBar(
                      elevation: 2,
                      toolbarHeight: 80,
                      backgroundColor:
                          isDark ? kDarkPrimaryColor : kSeoulColor3,
                      titleSpacing:
                          platform == TargetPlatform.iOS ? 10.0 : 20.0,
                      title: Container(
                        // color: Colors.red,
                        height: 80,
                        width: Get.width,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            MyText(
                              onTap: () => Get.to(
                                () => PinLocation(),
                              ),
                              text: 'deliver_now'.tr,
                              size: 21.5,
                              letterSpacing: 0.4,
                              weight: FontWeight.w800,
                              // paddingTop: 8,
                              paddingBottom: 6,
                              color: isDark ? kPrimaryColor : kBlackColor2,
                            ),
                            GestureDetector(
                              onTap: () => showModalBottomSheet(
                                backgroundColor: Colors.transparent,
                                elevation: 0,
                                isScrollControlled: true,
                                context: context,
                                builder: (_) => BrowseByLocation(),
                              ),
                              child: Container(
                                color: Colors.transparent,
                                child: Wrap(
                                  spacing: 5,
                                  children: [
                                    MyText(
                                      text: 'city_center_hotel_jerusalem'.tr,
                                      size: 14,
                                      weight: FontWeight.w500,
                                      color: kGreenColor2,
                                      paddingBottom: 10,
                                    ),
                                    Image.asset(
                                      Assets.imagesArrowDropDown,
                                      height: 13.5,
                                      color: kGreenColor2,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      actions: [
                        Padding(
                          padding: EdgeInsets.only(
                            right: 20,
                            top: 21,
                            left: 20,
                          ),
                          child: GestureDetector(
                            onTap: () => Get.to(() => Notifications()),
                            child: Stack(
                              clipBehavior: Clip.none,
                              children: [
                                Image.asset(
                                  Assets.imagesBell,
                                  height: 23,
                                  color: isDark ? kPrimaryColor : null,
                                ),
                                Positioned(
                                  top: -5,
                                  right: -2,
                                  child: Container(
                                    height: 15.3,
                                    width: 15.3,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: kSecondaryColor,
                                    ),
                                    child: Center(
                                      child: FittedBox(
                                        child: MyText(
                                          text: '2',
                                          size: 11,
                                          color: kPrimaryColor,
                                          weight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                      pinned: true,
                      // expandedHeight: 265,
                      // flexibleSpace: FlexibleSpaceBar(
                      //   background: ListView(
                      //     shrinkWrap: true,
                      //     physics: NeverScrollableScrollPhysics(),
                      //     padding: EdgeInsets.fromLTRB(0, 135, 0, 10),
                      //     children: [
                      //
                      //     ],
                      //   ),
                      // ),
                    ),
                    SliverToBoxAdapter(
                      child: ListView(
                        shrinkWrap: true,
                        padding: EdgeInsets.symmetric(vertical: 15),
                        physics: BouncingScrollPhysics(),
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
                                GestureDetector(
                                  onTap: () => Get.to(
                                    () => FilterPage(),
                                  ),
                                  child: Container(
                                    height: 50,
                                    width: 50,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(14),
                                      color: kSecondaryColor,
                                    ),
                                    child: Center(
                                      child: Image.asset(
                                        Assets.imagesFilters,
                                        color:
                                            isDark ? kDarkInputBgColor : null,
                                        height: 22,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 2,
                          ),
                          SizedBox(
                            height: 120,
                            child: ListView.builder(
                              shrinkWrap: true,
                              padding: EdgeInsets.symmetric(
                                horizontal: 13,
                              ),
                              physics: BouncingScrollPhysics(),
                              itemCount:
                                  homeController.instantFilterList.length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                var data =
                                    homeController.instantFilterList[index];
                                return Obx(
                                  () {
                                    return ToggleButtonsWithImage(
                                      img: data['img'],
                                      title: _cats[index].tr,
                                      isSelected: homeController
                                              .currentInstantFilterIndex
                                              .value ==
                                          index,
                                      onTap: () => homeController
                                          .getSelectedInstantFilerIndex(
                                        index,
                                        data['title'],
                                      ),
                                    );
                                  },
                                );
                              },
                            ),
                          ),
                          headingTiles(
                            heading: 'nearby_restaurants'.tr,
                            onSeeAll: () => Get.to(() => NearByRestaurants()),
                          ),
                          SizedBox(
                            height: 285,
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
                                    isDark: isDark,
                                    imgUrl: index == 0
                                        ? Assets.imagesPicture2
                                        : Assets.imagesAwacado,
                                    name: 'marina_coastal_food'.tr,
                                    deliveryTime: '30',
                                    totalRating: 4.8,
                                    totalReviews: '122',
                                    deliveryFee: 10,
                                    isClosed: index == 2 ? true : false,
                                    isFeatured: index == 1 ? true : false,
                                    isFreeDelivery: index == 0 ? true : false,
                                    isLiked: index == 0 ? true : false,
                                    onLikeTap: () {},
                                    onTap: () => Get.to(
                                      () => RestaurantDetails(
                                        isClosed: index == 2 ? true : false,
                                        isOutOfRange: index == 2 ? true : false,
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          headingTiles(
                            heading: 'popular_right_now'.tr,
                            onSeeAll: () => Get.to(() => PopularRestaurants()),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          SizedBox(
                            height: 65,
                            child: ListView.builder(
                              shrinkWrap: true,
                              padding: EdgeInsets.symmetric(
                                horizontal: 13,
                              ),
                              physics: BouncingScrollPhysics(),
                              itemCount: homeController.popularList.length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                var value = homeController.popularList[index];
                                return Obx(() {
                                  if (languageController.currentIndex.value ==
                                          0 ||
                                      languageController.currentIndex.value ==
                                          2) {
                                    return SimpleToggleButtons(
                                      isDark: isDark,
                                      text:
                                          homeController.popularList[index].tr,
                                      isSelected:
                                          homeController.popularIndex.value ==
                                              index,
                                      onTap: () =>
                                          homeController.getPopularIndex(
                                        index,
                                        value,
                                      ),
                                    );
                                  } else {
                                    return SimpleToggleButtons(
                                      paddingTop: languageController
                                                      .currentIndex.value !=
                                                  0 ||
                                              languageController
                                                      .currentIndex.value !=
                                                  2
                                          ? index == 3
                                              ? 13
                                              : 17
                                          : null,
                                      paddingBottom: languageController
                                                      .currentIndex.value !=
                                                  0 ||
                                              languageController
                                                      .currentIndex.value !=
                                                  2
                                          ? index == 3
                                              ? 18
                                              : 14
                                          : null,
                                      isDark: isDark,
                                      text:
                                          homeController.popularList[index].tr,
                                      isSelected:
                                          homeController.popularIndex.value ==
                                              index,
                                      onTap: () =>
                                          homeController.getPopularIndex(
                                        index,
                                        value,
                                      ),
                                    );
                                  }
                                });
                              },
                            ),
                          ),
                          ListView.builder(
                            shrinkWrap: true,
                            padding: EdgeInsets.symmetric(
                              horizontal: 13,
                              vertical: 10,
                            ),
                            physics: BouncingScrollPhysics(),
                            itemCount: 10,
                            itemBuilder: (context, index) {
                              // var data = homeController.instantFilterList[index];
                              return Padding(
                                padding: const EdgeInsets.only(bottom: 25),
                                child: RestaurantsThumbnail(
                                  isDark: isDark,
                                  width: Get.width,
                                  horizontalMargin: 0,
                                  imgUrl: index == 0
                                      ? Assets.imagesPicture
                                      : Assets.imagesPicture4,
                                  name: 'marina_coastal_food'.tr,
                                  deliveryTime: '30',
                                  totalRating: 4.8,
                                  totalReviews: '122',
                                  deliveryFee: 10,
                                  isClosed: index == 2 ? true : false,
                                  isFeatured: index == 1 ? true : false,
                                  isFreeDelivery: index == 0 ? true : false,
                                  isLiked: index == 0 ? true : false,
                                  onLikeTap: () {},
                                  onTap: () => Get.to(
                                    () => RestaurantDetails(
                                      isClosed: index == 2 ? true : false,
                                      isOutOfRange: index == 2 ? true : false,
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              child: Obx(() {
                return cartCheckOutController.isOrderConfirm.value
                    ? OrderDeliveryInformation()
                    : SizedBox();
              }),
            ),
          ],
        ),
      );
    });
  }
}

// ignore: must_be_immutable
class SimpleToggleButtons extends StatelessWidget {
  SimpleToggleButtons({
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
