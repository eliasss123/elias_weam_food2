import 'dart:ui';

import 'package:elias_weam_food2/constant/color.dart';
import 'package:elias_weam_food2/constant/instance.dart';
import 'package:elias_weam_food2/generated/assets.dart';
import 'package:elias_weam_food2/view/widget/common_image_view.dart';
import 'package:elias_weam_food2/view/widget/edit_merchant_app_dialog.dart';
import 'package:elias_weam_food2/view/widget/my_button.dart';
import 'package:elias_weam_food2/view/widget/my_text.dart';
import 'package:elias_weam_food2/view/widget/simple_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class EditPanelItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      bool isEnglish = languageController.isEnglish.value;
      return SimpleBottomSheet(
        height: Get.height * 0.9,
        content: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.fromLTRB(20, 10, 20, 100),
          physics: BouncingScrollPhysics(),
          children: [
            Stack(
              children: [
                CommonImageView(
                  height: 204,
                  radius: 16.0,
                  imagePath: Assets.imagesBurgerLarge,
                ),
                Positioned(
                  bottom: 15,
                  right: 15,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(
                        sigmaY: 2,
                        sigmaX: 2,
                      ),
                      child: GestureDetector(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (_) {
                              return changeItemImage();
                            },
                          );
                        },
                        child: Container(
                          width: 73,
                          height: 25,
                          color: kPrimaryColor.withOpacity(0.40),
                          child: Center(
                            child: MyText(
                              text: 'Change',
                              size: 14,
                              weight: FontWeight.w500,
                              color: kBlackColor,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          MyText(
                            text: 'German hamburger',
                            size: 20,
                            weight: FontWeight.w700,
                          ),
                          GestureDetector(
                            onTap: () {
                              showDialog(
                                context: context,
                                builder: (_) {
                                  return changeItemDetails();
                                },
                              );
                            },
                            child: Image.asset(
                              Assets.imagesEditPencil,
                              height: 22,
                            ),
                          ),
                        ],
                      ),
                      MyText(
                        paddingTop: 8,
                        text: 'Pansi Resturant ',
                        size: 14,
                        weight: FontWeight.w500,
                        color: kTertiaryColor,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            MyText(
              text: '₪19.99',
              size: 16,
              weight: FontWeight.w500,
              color: kSecondaryColor,
            ),
            SizedBox(
              height: 30,
            ),
            Image.asset(
              Assets.imagesDivider,
              width: Get.width,
            ),
            SizedBox(
              height: 30,
            ),
            customHeading(
              'Sauce',
              onEditTap: () {
                showDialog(
                  context: context,
                  builder: (_) {
                    return changeItemDetails();
                  },
                );
              },
            ),
            Container(
              decoration: ContainerDec.border3R16,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: List.generate(
                      2,
                      (index) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            EditPanelItemTiles(
                              title: 'Teriyaki',
                              trailingText: '+₪0',
                            ),
                            Image.asset(
                              Assets.imagesDivider,
                              width: Get.width,
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                  MyText(
                    paddingTop: 12,
                    paddingBottom: 12,
                    paddingLeft: isEnglish ? 14 : 0,
                    paddingRight: isEnglish ? 0 : 14,
                    text: '+ Add',
                    size: 16,
                    weight: FontWeight.w500,
                    color: Color(0xff292929),
                    onTap: () {},
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            customHeading(
              'Add a Topping?',
              onEditTap: () {
                showDialog(
                  context: context,
                  builder: (_) {
                    return changeItemDetails();
                  },
                );
              },
            ),
            Container(
              decoration: ContainerDec.border3R16,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: List.generate(
                      2,
                      (index) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            EditPanelItemTiles(
                              title: index == 0 ? 'Omelet' : 'Sausage',
                              trailingText: '+₪2',
                            ),
                            Image.asset(
                              Assets.imagesDivider,
                              width: Get.width,
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                  MyText(
                    paddingTop: 12,
                    paddingBottom: 12,
                    paddingLeft: isEnglish ? 14 : 0,
                    paddingRight: isEnglish ? 0 : 14,
                    text: '+ Add',
                    size: 16,
                    weight: FontWeight.w500,
                    color: Color(0xff292929),
                    onTap: () {},
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    });
  }

  EditMerchantAppDialog changeItemDetails() {
    return EditMerchantAppDialog(
      children: [
        MyButton(
          radius: 10.0,
          buttonText: 'Item name',
          onTap: () {},
        ),
        SizedBox(
          height: 15,
        ),
        MyButton(
          radius: 10.0,
          buttonText: 'Item picture',
          onTap: () {},
        ),
        SizedBox(
          height: 15,
        ),
        MyButton(
          radius: 10.0,
          buttonText: 'Item price',
          onTap: () {},
        ),
        SizedBox(
          height: 15,
        ),
        MyButton(
          radius: 10.0,
          buttonText: 'Item description',
          onTap: () {},
        ),
        SizedBox(
          height: 15,
        ),
        MyButton(
          radius: 10.0,
          bgColor: kUnSelectedButtonColor,
          buttonText: 'Done and go to item',
          onTap: () {},
        ),
        SizedBox(
          height: 15,
        ),
        MyButton(
          radius: 10.0,
          bgColor: kUnSelectedButtonColor,
          buttonText: 'Back',
          onTap: () => Get.back(),
        ),
      ],
    );
  }

  EditMerchantAppDialog changeItemImage() {
    return EditMerchantAppDialog(
      children: [
        MyButton(
          radius: 10.0,
          buttonText: 'Take a photo',
          onTap: () {},
        ),
        SizedBox(
          height: 15,
        ),
        MyButton(
          radius: 10.0,
          buttonText: 'Choose from gallery',
          onTap: () {},
        ),
        SizedBox(
          height: 15,
        ),
        MyButton(
          radius: 10.0,
          bgColor: kUnSelectedButtonColor,
          buttonText: 'Back',
          onTap: () => Get.back(),
        ),
      ],
    );
  }

  Widget customHeading(String heading, {VoidCallback? onEditTap}) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 12,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          MyText(
            text: heading,
            size: 18,
            weight: FontWeight.w500,
          ),
          GestureDetector(
            onTap: onEditTap,
            child: Image.asset(
              Assets.imagesEditPencil,
              height: 22,
            ),
          ),
        ],
      ),
    );
  }
}

class EditPanelItemTiles extends StatelessWidget {
  EditPanelItemTiles({
    Key? key,
    required this.title,
    required this.trailingText,
    this.marginVertical = 12.0,
  }) : super(key: key);

  final String title, trailingText;
  double? marginVertical;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: marginVertical!,
        horizontal: 14,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: MyText(
              text: title,
              size: 16,
              color: Color(0xff292929),
            ),
          ),
          MyText(
            text: trailingText,
            size: 16,
            weight: FontWeight.w500,
            color: kGreyColor4,
          ),
        ],
      ),
    );
  }
}
