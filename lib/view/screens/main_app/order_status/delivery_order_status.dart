import 'dart:async';
import 'package:elias_weam_food2/constant/color.dart';
import 'package:elias_weam_food2/generated/assets.dart';
import 'package:elias_weam_food2/model/recent_order_model/recent_order_model.dart';
import 'package:elias_weam_food2/view/screens/main_app/cart_and_checkout/my_cart/order_receipt.dart';
import 'package:elias_weam_food2/view/screens/main_app/location/live_tracking.dart';
import 'package:elias_weam_food2/view/widget/common_image_view.dart';
import 'package:elias_weam_food2/view/widget/my_button.dart';
import 'package:elias_weam_food2/view/widget/my_text.dart';
import 'package:elias_weam_food2/view/widget/simple_bottom_sheet.dart';
import 'package:elias_weam_food2/view/widget/support_center.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TrackOrder extends StatefulWidget {
  @override
  State<TrackOrder> createState() => _TrackOrderState();
}

class _TrackOrderState extends State<TrackOrder> {
  final List<Map<String, dynamic>> orderStatus = [
    {
      'icon': Assets.imagesOrderGreen,
      'iconSize': 20.84,
      'isCompleted': true,
    },
    {
      'icon': Assets.imagesCooking,
      'iconSize': 23.0,
      'isCompleted': true,
    },
    {
      'icon': Assets.imagesScooter,
      'iconSize': 29.18,
      'isCompleted': true,
    },
    {
      'icon': Assets.imagesUnCompleted,
      'iconSize': 20.84,
      'isCompleted': false,
    },
  ];

  final List<Map<String, dynamic>> orderActivities = [
    {
      'title': 'Your order has been received',
      'isActive': true,
    },
    {
      'title': 'The restaurant is preparing your food',
      'isActive': true,
    },
    {
      'title': 'Your order has been picked up for delivery',
      'isActive': true,
    },
    {
      'title': 'Order arriving soon!',
      'isActive': false,
    },
  ];

  @override
  void initState() {
    super.initState();
    triggerBottomSheet();
  }

  void triggerBottomSheet() {
    Timer(
      Duration(
        seconds: 1,
      ),
      () {
        showModalBottomSheet(
          enableDrag: true,
          isScrollControlled: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
          context: context,
          builder: (_) {
            var platform = Theme.of(context).platform;
            return SimpleBottomSheet(
              height: Get.height * 0.9,
              content: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      child: ListView(
                        shrinkWrap: true,
                        padding: EdgeInsets.zero,
                        physics: BouncingScrollPhysics(),
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Wrap(
                                  alignment: WrapAlignment.center,
                                  children: [
                                    MyText(
                                      text: 'Estimated delivery time is ',
                                      size: 17,
                                      weight: FontWeight.w500,
                                      letterSpacing: 0.0,
                                    ),
                                    MyText(
                                      text: '6:19 PM',
                                      size: 17,
                                      weight: FontWeight.w700,
                                      letterSpacing: 0.0,
                                    ),
                                  ],
                                ),
                                MyText(
                                  paddingTop: 10,
                                  text:
                                      'Your order is already on its way to you!',
                                  size: 14,
                                  color: kBlackColor.withOpacity(0.5),
                                  align: TextAlign.center,
                                  letterSpacing: 0.0,
                                  paddingBottom: 30,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: List.generate(
                                    4,
                                    (index) {
                                      var data = orderStatus[index];
                                      return index == 3
                                          ? Image.asset(
                                              data['icon'],
                                              height: data['iconSize'],
                                            )
                                          : Expanded(
                                              child: Row(
                                                children: [
                                                  Image.asset(
                                                    data['icon'],
                                                    height: data['iconSize'],
                                                  ),
                                                  Expanded(
                                                    child: Padding(
                                                      padding: const EdgeInsets
                                                          .symmetric(
                                                        horizontal: 8,
                                                      ),
                                                      child: Image.asset(
                                                        Assets.imagesLine,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            );
                                    },
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.symmetric(vertical: 30),
                                  height: 1,
                                  color: kBlackColor5,
                                ),
                                SupportCenter(
                                  orderNo: '701',
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                              ],
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(
                              vertical: 20,
                              horizontal: 15,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(14),
                              border: Border.all(
                                width: 1.0,
                                color: kBorderColor2,
                              ),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                MyText(
                                  text: 'Order status activities',
                                  letterSpacing: 0.0,
                                  weight: FontWeight.w500,
                                  paddingBottom: 25,
                                ),
                                orderActivitiesStepper(),
                                SizedBox(
                                  height: 15,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            height: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(14),
                              border: Border.all(
                                width: 1.0,
                                color: kBorderColor2,
                              ),
                            ),
                            child: Material(
                              color: Colors.transparent,
                              child: InkWell(
                                borderRadius: BorderRadius.circular(13),
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
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 10,
                                  ),
                                  child: Row(
                                    children: [
                                      Image.asset(
                                        Assets.imagesOrders,
                                        height: 26,
                                        color: kSecondaryColor,
                                      ),
                                      Expanded(
                                        child: MyText(
                                          paddingLeft: 15,
                                          text: 'Order Receipt',
                                          size: 16,
                                          weight: FontWeight.w500,
                                          color: kGreyColor5.withOpacity(0.70),
                                        ),
                                      ),
                                      Image.asset(
                                        Assets.imagesArrowRight,
                                        height: 22,
                                        color: kSecondaryColor,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: 15,
                        right: 15,
                        bottom: platform == TargetPlatform.iOS ? 3 : 0,
                      ),
                      child: MyButton(
                        buttonText: 'Live tracking',
                        onTap: () => Get.to(
                          () => LiveTracking(),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

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
                  Assets.imagesSimpleMap,
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
                    imagePath: Assets.imagesCurrentLoc,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 50,
            left: 20,
            child: Align(
              alignment: Alignment.topLeft,
              child: GestureDetector(
                onTap: () => Get.back(),
                child: Image.asset(
                  Assets.imagesBackRoundedBlack,
                  height: 43,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget orderActivitiesStepper() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: List.generate(
        orderActivities.length,
        (index) {
          var data = orderActivities[index];
          return index == 3
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    data['isActive'] == true
                        ? Image.asset(
                            Assets.imagesCheckRounded,
                            height: 17,
                          )
                        : Image.asset(
                            Assets.imagesInProgress,
                            height: 17,
                          ),
                    Expanded(
                      child: MyText(
                        paddingLeft: 15,
                        size: 13,
                        weight: FontWeight.w500,
                        color: data['isActive'] == true
                            ? kSecondaryColor
                            : kGreyColor3,
                        text: data['title'],
                        letterSpacing: 0.0,
                        maxLines: 1,
                        overFlow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        data['isActive'] == true
                            ? Image.asset(
                                Assets.imagesCheckRounded,
                                height: 17,
                              )
                            : Image.asset(
                                Assets.imagesInProgress,
                                height: 17,
                              ),
                        Expanded(
                          child: MyText(
                            paddingLeft: 15,
                            size: 13,
                            weight: FontWeight.w500,
                            color: data['isActive'] == true
                                ? kSecondaryColor
                                : kGreyColor3,
                            text: data['title'],
                            letterSpacing: 0.0,
                            maxLines: 1,
                            overFlow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 8,
                      ),
                      child: Image.asset(
                        Assets.imagesLineVertical,
                        height: 35,
                        color: data['isActive'] == true
                            ? kSecondaryColor
                            : kGreyColor3,
                      ),
                    ),
                  ],
                );
        },
      ),
    );
  }
}
