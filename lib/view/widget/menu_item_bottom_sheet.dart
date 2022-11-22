import 'package:elias_weam_food2/constant/color.dart';
import 'package:elias_weam_food2/generated/assets.dart';
import 'package:elias_weam_food2/main.dart';
import 'package:elias_weam_food2/view/widget/common_image_view.dart';
import 'package:elias_weam_food2/view/widget/custom_check_box_tile.dart';
import 'package:elias_weam_food2/view/widget/my_button.dart';
import 'package:elias_weam_food2/view/widget/my_text.dart';
import 'package:elias_weam_food2/view/widget/quantity_manager.dart';
import 'package:elias_weam_food2/view/widget/simple_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MenuItemBottomSheet extends StatefulWidget {
   MenuItemBottomSheet({
    Key? key,
    required this.onAddToCartTap,
    this.buttonText,
  }) : super(key: key);

  final VoidCallback? onAddToCartTap;
  String? buttonText;

  @override
  State<MenuItemBottomSheet> createState() => _MenuItemBottomSheetState();
}

class _MenuItemBottomSheetState extends State<MenuItemBottomSheet> {
  bool isLiked = false;

  void onLikeTap() {
    setState(() {
      isLiked = !isLiked;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SimpleBottomSheet(
      height: Get.height * 0.9,
      content: Stack(
        children: [
          ListView(
            shrinkWrap: true,
            padding: EdgeInsets.fromLTRB(20, 10, 20, 100),
            physics: BouncingScrollPhysics(),
            children: [
              CommonImageView(
                height: 204,
                radius: 16.0,
                imagePath: Assets.imagesBurgerLarge,
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
                        MyText(
                          text: 'German hamburger',
                          size: 20,
                          weight: FontWeight.w700,
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
                  GestureDetector(
                    onTap: onLikeTap,
                    child: Image.asset(
                      isLiked
                          ? Assets.imagesHeartFill
                          : Assets.imagesHeartEmpty,
                      height: 22,
                      color: kSecondaryColor,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  QuantityManager(
                    onLessTap: () {},
                    value: '1',
                    onMoreTap: () {},
                  ),
                  MyText(
                    paddingLeft: 15,
                    text: '\$19.99',
                    size: 16,
                    weight: FontWeight.w500,
                    color: kSecondaryColor,
                  ),
                ],
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
              customHeading('Sauce'),
              Container(
                decoration: ContainerDec.menuItemDec,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    CustomCheckBoxTile(
                      title: 'Teriyaki',
                      trailingText: '+\$0',
                      isChecked: true,
                      onTap: () {},
                    ),
                    Image.asset(
                      Assets.imagesDivider,
                      width: Get.width,
                    ),
                    CustomCheckBoxTile(
                      title: 'Yakiniku',
                      trailingText: '+\$0',
                      isChecked: false,
                      onTap: () {},
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              customHeading('Add a Topping?'),
              Container(
                decoration: ContainerDec.menuItemDec,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    CustomCheckBoxTile(
                      title: 'Omelet',
                      trailingText: '+\$2',
                      isChecked: false,
                      onTap: () {},
                    ),
                    Image.asset(
                      Assets.imagesDivider,
                      width: Get.width,
                    ),
                    CustomCheckBoxTile(
                      title: 'Sausage',
                      trailingText: '+\$3',
                      isChecked: true,
                      onTap: () {},
                    ),
                    Image.asset(
                      Assets.imagesDivider,
                      width: Get.width,
                    ),
                    CustomCheckBoxTile(
                      title: 'Cheese',
                      trailingText: '+\$5',
                      isChecked: true,
                      onTap: () {},
                    ),
                  ],
                ),
              ),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 20,
              ),
              child: MyButton(
                height: 54,
                buttonText: widget.buttonText ??  'Add to Cart (\$41.99)',
                onTap: widget.onAddToCartTap!,
              ),
            ),
          ),
        ],
      ),
    );
  }

  MyText customHeading(String heading) {
    return MyText(
      text: heading,
      size: 18,
      weight: FontWeight.w500,
      paddingBottom: 12,
    );
  }
}
