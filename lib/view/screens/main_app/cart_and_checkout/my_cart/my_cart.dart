import 'package:elias_weam_food2/constant/color.dart';
import 'package:elias_weam_food2/generated/assets.dart';
import 'package:elias_weam_food2/view/widget/common_image_view.dart';
import 'package:elias_weam_food2/view/widget/menu_item_bottom_sheet.dart';
import 'package:elias_weam_food2/view/widget/my_button.dart';
import 'package:elias_weam_food2/view/widget/my_text.dart';
import 'package:elias_weam_food2/view/widget/quantity_manager.dart';
import 'package:flutter/material.dart';

class MyCart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 65,
        centerTitle: true,
        title: MyText(
          text: 'My Cart',
          size: 21.5,
          letterSpacing: 0.4,
          weight: FontWeight.w800,
          // paddingTop: 8,
          paddingBottom: 6,
        ),
      ),
      body: Stack(
        children: [
          ListView(
            shrinkWrap: true,
            padding: EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 10,
            ),
            physics: BouncingScrollPhysics(),
            children: [
              DeliveryCard(
                deliveryTo: 'Home',
                address: '27H8+RC Mi’ilya , bornad street, Israel',
                distance: '2.5',
                onTap: () {},
              ),
              MyText(
                paddingTop: 30,
                paddingBottom: 20,
                text: 'Your Order (3)',
                size: 17,
                weight: FontWeight.w700,
              ),
              ListView.builder(
                shrinkWrap: true,
                padding: EdgeInsets.only(
                  bottom: 80,
                ),
                physics: BouncingScrollPhysics(),
                itemCount: 6,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        backgroundColor: Colors.transparent,
                        elevation: 0,
                        isScrollControlled: true,
                        builder: (_) => MenuItemBottomSheet(
                          onAddToCartTap: () {},
                          buttonText: 'Save changes',
                        ),
                      );
                    },
                    child: Container(
                      padding: EdgeInsets.only(bottom: 20),
                      margin: EdgeInsets.only(
                        bottom: 20,
                      ),
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            width: 1.0,
                            color: kBorderColor3,
                          ),
                        ),
                      ),
                      child: IntrinsicHeight(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CommonImageView(
                              width: 85,
                              height: 85,
                              radius: 14.0,
                              imagePath: Assets.imagesBurger,
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  MyText(
                                    text: 'German hamburger',
                                    size: 16,
                                    weight: FontWeight.w500,
                                    paddingBottom: 20,
                                  ),
                                  Row(
                                    children: [
                                      QuantityManager(
                                        value: '1',
                                        onLessTap: () {},
                                        onMoreTap: () {},
                                      ),
                                      SizedBox(
                                        width: 15,
                                      ),
                                      MyText(
                                        text: '\$19.99',
                                        size: 16,
                                        weight: FontWeight.w500,
                                        color: kSecondaryColor,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                child: MyButton(
                  buttonText: 'Place Order',
                  onTap: () {},
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class DeliveryCard extends StatelessWidget {
  const DeliveryCard({
    Key? key,
    required this.deliveryTo,
    required this.address,
    required this.distance,
    required this.onTap,
  }) : super(key: key);

  final String deliveryTo, address, distance;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 101,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: kSecondaryColor,
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          splashColor: kPrimaryColor.withOpacity(0.1),
          highlightColor: kPrimaryColor.withOpacity(0.1),
          borderRadius: BorderRadius.circular(16),
          child: Padding(
            padding: EdgeInsets.fromLTRB(20, 10, 16, 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MyText(
                      text: 'Delivery to $deliveryTo',
                      size: 16,
                      weight: FontWeight.w700,
                      color: kPrimaryColor,
                      paddingBottom: 2,
                    ),
                    Image.asset(
                      Assets.imagesArrowRight,
                      height: 24,
                    ),
                  ],
                ),
                MyText(
                  text: '$address',
                  size: 14,
                  weight: FontWeight.w400,
                  color: kPrimaryColor,
                  paddingBottom: 7,
                ),
                Container(
                  height: 24,
                  width: 59,
                  padding: EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: kPrimaryColor,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Center(
                    child: MyText(
                      text: '$distance km',
                      size: 12,
                      weight: FontWeight.w700,
                      color: kSecondaryColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
