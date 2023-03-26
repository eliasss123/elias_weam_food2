import 'package:elias_weam_food2/constant/color.dart';
import 'package:elias_weam_food2/constant/instance.dart';
import 'package:elias_weam_food2/generated/assets.dart';
import 'package:elias_weam_food2/model/recent_order_model/recent_order_model.dart';
import 'package:elias_weam_food2/utils/instances.dart';
import 'package:elias_weam_food2/view/screens/main_app/bottom_nav_bar/bottom_nav_bar.dart';
import 'package:elias_weam_food2/view/screens/main_app/cart_and_checkout/delivery_options/delivery_options.dart';
import 'package:elias_weam_food2/view/screens/main_app/cart_and_checkout/my_cart/order_receipt.dart';
import 'package:elias_weam_food2/view/screens/main_app/cart_and_checkout/payment_methods/payment_methods.dart';
import 'package:elias_weam_food2/view/screens/main_app/cart_and_checkout/tips_and_notes/tips_and_notes.dart';
import 'package:elias_weam_food2/view/screens/main_app/order_status/delivery_order_status.dart';
import 'package:elias_weam_food2/view/screens/support/support.dart';
import 'package:elias_weam_food2/view/widget/delivery_card.dart';
import 'package:elias_weam_food2/view/widget/my_button.dart';
import 'package:elias_weam_food2/view/widget/my_text.dart';
import 'package:elias_weam_food2/view/widget/payment_detail_bottom_sheet.dart';
import 'package:elias_weam_food2/view/widget/simple_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ConfirmOrder extends StatelessWidget {
  ConfirmOrder({
    required this.isPickUp,
  });

  final bool isPickUp;

  @override
  Widget build(BuildContext context) {
    var platform = Theme.of(context).platform;

    return Obx(() {
      bool isDark = themeController.isDarkTheme.value;
      bool isEnglish = languageController.isEnglish.value;
      return Scaffold(
        appBar: simpleAppBar(
          title: 'confirm_order'.tr,
          titleWeight: FontWeight.w700,
          isDark: isDark,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: ListView(
                shrinkWrap: true,
                padding: EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
                physics: BouncingScrollPhysics(),
                children: [
                  DeliveryCard(
                    address: '27H8+RC Mi’ilya , bornad street, Israel',
                    distance: '2.5',
                    isPickUp: isPickUp,
                    onTap: () => Get.to(
                      () => DeliveryOptions(),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    decoration: ContainerDec.border3R14,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        MyText(
                          paddingRight: isEnglish ? 0 : 15,
                          paddingTop: 20,
                          paddingLeft: 15,
                          text: 'summary'.tr,
                          letterSpacing: 0.3,
                          size: 18,
                          weight: FontWeight.w500,
                          color: isDark ? kPrimaryColor : kBlackColor2,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  MyText(
                                    text: 'price'.tr,
                                    size: 14,
                                    weight: FontWeight.w500,
                                    color:
                                        isDark ? kPrimaryColor : kBlackColor2,
                                  ),
                                  MyText(
                                    text: '₪87.10',
                                    size: 14,
                                    weight: FontWeight.w500,
                                    color:
                                        isDark ? kPrimaryColor : kBlackColor2,
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  MyText(
                                    text: 'delivery_fee'.tr,
                                    size: 14,
                                    weight: FontWeight.w500,
                                    color:
                                        isDark ? kPrimaryColor : kBlackColor2,
                                  ),
                                  MyText(
                                    text: isPickUp ? '-' : '10₪',
                                    size: 14,
                                    weight: FontWeight.w500,
                                    color:
                                        isDark ? kPrimaryColor : kBlackColor2,
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Container(
                                height: 1,
                                color: kBorderColor3,
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  MyText(
                                    text: 'total_payment'.tr,
                                    size: 14,
                                    weight: FontWeight.w700,
                                    color:
                                        isDark ? kPrimaryColor : kBlackColor2,
                                  ),
                                  MyText(
                                    text: '₪88.6',
                                    size: 14,
                                    weight: FontWeight.w700,
                                    color:
                                        isDark ? kPrimaryColor : kBlackColor2,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: 1,
                          color: kBorderColor3,
                          margin: EdgeInsets.only(
                            bottom: 18,
                          ),
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            MyText(
                              onTap: () {
                                showModalBottomSheet(
                                  context: context,
                                  isScrollControlled: true,
                                  backgroundColor: Colors.transparent,
                                  elevation: 0,
                                  builder: (_) {
                                    return PaymentDetailBottomSheet();
                                  },
                                );
                              },
                              paddingLeft: isEnglish ? 15 : 4,
                              text: 'see_details'.tr,
                              color: kSecondaryColor,
                              size: 14,
                              weight: FontWeight.w700,
                              paddingRight: isEnglish ? 4 : 15,
                            ),
                            Icon(
                              Icons.arrow_forward_ios,
                              color: kSecondaryColor,
                              size: 14,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 18,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    decoration: ContainerDec.border3R14,
                    child: InkWell(
                      onTap: isPickUp
                          ? () {}
                          : () {
                              showModalBottomSheet(
                                context: context,
                                isScrollControlled: true,
                                backgroundColor: Colors.transparent,
                                elevation: 0,
                                builder: (_) {
                                  return PaymentMethods();
                                },
                              );
                            },
                      borderRadius: BorderRadius.circular(12),
                      child: Padding(
                        padding: EdgeInsets.all(15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            MyText(
                              text: 'payment'.tr,
                              size: 18,
                              weight: FontWeight.w500,
                              paddingBottom: 17,
                              color: isDark ? kPrimaryColor : kBlackColor2,
                            ),
                            Row(
                              children: [
                                Container(
                                  height: 44,
                                  width: 44,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: kGreyColor6,
                                  ),
                                  child: Center(
                                    child: Image.asset(
                                      Assets.imagesCashOnDelivery,
                                      height: 20,
                                    ),
                                  ),
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
                                        text: isPickUp
                                            ? 'cash_on_pick_up'.tr
                                            : 'cash_on_delivery'.tr,
                                        size: 14,
                                        weight: FontWeight.w500,
                                        color: isDark
                                            ? kPrimaryColor
                                            : kBlackColor2,
                                      ),
                                      MyText(
                                        paddingTop: 8,
                                        text: '₪88.60',
                                        size: 14,
                                        color: kGreyColor5,
                                        weight: FontWeight.w500,
                                      ),
                                    ],
                                  ),
                                ),
                                RotatedBox(
                                  quarterTurns: isEnglish ? 0 : 2,
                                  child: Image.asset(
                                    Assets.imagesArrowRight,
                                    color: isDark
                                        ? kPrimaryColor.withOpacity(0.8)
                                        : kBlackColor,
                                    height: 24,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  isPickUp
                      ? SizedBox()
                      : Container(
                          decoration: ContainerDec.border3R14,
                          child: InkWell(
                            onTap: () => Get.to(
                              () => TipsAndNotes(),
                            ),
                            borderRadius: BorderRadius.circular(12),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: 15,
                                vertical: 13,
                              ),
                              child: Row(
                                children: [
                                  Container(
                                    height: 44,
                                    width: 44,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: kGreyColor6,
                                    ),
                                    child: Center(
                                      child: Image.asset(
                                        Assets.imagesRider,
                                        height: 30,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 15,
                                  ),
                                  Expanded(
                                    child: MyText(
                                      text: 'tips_and_notes_to_the_courier'.tr,
                                      size: 14,
                                      weight: FontWeight.w500,
                                      color:
                                          isDark ? kPrimaryColor : kBlackColor2,
                                    ),
                                  ),
                                  RotatedBox(
                                    quarterTurns: isEnglish ? 0 : 2,
                                    child: Image.asset(
                                      Assets.imagesArrowRight,
                                      color: isDark
                                          ? kPrimaryColor.withOpacity(0.8)
                                          : kBlackColor,
                                      height: 24,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 40,
                vertical: platform == TargetPlatform.iOS ? 23 : 15,
              ),
              child: MyButton(
                buttonText: 'checkout'.tr,
                onTap: () {
                  Get.offAll(() => BottomNavBar());
                  cartCheckOutController.confirmOrder(
                    context,
                    isPickUp,
                  );
                },
              ),
            ),
          ],
        ),
      );
    });
  }
}

class OrderCompletedDialog extends StatelessWidget {
  const OrderCompletedDialog({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      bool isDark = themeController.isDarkTheme.value;
      bool isEnglish = languageController.isEnglish.value;
      return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Card(
            color: isDark ? kDarkInputBgColor : kPrimaryColor,
            margin: EdgeInsets.all(20),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 15,
                vertical: 15,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: isEnglish
                        ? MainAxisAlignment.end
                        : MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: isEnglish ? 0 : 10,
                      ),
                      GestureDetector(
                        onTap: () => Get.back(),
                        child: Image.asset(
                          Assets.imagesX,
                          height: 18,
                          color: isDark ? kPrimaryColor : null,
                        ),
                      ),
                    ],
                  ),
                  MyText(
                    text: 'thank_you_for_your_order'.tr,
                    size: 17,
                    color: kSecondaryColor,
                    fontFamily: GoogleFonts.adamina().fontFamily,
                    align: TextAlign.center,
                    paddingBottom: 20,
                  ),
                  MyText(
                    text: 'keep_tracking_your_order_delivery'.tr,
                    size: 12,
                    weight: FontWeight.w500,
                    color: isDark ? kPrimaryColor : kBlackColor,
                    align: TextAlign.center,
                    paddingBottom: 40,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 40,
                    ),
                    child: Column(
                      children: [
                        MyButton(
                          textColor: isDark ? kBlackColor2 : kPrimaryColor,
                          buttonText: 'track_order'.tr,
                          onTap: () => Get.to(
                            () => TrackOrder(),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        MyButton(
                          textColor: isDark ? kBlackColor2 : kPrimaryColor,
                          buttonText: 'order_details'.tr,
                          onTap: () => Get.to(
                            () => OrderReceipt(
                              orderNo: '701',
                              restaurantName: 'Pie pizza restaurant',
                              subTotal: '87.10',
                              items: [
                                OrderDetailsModel(
                                  itemQuantity: '1',
                                  itemName: 'Squid Sweet and Sour Salad',
                                  itemPrice: '19.99',
                                  subItems: [],
                                ),
                                OrderDetailsModel(
                                  itemQuantity: '1',
                                  itemName: 'Japan Hainanese Sashimi',
                                  itemPrice: '37.99',
                                  subItems: [
                                    OrderDetailsSubItemsModel(
                                      itemName: 'Teriyaki Sause',
                                      itemPrice: '0',
                                    ),
                                    OrderDetailsSubItemsModel(
                                      itemName: 'Omelet',
                                      itemPrice: '2',
                                    ),
                                  ],
                                ),
                                OrderDetailsModel(
                                  itemQuantity: '1',
                                  itemName: 'Black Pepper Beef Lumpia',
                                  itemPrice: '27.12',
                                  subItems: [],
                                ),
                              ],
                              deliveryFee: '1.5',
                              total: '88.6',
                              orderDate: '28/10/2021',
                              orderDeliveryTime: '16:55',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Container(
                    height: 1,
                    color: kBorderColor4,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  MyText(
                    text: 'please_feel_free_to_contact_us_for_any_questions'.tr,
                    size: 12,
                    color: isDark ? kPrimaryColor : kBlackColor,
                    align: TextAlign.center,
                    paddingBottom: 25,
                  ),
                  Center(
                    child: GestureDetector(
                      onTap: () => Get.to(
                        () => Support(),
                      ),
                      child: Container(
                        width: 180,
                        height: 34,
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 1.0,
                            color: kSecondaryColor,
                          ),
                          borderRadius: BorderRadius.circular(
                            10.0,
                          ),
                        ),
                        child: Center(
                          child: MyText(
                            text: 'contact_support'.tr,
                            size: 14,
                            weight: FontWeight.w700,
                            color: kSecondaryColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 70,
                  ),
                  Image.asset(
                    Assets.imagesLogoHorizBlk,
                    height: 52.93,
                  ),
                  SizedBox(
                    height: 25,
                  ),
                ],
              ),
            ),
          ),
        ],
      );
    });
  }
}
