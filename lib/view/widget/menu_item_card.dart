import 'package:elias_weam_food2/constant/color.dart';
import 'package:elias_weam_food2/view/widget/common_image_view.dart';
import 'package:elias_weam_food2/view/widget/my_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MenuItemCard extends StatelessWidget {
  const MenuItemCard({
    Key? key,
    required this.itemImgUrl,
    required this.itemName,
    required this.price,
    required this.onTap,
  }) : super(key: key);

  final String itemImgUrl, itemName, price;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(10),
        height: 223,
        width: 172,
        margin: EdgeInsets.symmetric(
          horizontal: 7,
        ),
        decoration: BoxDecoration(
          color: kPrimaryColor,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.02),
              spreadRadius: 0,
              blurRadius: 8,
              offset: Offset(7, 7),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Stack(
              children: [
                CommonImageView(
                  height: 137,
                  width: Get.width,
                  radius: 11.0,
                  imagePath: itemImgUrl,
                ),
                Container(
                  height: 137,
                  width: Get.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(11),
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        kBlackColor.withOpacity(0.28),
                        kBlackColor.withOpacity(0.0),
                        kBlackColor.withOpacity(0.06),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            MyText(
              paddingTop: 13,
              paddingBottom: 8,
              text: itemName,
              size: 13,
              weight: FontWeight.w500,
              color: kDarkGreyColor,
            ),
            MyText(
              text: '\$$price',
              size: 13,
              weight: FontWeight.w500,
              color: kSecondaryColor,
            ),
          ],
        ),
      ),
    );
  }
}
