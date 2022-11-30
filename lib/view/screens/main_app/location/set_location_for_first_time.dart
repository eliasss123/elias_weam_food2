import 'dart:async';

import 'package:elias_weam_food2/constant/color.dart';
import 'package:elias_weam_food2/generated/assets.dart';
import 'package:elias_weam_food2/view/screens/main_app/location/pin_location.dart';
import 'package:elias_weam_food2/view/screens/main_app/location/save_address.dart';
import 'package:elias_weam_food2/view/widget/common_image_view.dart';
import 'package:elias_weam_food2/view/widget/map_tooltip.dart';
import 'package:elias_weam_food2/view/widget/my_button.dart';
import 'package:elias_weam_food2/view/widget/my_text.dart';
import 'package:elias_weam_food2/view/widget/save_address_as.dart';
import 'package:elias_weam_food2/view/widget/simple_app_bar.dart';
import 'package:elias_weam_food2/view/widget/simple_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SetLocationForFirstTime extends StatefulWidget {
  @override
  State<SetLocationForFirstTime> createState() =>
      _SetLocationForFirstTimeState();
}

class _SetLocationForFirstTimeState extends State<SetLocationForFirstTime> {
  @override
  void initState() {
    super.initState();
    Timer(
      Duration(seconds: 1),
      () => triggerBottomSheet(),
    );
  }

  void triggerBottomSheet() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      elevation: 0,
      builder: (_) {
        return SimpleBottomSheet(
          height: Get.height * 0.55,
          content: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          MyText(
                            text: 'Detail Address',
                            size: 18,
                            weight: FontWeight.w500,
                          ),
                          Image.asset(
                            Assets.imagesGeoLocation,
                            height: 24,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 44,
                            width: 44,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: kLightGreenColor,
                            ),
                            child: Center(
                              child: Image.asset(
                                Assets.imagesPhMapPinFill,
                                height: 22,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                MyText(
                                  text: 'John’s apartment',
                                  size: 16,
                                  weight: FontWeight.w700,
                                  paddingBottom: 7,
                                ),
                                MyText(
                                  text:
                                      '27H8+RC Mi’ilya, bornad street, Israel',
                                  size: 14,
                                  weight: FontWeight.w500,
                                  color: kGreyColor5,
                                  paddingBottom: 15,
                                ),
                                Row(
                                  children: [
                                    GestureDetector(
                                      onTap: () => Get.to(
                                        () => PinLocation(),
                                      ),
                                      child: Container(
                                        height: 32,
                                        width: 80,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(50),
                                          color: kLightGreenColor,
                                        ),
                                        child: Center(
                                          child: MyText(
                                            text: 'Change',
                                            size: 12,
                                            weight: FontWeight.w700,
                                            color: kSecondaryColor,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        height: 1,
                        color: kBorderColor3,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      SaveAddressAs(addressOp: addressOp),
                      SizedBox(
                        height: 30,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 30,
                  ),
                  child: MyButton(
                    buttonText: 'Continue',
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(35),
                            topRight: Radius.circular(35),
                          ),
                        ),
                        builder: (_) {
                          return SaveAddress();
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  final List<String> addressOp = [
    'Home',
    'Work',
    'Other',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: simpleAppBar(
        title: 'Location',
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 10,
            ),
            child: Stack(
              children: [
                CommonImageView(
                  imagePath: Assets.imagesPickUpMap,
                  height: 236,
                  width: Get.width,
                  radius: 20.0,
                ),
                Positioned(
                  top: 40,
                  right: 40,
                  child: GestureDetector(
                    onTap: () => triggerBottomSheet(),
                    child: mapToolTip(
                      'City Center Hotel Jerusalem',
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
