import 'package:elias_weam_food2/constant/color.dart';
import 'package:elias_weam_food2/constant/instance.dart';
import 'package:elias_weam_food2/generated/assets.dart';
import 'package:elias_weam_food2/view/widget/my_text.dart';
import 'package:elias_weam_food2/view/widget/restaurants_thumbnails.dart';
import 'package:elias_weam_food2/view/widget/simple_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NearByRestaurants extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      bool isDark = themeController.isDarkTheme.value;
      return Scaffold(
        backgroundColor: isDark ? kDarkPrimaryColor : kSeoulColor3,
        appBar: simpleAppBar(
          bgColor: isDark ? Colors.transparent: kSeoulColor3,
          isDark: isDark,
        ),
        body: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.symmetric(horizontal: 20),
          physics: BouncingScrollPhysics(),
          children: [
            MyText(
              text: 'for_you'.tr,
              size: 16,
              color: kTertiaryColor,
            ),
            MyText(
              paddingTop: 8,
              text: 'nearby_restaurants'.tr,
              size: 24,
              weight: FontWeight.w700,
              color: isDark ? kPrimaryColor : kBlackColor2,
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
                    isDark: isDark,
                    width: Get.width,
                    horizontalMargin: 0,
                    imgUrl: index == 0
                        ? Assets.imagesPicture
                        : index == 1
                            ? Assets.imagesPicture2
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
                    onTap: () {},
                  ),
                );
              },
            ),
          ],
        ),
      );
    });
  }
}
