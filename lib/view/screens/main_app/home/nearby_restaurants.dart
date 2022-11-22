import 'package:elias_weam_food2/constant/color.dart';
import 'package:elias_weam_food2/generated/assets.dart';
import 'package:elias_weam_food2/main.dart';
import 'package:elias_weam_food2/view/widget/my_text.dart';
import 'package:elias_weam_food2/view/widget/restaurants_thumbnails.dart';
import 'package:elias_weam_food2/view/widget/simple_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NearByRestaurants extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kSeoulColor3,
      appBar: simpleAppBar(bgColor: kSeoulColor3),
      body: ListView(
        shrinkWrap: true,
        padding: EdgeInsets.symmetric(horizontal: 20),
        physics: BouncingScrollPhysics(),
        children: [
          MyText(
            text: 'For you',
            size: 16,
            color: kTertiaryColor,
          ),
          MyText(
            paddingTop: 8,
            text: 'Nearby Restaurant',
            size: 24,
            weight: FontWeight.w700,
          ),
          ListView.builder(
            shrinkWrap: true,
            padding: EdgeInsets.symmetric(
              horizontal: 0,
              vertical: 20,
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
                      : index == 1
                          ? Assets.imagesPicture2
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
                  onTap: () {},
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
