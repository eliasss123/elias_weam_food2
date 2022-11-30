import 'dart:async';
import 'package:elias_weam_food2/constant/color.dart';
import 'package:elias_weam_food2/generated/assets.dart';
import 'package:elias_weam_food2/main.dart';
import 'package:elias_weam_food2/view/widget/common_image_view.dart';
import 'package:elias_weam_food2/view/widget/map_tooltip.dart';
import 'package:elias_weam_food2/view/widget/my_button.dart';
import 'package:elias_weam_food2/view/widget/my_text.dart';
import 'package:elias_weam_food2/view/widget/simple_app_bar.dart';
import 'package:elias_weam_food2/view/widget/simple_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddressList extends StatefulWidget {
  @override
  State<AddressList> createState() => _AddressListState();
}

class _AddressListState extends State<AddressList> {
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
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: ListView(
                    shrinkWrap: true,
                    padding: EdgeInsets.zero,
                    physics: BouncingScrollPhysics(),
                    children: [
                      MyText(
                        text: 'My Addresses',
                        size: 18,
                        weight: FontWeight.w500,
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Column(
                        children: List.generate(
                          3,
                          (index) {
                            return AddressCard(
                              imgUrl: dummyImg1,
                              locName: 'john’s apartment ',
                              locAddress: '27H8+RC Mi’ilya, Israel',
                              isHome: index == 0 ? true : false,
                              onChange: () {},
                              onEdit: () {},
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 30,
                    vertical: 20,
                  ),
                  child: MyButton(
                    buttonText: 'Add new address',
                    onTap: () {},
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

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

class AddressCard extends StatelessWidget {
  final String imgUrl, locName, locAddress;
  final bool isHome;
  final VoidCallback onChange, onEdit;

  const AddressCard({
    super.key,
    required this.imgUrl,
    required this.locName,
    required this.locAddress,
    required this.isHome,
    required this.onChange,
    required this.onEdit,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CommonImageView(
              width: 68,
              height: 68,
              radius: 8.0,
              url: imgUrl,
            ),
            SizedBox(
              width: 15,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  MyText(
                    text: locName,
                    size: 16,
                    weight: FontWeight.w700,
                    paddingBottom: 7,
                  ),
                  MyText(
                    text: locAddress,
                    size: 14,
                    weight: FontWeight.w500,
                    color: kGreyColor5,
                    paddingBottom: 15,
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(
          height: 15,
        ),
        Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MyText(
                  text: 'Saved as',
                  size: 12,
                  weight: FontWeight.w500,
                  color: kGreyColor5,
                ),
                MyText(
                  text: isHome ? 'Home' : '',
                  size: 12,
                  weight: FontWeight.w500,
                ),
              ],
            ),
            SizedBox(
              width: 30,
            ),
            Expanded(
              child: Row(
                children: [
                  GestureDetector(
                    onTap: onChange,
                    child: Container(
                      height: 36,
                      width: 92,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: kLightGreenColor,
                      ),
                      child: Center(
                        child: MyText(
                          text: 'Delete',
                          size: 14,
                          color: kSecondaryColor,
                          weight: FontWeight.w500,
                          letterSpacing: 0.0,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  GestureDetector(
                    onTap: onEdit,
                    child: Container(
                      height: 36,
                      width: 75,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: kBorderColor2,
                      ),
                      child: Center(
                        child: MyText(
                          text: 'Edit',
                          size: 14,
                          color: kBlackColor2,
                          weight: FontWeight.w500,
                          letterSpacing: 0.0,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(
          height: 30,
        ),
        Container(
          height: 1,
          color: kBorderColor3,
        ),
        SizedBox(
          height: 30,
        ),
      ],
    );
  }
}
