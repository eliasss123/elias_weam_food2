import 'package:elias_weam_food2/constant/color.dart';
import 'package:elias_weam_food2/generated/assets.dart';
import 'package:elias_weam_food2/utils/instances.dart';
import 'package:elias_weam_food2/view/screens/merchant_app/edit_merchant_app/change_restaurant_details.dart';
import 'package:elias_weam_food2/view/widget/common_image_view.dart';
import 'package:elias_weam_food2/view/widget/my_button.dart';
import 'package:elias_weam_food2/view/widget/my_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditMerchantAppBar extends StatelessWidget {
  const EditMerchantAppBar({
    Key? key,
    required this.imgUrl,
    required this.name,
    required this.tagLine,
    required this.openingTime,
    required this.closingTime,
    required this.totalReviews,
    required this.distance,
  }) : super(key: key);

  final String imgUrl,
      name,
      tagLine,
      openingTime,
      closingTime,
      totalReviews,
      distance;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      automaticallyImplyLeading: false,
      backgroundColor: kSeoulColor3,
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
                        GestureDetector(
                          onTap: () => Get.back(),
                          child: Image.asset(
                            Assets.imagesRoundedBack,
                            height: 41,
                          ),
                        ),
                        Obx(() {
                          return SizedBox(
                            child: editMerchantAppController.isEditMode.value
                                ? editModeButton(context)
                                : Container(
                              width: 154,
                              child: MyButton(
                                height: 40,
                                radius: 12.0,
                                textSize: 16,
                                buttonText: 'Edit details',
                                onTap: () => editMerchantAppController
                                    .activateEditMode(),
                              ),
                            ),
                          );
                        }),
                        SizedBox(
                          width: 15,
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
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
                            text: 'From $openingTime am to $closingTime pm',
                            size: 15,
                            color: kPrimaryColor.withOpacity(0.77),
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
            ],
          ),
        ),
      ),
    );
  }

  Expanded editModeButton(BuildContext context) {
    return Expanded(
      child: Container(
        height: 40,
        padding: EdgeInsets.symmetric(
          horizontal: 15,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Color(0xffC8C8C8),
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () {
              showDialog(
                context: context,
                builder: (_) {
                  return changeRestaurantDetails(context);
                },
              );
            },
            splashColor: kPrimaryColor.withOpacity(0.1),
            highlightColor: kPrimaryColor.withOpacity(0.1),
            borderRadius: BorderRadius.circular(16),
            child: Center(
              child: MyText(
                text: 'Edit mode activated',
                size: 16,
                weight: FontWeight.w700,
                color: kPrimaryColor,
              ),
            ),
          ),
        ),
      ),
    );
  }

}