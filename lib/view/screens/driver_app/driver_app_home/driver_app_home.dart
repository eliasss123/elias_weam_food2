import 'package:elias_weam_food2/constant/color.dart';
import 'package:elias_weam_food2/generated/assets.dart';
import 'package:elias_weam_food2/view/widget/common_image_view.dart';
import 'package:elias_weam_food2/view/widget/my_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:get/get.dart';


class DriverAppHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
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
              child: GestureDetector(
                onTap: () {},
                child: Image.asset(
                  Assets.imagesMyLocation,
                  height: 59,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 50, 20, 20),
            child:  Container(
              height: 51,
              padding: EdgeInsets.symmetric(
                horizontal: 15,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: kPrimaryColor,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: MyText(
                      text: 'Online',
                      size: 15,
                      weight: FontWeight.w500,
                      color: kBlackColor,
                    ),
                  ),
                  FlutterSwitch(
                    width: 39,
                    height: 24,
                    value: true,
                    onToggle: (value) {
                    },
                    activeColor: kSecondaryColor,
                    inactiveColor: kInActiveSwitchColor,
                    borderRadius: 50.0,
                    toggleSize: 22.0,
                    padding: 2.2,
                    showOnOff: false,
                    toggleColor: kPrimaryColor,
                    inactiveToggleColor: kPrimaryColor,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
