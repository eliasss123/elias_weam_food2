import 'dart:io';
import 'dart:ui';

import 'package:elias_weam_food2/constant/color.dart';
import 'package:elias_weam_food2/constant/instance.dart';
import 'package:elias_weam_food2/generated/assets.dart';
import 'package:elias_weam_food2/view/widget/common_image_view.dart';
import 'package:elias_weam_food2/view/widget/my_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
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
    required this.isDark,
  }) : super(key: key);

  final String imgUrl, name, deliveryTime, totalReviews;
  final double totalRating;
  final bool isFreeDelivery, isFeatured, isClosed, isLiked;
  double? width, horizontalMargin;
  VoidCallback? onTap, onLikeTap;
  final int deliveryFee;
  final bool isDark;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      bool isEnglish = languageController.isEnglish.value;

      return GestureDetector(
        onTap: onTap,
        child: Container(
          margin: EdgeInsets.symmetric(
            horizontal: horizontalMargin ?? 7,
          ),
          height: languageController.isEnglish.value ? 250 : 260,
          width: width ?? 265,
          decoration: BoxDecoration(
            color: isDark ? kDarkInputBgColor : kPrimaryColor,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: kBlackColor.withOpacity(0.02),
                spreadRadius: 0,
                blurRadius: 10,
                offset: Offset(7, 7),
              ),
            ],
          ),
          child: Stack(
            children: [
              Padding(
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
                      imagePath: imgUrl,
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
                          color: isDark ? kPrimaryColor : kDarkGreyColor,
                          weight: FontWeight.w600,
                        ),
                        MyText(
                          text: '$deliveryTime ${'min'.tr}',
                          size: 12,
                          color: isDark
                              ? kPrimaryColor.withOpacity(0.9)
                              : kBlackColor,
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
                              text: '($totalReviews ${'reviews'.tr})',
                              size: 12,
                              color: isDark
                                  ? kPrimaryColor.withOpacity(0.3)
                                  : kBlackColor.withOpacity(0.4),
                            ),
                          ],
                        ),
                        MyText(
                          text: isFreeDelivery
                              ? 'free_delivery'.tr
                              : '₪$deliveryFee ${'delivery_fee'.tr}',
                          size: 12,
                          color: isDark
                              ? kPrimaryColor.withOpacity(0.4)
                              : kBlackColor.withOpacity(0.4),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Positioned(
                top: 13,
                left: 0,
                right: 0,
                child: Center(
                  child: Container(
                    height: 164,
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    width: Get.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(11),
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          kBlackColor.withOpacity(0.3),
                          kBlackColor.withOpacity(0.0),
                          kBlackColor.withOpacity(0.07),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              isFreeDelivery == false && isFeatured == false
                  ? SizedBox()
                  : Positioned(
                      top: 30,
                      left: 25,
                      right: isEnglish ? 25 : 25,
                      child: Container(
                        width: width ?? 265,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              height: 26,
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8.0),
                                color: kBlackColor.withOpacity(0.40),
                              ),
                              child: Center(
                                child: MyText(
                                  text: isFeatured
                                      ? 'featured'.tr
                                      : isFreeDelivery
                                          ? 'free_delivery'.tr
                                          : '₪ · ₪₪',
                                  size: 12,
                                  weight: FontWeight.w500,
                                  color: kPrimaryColor,
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: onLikeTap,
                              child: Image.asset(
                                isLiked
                                    ? Assets.imagesHeartFill
                                    : Assets.imagesHeartEmpty,
                                height: 17,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
              isClosed
                  ? Positioned(
                      top: 13,
                      left: 0,
                      right: 0,
                      child: Center(
                        child: Container(
                          height: 164,
                          margin: EdgeInsets.symmetric(horizontal: 10),
                          width: Get.width,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(11),
                            color: kClosedColor.withOpacity(0.55),
                          ),
                          child: Center(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: BackdropFilter(
                                filter: ImageFilter.blur(sigmaY: 2, sigmaX: 2),
                                child: Container(
                                  height: 43,
                                  width: 118,
                                  color: Color(0xffD9C6C6).withOpacity(0.3),
                                  child: Center(
                                    child: MyText(
                                      text: 'closed'.tr,
                                      size: 30,
                                      weight: FontWeight.w700,
                                      color: kBlackColor2.withOpacity(0.65),
                                      paddingTop: Platform.isIOS
                                          ? languageController
                                                      .currentIndex.value ==
                                                  1
                                              ? 4
                                              : 0
                                          : null,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
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
