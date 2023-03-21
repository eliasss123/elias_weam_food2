import 'package:elias_weam_food2/constant/color.dart';
import 'package:elias_weam_food2/constant/instance.dart';
import 'package:elias_weam_food2/generated/assets.dart';
import 'package:elias_weam_food2/main.dart';
import 'package:elias_weam_food2/view/widget/common_image_view.dart';
import 'package:elias_weam_food2/view/widget/my_text.dart';
import 'package:elias_weam_food2/view/widget/simple_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyFavorites extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      bool isDark = themeController.isDarkTheme.value;
      return Scaffold(
        appBar: simpleAppBar(
          title: 'Your Favorites',
          titleWeight: FontWeight.w700,
          isDark: isDark,
        ),
        body: ListView.builder(
          shrinkWrap: true,
          physics: BouncingScrollPhysics(),
          padding: EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 15,
          ),
          itemCount: 4,
          itemBuilder: (context, index) {
            return FavoriteTiles(
              img: dummyImg1,
              title: 'Original Teriyaki Chic...',
              onTap: () {},
              onHeartTap: () {},
            );
          },
        ),
      );
    });
  }
}

class FavoriteTiles extends StatelessWidget {
  const FavoriteTiles({
    Key? key,
    required this.img,
    required this.title,
    required this.onHeartTap,
    required this.onTap,
  }) : super(key: key);

  final String img, title;
  final VoidCallback onTap, onHeartTap;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      bool isDark = themeController.isDarkTheme.value;
      return Container(
        height: 88,
        margin: EdgeInsets.only(
          bottom: 20,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: isDark ? kDarkInputBgColor : kSeoulColor3,
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: onTap,
            borderRadius: BorderRadius.circular(16),
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 15,
              ),
              child: Row(
                children: [
                  CommonImageView(
                    height: 56,
                    width: 56,
                    radius: 13.0,
                    url: img,
                  ),
                  Expanded(
                    child: MyText(
                      paddingLeft: 15,
                      text: title,
                      size: 14,
                      weight: FontWeight.w500,
                      maxLines: 1,
                      overFlow: TextOverflow.ellipsis,
                      color: isDark ? kPrimaryColor : kBlackColor2,
                    ),
                  ),
                  GestureDetector(
                    onTap: onHeartTap,
                    child: Image.asset(
                      Assets.imagesHeartFilled,
                      height: 21,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
