import 'package:elias_weam_food2/generated/assets.dart';
import 'package:elias_weam_food2/view/widget/common_image_view.dart';
import 'package:elias_weam_food2/view/widget/my_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PinLocation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomRight,
        children: [
          Container(
            height: Get.height,
            width: Get.width,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  Assets.imagesMap,
                ),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 50, 20, 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(
                        Assets.imagesArrowBack,
                        height: 24,
                      ),
                      MyText(
                        text: 'Pin Location',
                        size: 21,
                        weight: FontWeight.w700,
                      ),
                      Container(
                        width: 20,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 15,
            right: 10,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Align(
                  child: CommonImageView(
                    height: 45,
                    width: 45,
                    radius: 12.0,
                    imagePath: Assets.imagesMapSearch,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Align(
                  child: CommonImageView(
                    height: 45,
                    width: 45,
                    radius: 12.0,
                    imagePath: Assets.imagesCurrentLoc,
                  ),
                ),
              ],
            ),
          ),
          Center(
            child: Image.asset(
              Assets.imagesDestination,
              height: 92,
            ),
          ),
          Positioned(
            top: 150,
            right: 80,
            child: Align(
              alignment: Alignment.topRight,
              child: Image.asset(
                Assets.imagesMyLocation,
                height: 59,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
