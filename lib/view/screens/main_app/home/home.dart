import 'dart:convert';
import 'dart:io';

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
import 'package:get/get.dart' hide Response;
import 'package:http/http.dart';
import 'package:elias_weam_food2/api/requests.dart';
import 'package:elias_weam_food2/api/api.dart';
class Home extends StatefulWidget {
  Home({Key? key, required this.homecats,required this.resturants,required this.resturantcats});
  final List<HomeCat> homecats;
  final List resturants;
  final List<HomeCat> resturantcats;
  @override
  State<Home> createState() => _HomeState();
}

Future<List<Restaurant>> _initializeRestaurants() async {
  final response =
  await get(Uri.parse('https://10.0.2.2:7264/api/restaurants'));
  final data = jsonDecode(response.body);
  final List<Restaurant> restaurantsList =
  List<Restaurant>.from(data.map((model) => Restaurant.fromJson(model)));
  return restaurantsList;


}

Future<List<HomeCat>> _initializeResturantCats() async {
  final response =
  await get(Uri.parse('https://10.0.2.2:7264/api/resturantcats'));
  final data = jsonDecode(response.body);
  final List<HomeCat> resturantCatsList =
  List<HomeCat>.from(data.map((model) => HomeCat.fromJson(model)));

  return resturantCatsList;

}
class _HomeState extends State<Home> {


  Future<void> getresturants() async {
    try{
      String j="https://10.0.2.2:7264/api/homecats";
      Response respone= await get(
        Uri.parse(j),
      );

      if(respone.statusCode==200){

        Iterable l = json.decode(respone.body);
        List<HomeCat> homecats = List<HomeCat>.from(l.map((model)=> HomeCat.fromJson(model)));


          String j="https://10.0.2.2:7264/api/restcats";
          Response respone1= await get(
            Uri.parse(j),
          );
           l = json.decode(respone1.body);
          List<HomeCat> restcat = List<HomeCat>.from(l.map((model)=> HomeCat.fromJson(model)));
          String j1="https://10.0.2.2:7264/api/resturants";
          Response respone2= await get(
            Uri.parse(j1),
          );
          if(respone2.statusCode==200){
            Iterable l = json.decode(respone2.body);
            List<Restaurant> resturants = List<Restaurant>.from(l.map((model)=> Restaurant.fromJson(model)));
            int i=0;






          }




      }else{
        print("no");
      }
    }catch(e){
      print(e.toString());
    }



  }
  void getresturant(String id) async {
    try{
      String j="https://10.0.2.2:7264/api/resturants/"+id;
      Response respone= await get(
        Uri.parse(j),
      );

      if(respone.statusCode==200){

        RestaurantDetails  resturant=RestaurantDetails.fromJson( jsonDecode(respone.body));
        int i=0;

        Get.to(()=>RestaurantDetails(id: resturant.id, name:  resturant.name, address: resturant.address, categories: resturant.categories));


      }else{
        print("no");
      }
    }catch(e){
      print(e.toString());
    }



  }

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
    final List<HomeCat> _cats = this.widget.homecats;
    final List<HomeCat> popularList =this.widget.homecats;
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
                              text: 'ELIAS_APP'.tr,
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
                                    _cats[index];
                                return Obx(
                                  () {
                                    return ToggleButtonsWithImage(
                                      img: Assets.imagesAllPlaces,
                                      title: data.name,
                                      isSelected: homeController
                                              .currentInstantFilterIndex
                                              .value ==
                                          index,
                                      onTap: () => homeController
                                          .getSelectedInstantFilerIndex(
                                        index,
                                        data.name,//watch out here safwan
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
                              itemCount: this.widget.resturants.length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                 var data = this.widget.resturants[index];
                                return Align(
                                  child: RestaurantsThumbnail(
                                    isDark: isDark,
                                    imgUrl: index == 0
                                        ? Assets.imagesPicture2
                                        : Assets.imagesAwacado,
                                    name: data.name,
                                    deliveryTime: '30',
                                    totalRating: 4.8,
                                    totalReviews: '122',
                                    deliveryFee: 10,
                                    isClosed: index == 2 ? true : false,
                                    isFeatured: index == 1 ? true : false,
                                    isFreeDelivery: index == 0 ? true : false,
                                    isLiked: index == 0 ? true : false,
                                    onLikeTap: () {},
                                    onTap: () =>
                                      getresturant(
                                        data.id.toString()
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
                              itemCount: this.widget.resturantcats.length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                var value = this.widget.resturantcats[index];
                                return Obx(() {
                                  if (languageController.currentIndex.value ==
                                          0 ||
                                      languageController.currentIndex.value ==
                                          2) {
                                    return HomeToggleButton(
                                      isDark: isDark,
                                      text:
                                          value.name,
                                      isSelected:
                                          homeController.popularIndex.value ==
                                              index,
                                      onTap: () =>
                                          homeController.getPopularIndex(
                                        index,
                                        value.name,
                                      ),
                                    );
                                  } else {
                                    return HomeToggleButton(
                                      paddingTop: Platform.isIOS
                                          ? languageController
                                                          .currentIndex.value !=
                                                      0 ||
                                                  languageController
                                                          .currentIndex.value !=
                                                      2
                                              ? index == 3
                                                  ? 13
                                                  : 17
                                              : null
                                          : null,
                                      paddingBottom: Platform.isIOS
                                          ? languageController
                                                          .currentIndex.value !=
                                                      0 ||
                                                  languageController
                                                          .currentIndex.value !=
                                                      2
                                              ? index == 3
                                                  ? 18
                                                  : 14
                                              : null
                                          : null,
                                      isDark: isDark,
                                      text:
                                          value.name,
                                      isSelected:
                                          homeController.popularIndex.value ==
                                              index,
                                      onTap: () =>
                                          homeController.getPopularIndex(
                                        index,
                                        value.name,
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
                            itemCount: this.widget.resturantcats.length,
                            itemBuilder: (context, index) {
                               var data = this.widget.resturantcats[index];
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
                                  onTap:
                                    () => getresturant(data.id.toString()
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
class HomeToggleButton extends StatelessWidget {
  HomeToggleButton({
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
