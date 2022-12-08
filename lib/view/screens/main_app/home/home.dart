import 'package:elias_weam_food2/constant/color.dart';
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
  bool isForFirstTime = true;

  @override
  void initState() {
    super.initState();
    isForFirstTime
        ? Future.delayed(
            Duration(seconds: 2),
            () {
              Get.to(
                () => SetLocationForFirstTime(),
              );
              isForFirstTime = false;
            },
          )
        : () {};
  }

  @override
  Widget build(BuildContext context) {
    var platform = Theme.of(context).platform;
    return Scaffold(
      backgroundColor: kSeoulColor3,
      body: Stack(
        children: [
          ScrollConfiguration(
            behavior: ScrollBehavior(),
            child: GlowingOverscrollIndicator(
              axisDirection: AxisDirection.down,
              color: kSeoulColor3.withOpacity(0.05),
              child: CustomScrollView(
                physics: ClampingScrollPhysics(),
                slivers: [
                  SliverAppBar(
                    elevation: 2,
                    toolbarHeight: 80,
                    backgroundColor: kSeoulColor3,
                    titleSpacing: platform == TargetPlatform.iOS ? 10.0 : 20.0,
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
                            text: 'Deliver now',
                            size: 21.5,
                            letterSpacing: 0.4,
                            weight: FontWeight.w800,
                            // paddingTop: 8,
                            paddingBottom: 6,
                          ),
                          Wrap(
                            children: [
                              MyText(
                                text: 'City Center Hotel Jerusalem ',
                                size: 14,
                                weight: FontWeight.w500,
                                color: kGreenColor2,
                                paddingBottom: 10,
                              ),
                              GestureDetector(
                                onTap: () => showModalBottomSheet(
                                  backgroundColor: Colors.transparent,
                                  elevation: 0,
                                  isScrollControlled: true,
                                  context: context,
                                  builder: (_) => BrowseByLocation(),
                                ),
                                child: Image.asset(
                                  Assets.imagesArrowDropDown,
                                  height: 13.5,
                                  color: kGreenColor2,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    actions: [
                      Padding(
                        padding: const EdgeInsets.only(right: 20, top: 21),
                        child: GestureDetector(
                          onTap: () => Get.to(() => Notifications()),
                          child: Stack(
                            clipBehavior: Clip.none,
                            children: [
                              Image.asset(
                                Assets.imagesBell,
                                height: 23,
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
                            itemCount: homeController.instantFilterList.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              var data =
                                  homeController.instantFilterList[index];
                              return Obx(
                                () {
                                  return ToggleButtonsWithImage(
                                    img: data['img'],
                                    title: data['title'],
                                    isSelected: homeController
                                            .currentInstantFilterIndex.value ==
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
                          heading: 'Nearby Restaurants',
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
                                  imgUrl: index == 0
                                      ? Assets.imagesPicture2
                                      : Assets.imagesAwacado,
                                  name: 'Marina Coastal Food',
                                  deliveryTime: '30',
                                  totalRating: 4.8,
                                  totalReviews: '122',
                                  deliveryFee: 10.0,
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
                          heading: 'Popular Right Now',
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
                              return Obx(
                                () {
                                  return SimpleToggleButtons(
                                    text: value,
                                    isSelected:
                                        homeController.popularIndex.value ==
                                            index,
                                    onTap: () => homeController.getPopularIndex(
                                      index,
                                      value,
                                    ),
                                  );
                                },
                              );
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
                                width: Get.width,
                                horizontalMargin: 0,
                                imgUrl: index == 0
                                    ? Assets.imagesPicture
                                    : Assets.imagesPicture4,
                                name: 'Marina Coastal Food',
                                deliveryTime: '30',
                                totalRating: 4.8,
                                totalReviews: '122',
                                deliveryFee: 10.0,
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
  }
}
