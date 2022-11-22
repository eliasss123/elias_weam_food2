import 'package:elias_weam_food2/constant/color.dart';
import 'package:elias_weam_food2/generated/assets.dart';
import 'package:elias_weam_food2/utils/instances.dart';
import 'package:elias_weam_food2/view/screens/main_app/home/filter.dart';
import 'package:elias_weam_food2/view/screens/main_app/home/restaurant_details.dart';
import 'package:elias_weam_food2/view/widget/browse_thumbnails.dart';
import 'package:elias_weam_food2/view/widget/my_text.dart';
import 'package:elias_weam_food2/view/widget/restaurants_thumbnails.dart';
import 'package:elias_weam_food2/view/widget/search_bar.dart';
import 'package:elias_weam_food2/view/widget/simple_toggle_buttons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Browse extends StatefulWidget {
  @override
  State<Browse> createState() => _BrowseState();
}

class _BrowseState extends State<Browse> {
  final List<Map<String, dynamic>> categories = [
    {
      'img': Assets.imagesPizza,
      'title': 'Pizza',
    },
    {
      'img': Assets.imagesFastFood2,
      'title': 'Fast Food',
    },
    {
      'img': Assets.imagesConvi,
      'title': 'Convenience',
    },
    {
      'img': Assets.imagesMexican,
      'title': 'Mexican',
    },
    {
      'img': Assets.imagesLatestDeal,
      'title': 'Latest Deals',
    },
    {
      'img': Assets.imagesBurger,
      'title': 'Burger',
    },
    {
      'img': Assets.imagesRewards,
      'title': 'Restaurant\nrewards',
    },
    {
      'img': Assets.imagesPasta,
      'title': 'Pasta',
    },
    {
      'img': Assets.imagesVegetable,
      'title': 'Vegetable',
    },
    {
      'img': Assets.imagesChinese,
      'title': 'Chinese',
    },
  ];

  bool showResults = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kSeoulColor3,
      body: NestedScrollView(
        physics: BouncingScrollPhysics(),
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverAppBar(
              toolbarHeight: 65,
              elevation: 3,
              backgroundColor: kSeoulColor3,
              titleSpacing: 20.0,
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  MyText(
                    size: 22,
                    text: 'Browse',
                    letterSpacing: 0.4,
                    weight: FontWeight.w800,
                  ),
                ],
              ),
              pinned: true,
              expandedHeight: showResults ? 160 : 200,
              flexibleSpace: FlexibleSpaceBar(
                background: ListView(
                  shrinkWrap: true,
                  physics: BouncingScrollPhysics(),
                  padding: EdgeInsets.fromLTRB(0, 93, 0, 10),
                  children: [
                    SizedBox(
                      height: 8,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        children: [
                          Expanded(
                            child: SearchBar(
                              onChanged: (value) {
                                setState(() {
                                  value.isNotEmpty
                                      ? showResults = true
                                      : showResults = false;
                                });
                              },
                            ),
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
                    showResults
                        ? Padding(
                            padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
                            child: Wrap(
                              runSpacing: 10,
                              crossAxisAlignment: WrapCrossAlignment.center,
                              children: [
                                MyText(
                                  text: '980 ',
                                  size: 16,
                                  weight: FontWeight.w700,
                                ),
                                MyText(
                                  text: 'results for ',
                                ),
                                MyText(
                                  text: '“Chesse pizza”',
                                  size: 16,
                                  weight: FontWeight.w700,
                                ),
                              ],
                            ),
                          )
                        : Padding(
                          padding: const EdgeInsets.only(top: 4),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                SizedBox(
                                  height: 85,
                                  child: ListView.builder(
                                    shrinkWrap: true,
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 13,
                                    ),
                                    physics: BouncingScrollPhysics(),
                                    itemCount: browseController.categories.length,
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder: (context, index) {
                                      var value =
                                          browseController.categories[index];
                                      return Obx(
                                        () {
                                          return SimpleToggleButtons(
                                            text: value,
                                            isSelected: browseController
                                                    .currentCategoryIndex.value ==
                                                index,
                                            onTap: () => browseController
                                                .getSelectedCategoryIndex(
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
                                  height: 10,
                                ),
                              ],
                            ),
                        ),
                  ],
                ),
              ),
            ),
          ];
        },
        body: showResults
            ? SearchResults()
            : GridView.builder(
                shrinkWrap: true,
                padding: EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
                physics: BouncingScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 15,
                  crossAxisSpacing: 15,
                  mainAxisExtent: 119,
                ),
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  var data = categories[index];
                  return BrowseThumbnails(
                    bgImg: data['img'],
                    title: data['title'],
                    onTap: () {},
                  );
                },
              ),
      ),
    );
  }
}

class SearchResults extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
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
                ? Assets.imagesPizzaLarge
                : index == 1
                    ? Assets.imagesPansi
                    : Assets.imagesItalianPizza,
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
    );
  }
}