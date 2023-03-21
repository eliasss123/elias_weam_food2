import 'package:elias_weam_food2/constant/color.dart';
import 'package:elias_weam_food2/constant/instance.dart';
import 'package:elias_weam_food2/generated/assets.dart';
import 'package:elias_weam_food2/utils/instances.dart';
import 'package:elias_weam_food2/view/screens/main_app/cart_and_checkout/delivery_options/delivery_options.dart';
import 'package:elias_weam_food2/view/screens/main_app/cart_and_checkout/my_cart/confirm_order.dart';
import 'package:elias_weam_food2/view/screens/main_app/cart_and_checkout/recent_orders/recent_orders.dart';
import 'package:elias_weam_food2/view/widget/common_image_view.dart';
import 'package:elias_weam_food2/view/widget/delivery_card.dart';
import 'package:elias_weam_food2/view/widget/menu_item_bottom_sheet.dart';
import 'package:elias_weam_food2/view/widget/my_button.dart';
import 'package:elias_weam_food2/view/widget/my_text.dart';
import 'package:elias_weam_food2/view/widget/quantity_manager.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyCart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      bool isDark = themeController.isDarkTheme.value;
      return Scaffold(
        appBar: AppBar(
          toolbarHeight: 65,
          centerTitle: true,
          title: MyText(
            text: 'My Cart',
            size: 21.5,
            weight: FontWeight.w700,
            color: isDark ? kPrimaryColor : kBlackColor2,
          ),
          actions: [
            Center(
              child: GestureDetector(
                onTap: () => Get.to(
                  () => RecentOrders(),
                ),
                child: Container(
                  margin: EdgeInsets.fromLTRB(0, 0, 20, 0),
                  height: 32,
                  width: 84,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: kSecondaryColor,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        Assets.imagesOrders,
                        height: 20,
                        color: isDark ? kBlackColor2 : kPrimaryColor,
                      ),
                      MyText(
                        paddingLeft: 3,
                        paddingRight: 4,
                        text: 'Orders',
                        size: 13,
                        weight: FontWeight.w700,
                        color: isDark ? kBlackColor2 : kPrimaryColor,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        body: Obx(
          () {
            return cartCheckOutController.isEmptyCart.value
                ? EmptyCartState()
                : Stack(
                    children: [
                      ListView(
                        shrinkWrap: true,
                        padding: EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 10,
                        ),
                        physics: BouncingScrollPhysics(),
                        children: [
                          Obx(() {
                            return DeliveryCard(
                              isPickUp: cartCheckOutController.isPickUp.value,
                              address:
                                  '27H8+RC Mi’ilya , bornad street, Israel',
                              distance: '2.5',
                              onTap: () => Get.to(
                                () => DeliveryOptions(),
                              ),
                            );
                          }),
                          MyText(
                            paddingTop: 30,
                            paddingBottom: 20,
                            text: 'Your Order (3)',
                            size: 17,
                            weight: FontWeight.w700,
                            color: isDark ? kPrimaryColor : kBlackColor2,
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
                                        color: isDark
                                            ? kGreyColor10
                                            : kBorderColor3,
                                      ),
                                    ),
                                  ),
                                  child: IntrinsicHeight(
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
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
                                            crossAxisAlignment:
                                                CrossAxisAlignment.stretch,
                                            children: [
                                              MyText(
                                                text: 'German hamburger',
                                                size: 16,
                                                weight: FontWeight.w500,
                                                paddingBottom: 20,
                                                color: isDark
                                                    ? kPrimaryColor
                                                    : kBlackColor2,
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
                            padding: const EdgeInsets.symmetric(
                              horizontal: 40,
                              vertical: 15,
                            ),
                            child: MyButton(
                              buttonText: 'Place Order',
                              onTap: () => Get.to(
                                () => Obx(() {
                                  return ConfirmOrder(
                                    isPickUp:
                                        cartCheckOutController.isPickUp.value,
                                  );
                                }),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  );
          },
        ),
      );
    });
  }
}

class EmptyCartState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      bool isDark = themeController.isDarkTheme.value;
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 15),
              child: Center(
                child: Image.asset(
                  Assets.imagesCartEmptyState,
                  height: 180,
                ),
              ),
            ),
            MyText(
              paddingTop: 15,
              text: 'Add items to start a cart',
              size: 20,
              weight: FontWeight.w700,
              align: TextAlign.center,
              paddingBottom: 10,
              color: isDark ? kPrimaryColor : kBlackColor2,
            ),
            MyText(
              letterSpacing: 0.0,
              text:
                  'Once you add items from a restaurant or store, your cart will appear here',
              size: 14,
              weight: FontWeight.w500,
              color: kGreyColor9,
              height: 1.6,
              align: TextAlign.center,
              paddingBottom: 30,
            ),
            Center(
              child: SizedBox(
                width: 140,
                child: MyButton(
                  buttonText: 'Start shopping',
                  fontWeight: FontWeight.w500,
                  textColor: isDark ? kBlackColor2 : kPrimaryColor,
                  textSize: 14,
                  radius: 50.0,
                  height: 40,
                  onTap: () => cartCheckOutController.showCartItems(),
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}
