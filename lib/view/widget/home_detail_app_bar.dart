import 'dart:io';
import 'dart:ui';
import 'package:elias_weam_food2/constant/color.dart';
import 'package:elias_weam_food2/constant/instance.dart';
import 'package:elias_weam_food2/generated/assets.dart';
import 'package:elias_weam_food2/view/widget/common_image_view.dart';
import 'package:elias_weam_food2/view/widget/my_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeDetailAppBar extends StatelessWidget {
  const HomeDetailAppBar({
    Key? key,
    required this.imgUrl,
    required this.name,
    required this.tagLine,
    required this.openingTime,
    required this.closingTime,
    required this.totalReviews,
    required this.distance,
    required this.totalRating,
    required this.onLiked,
    required this.isLiked,
    required this.isOutOfRange,
    required this.isClosed,
    required this.isDark,
    required this.isEnglish,
  }) : super(key: key);

  final String imgUrl,
      name,
      tagLine,
      openingTime,
      closingTime,
      totalReviews,
      distance;

  final double totalRating;
  final VoidCallback onLiked;
  final bool isLiked, isOutOfRange, isClosed, isDark, isEnglish;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      automaticallyImplyLeading: false,
      backgroundColor: isDark ? kDarkPrimaryColor : kSeoulColor3,
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
                imagePath: imgUrl,
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
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        RotatedBox(
                          quarterTurns: isEnglish ? 0 : 2,
                          child: GestureDetector(
                            onTap: () => Get.back(),
                            child: Image.asset(
                              isDark
                                  ? Assets.imagesArrowBackDark
                                  : Assets.imagesRoundedBack,
                              height: 41,
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: onLiked,
                          child: Image.asset(
                            isLiked
                                ? Assets.imagesHeartFill
                                : Assets.imagesHeartEmpty,
                            height: 25,
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          isClosed
                              ? Row(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(8.0),
                                      child: BackdropFilter(
                                        filter: ImageFilter.blur(
                                          sigmaY: 2,
                                          sigmaX: 2,
                                        ),
                                        child: Container(
                                          width: 60,
                                          height: 21,
                                          color: Color(0xffC9C9C9)
                                              .withOpacity(0.40),
                                          child: Center(
                                            child: MyText(
                                              text: 'closed'.tr,
                                              size: 14,
                                              weight: FontWeight.w700,
                                              color: kMaroonColor,
                                              paddingTop: Platform.isIOS
                                                  ? languageController
                                                              .currentIndex
                                                              .value ==
                                                          1
                                                      ? 3
                                                      : 0
                                                  : null,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              : SizedBox(),
                          MyText(
                            paddingTop: 5,
                            text: name,
                            size: 28,
                            weight: FontWeight.w700,
                            color: kPrimaryColor,
                            paddingBottom: 12,
                          ),
                          MyText(
                            paddingBottom: 10,
                            text: tagLine,
                            size: 15,
                            weight: FontWeight.w500,
                            color: kPrimaryColor.withOpacity(0.88),
                          ),
                          MyText(
                            paddingBottom: 13,
                            text:
                                '${'from'.tr} $openingTime am ${'to'.tr} $closingTime pm',
                            size: 15,
                            color: kPrimaryColor.withOpacity(0.77),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Wrap(
                                crossAxisAlignment: WrapCrossAlignment.center,
                                spacing: 8.0,
                                children: [
                                  Image.asset(
                                    Assets.imagesStarFill,
                                    height: 15,
                                  ),
                                  MyText(
                                    text: '$totalRating',
                                    size: 14,
                                    color: kPrimaryColor,
                                    weight: FontWeight.w500,
                                  ),
                                  MyText(
                                    text: '($totalReviews ${'reviews'.tr})',
                                    size: 14,
                                    color: kPrimaryColor.withOpacity(0.77),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                  right: isOutOfRange ? 5 : 0,
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8.0),
                                  child: BackdropFilter(
                                    filter: ImageFilter.blur(
                                      sigmaY: 2,
                                      sigmaX: 2,
                                    ),
                                    child: Container(
                                      width: 60,
                                      height: 20,
                                      color: isOutOfRange
                                          ? Color(0xffE19D9D).withOpacity(0.3)
                                          : kPrimaryColor.withOpacity(0.44),
                                      child: Center(
                                        child: MyText(
                                          text: '$distance ${'km'.tr}',
                                          size: 12,
                                          weight: FontWeight.w700,
                                          color: isOutOfRange
                                              ? Color(0xff941616)
                                              : kPrimaryColor,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          isOutOfRange
                              ? MyText(
                                  paddingTop: 3,
                                  align: TextAlign.end,
                                  text: 'out_of_range'.tr,
                                  color: kRedColor,
                                  size: 12,
                                  weight: FontWeight.w700,
                                )
                              : SizedBox(),
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
    );
  }
}
