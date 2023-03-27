import 'package:elias_weam_food2/constant/color.dart';
import 'package:elias_weam_food2/constant/instance.dart';
import 'package:elias_weam_food2/generated/assets.dart';
import 'package:elias_weam_food2/model/recent_order_model/recent_order_model.dart';
import 'package:elias_weam_food2/view/screens/main_app/bottom_nav_bar/bottom_nav_bar.dart';
import 'package:elias_weam_food2/view/screens/main_app/cart_and_checkout/my_cart/order_receipt.dart';
import 'package:elias_weam_food2/view/screens/main_app/order_status/delivery_order_status.dart';
import 'package:elias_weam_food2/view/screens/support/support.dart';
import 'package:elias_weam_food2/view/widget/my_button.dart';
import 'package:elias_weam_food2/view/widget/my_text.dart';
import 'package:elias_weam_food2/view/widget/support_center.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class PickupOrderStatus extends StatelessWidget {
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
      'icon': Assets.imagesPickUp,
      'iconSize': 29.18,
      'isCompleted': false,
    },
    {
      'icon': Assets.imagesUnCompleted,
      'iconSize': 20.84,
      'isCompleted': false,
    },
  ];

  final List<Map<String, dynamic>> orderStatusFlipped = [
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
      'icon': Assets.imagesFlippedPickUp,
      'iconSize': 29.18,
      'isCompleted': false,
    },
    {
      'icon': Assets.imagesUnCompleted,
      'iconSize': 20.84,
      'isCompleted': false,
    },
  ];

  final List<Map<String, dynamic>> orderActivities = [
    {
      'title': 'your_order_has_been_received',
      'isActive': true,
    },
    {
      'title': 'the_restaurant_is_preparing_your_food',
      'isActive': true,
    },
    {
      'title': 'your_order_preparation_done',
      'isActive': true,
    },
    {
      'title': 'waiting_for_you_to_pick_up_the_order',
      'isActive': false,
    },
  ];

  @override
  Widget build(BuildContext context) {
    var platform = Theme.of(context).platform;
    return Obx(() {
      bool isDark = themeController.isDarkTheme.value;
      bool isEnglish = languageController.isEnglish.value;
      return Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: ListView(
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                physics: BouncingScrollPhysics(),
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 55, 20, 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () => Get.back(),
                              child: RotatedBox(
                                quarterTurns: isEnglish ? 0 : 2,
                                child: Image.asset(
                                  Assets.imagesArrowBack,
                                  height: 24,
                                  color: isDark ? kPrimaryColor : kBlackColor2,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Wrap(
                                alignment: WrapAlignment.center,
                                children: [
                                  MyText(
                                    text: '${'estimated_pick_up_time_is'.tr} ',
                                    size: 17,
                                    weight: FontWeight.w500,
                                    letterSpacing: 0.0,
                                    color:
                                        isDark ? kPrimaryColor : kBlackColor2,
                                  ),
                                  MyText(
                                    text: '6:19 PM',
                                    size: 17,
                                    weight: FontWeight.w700,
                                    letterSpacing: 0.0,
                                    color:
                                        isDark ? kPrimaryColor : kBlackColor2,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        MyText(
                          paddingTop: 10,
                          paddingLeft: 45,
                          paddingRight: 25,
                          text: 'your_order_is_already_done_and_waiting_for_you'
                              .tr,
                          size: 14,
                          color: isDark
                              ? kPrimaryColor.withOpacity(0.5)
                              : kBlackColor.withOpacity(0.5),
                          letterSpacing: 0.0,
                          paddingBottom: 30,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: List.generate(
                                  4,
                                  (index) {
                                    var data = isEnglish
                                        ? orderStatus[index]
                                        : orderStatusFlipped[index];
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
                                                      color: data['isCompleted']
                                                          ? kSecondaryColor
                                                          : kUnselectedColor,
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
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
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
                                text: 'order_status_activities'.tr,
                                letterSpacing: 0.0,
                                weight: FontWeight.w500,
                                paddingBottom: 25,
                                color: isDark ? kPrimaryColor : kBlackColor2,
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
                                        paddingLeft: isEnglish ? 15 : 0,
                                        paddingRight: isEnglish ? 0 : 15,
                                        text: 'order_receipt'.tr,
                                        size: 16,
                                        weight: FontWeight.w500,
                                        color: kGreyColor5.withOpacity(0.70),
                                      ),
                                    ),
                                    RotatedBox(
                                      quarterTurns: isEnglish ? 0 : 2,
                                      child: Image.asset(
                                        Assets.imagesArrowRight,
                                        height: 22,
                                        color: kSecondaryColor,
                                      ),
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
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 30,
                vertical: platform == TargetPlatform.iOS ? 23 : 20,
              ),
              child: MyButton(
                buttonText: 'go_home'.tr,
                onTap: () => Get.offAll(
                  () => BottomNavBar(),
                ),
              ),
            ),
          ],
        ),
      );
    });
  }

  Widget orderActivitiesStepper() {
    return Obx(() {
      bool isDark = themeController.isDarkTheme.value;
      bool isEnglish = languageController.isEnglish.value;
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
                          paddingLeft: isEnglish ? 15 : 0,
                          paddingRight: isEnglish ? 0 : 15,
                          size: 13,
                          weight: FontWeight.w500,
                          color: data['isActive'] == true
                              ? kSecondaryColor
                              : isDark
                                  ? kDarkModeGrey3Color
                                  : kGreyColor3,
                          text: data['title'].toString().tr,
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
                              paddingLeft: isEnglish ? 15 : 0,
                              paddingRight: isEnglish ? 0 : 15,
                              size: 13,
                              weight: FontWeight.w500,
                              color: data['isActive'] == true
                                  ? kSecondaryColor
                                  : kGreyColor3,
                              text: data['title'].toString().tr,
                              letterSpacing: 0.0,
                              maxLines: 1,
                              overFlow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: isEnglish ? 8 : 0,
                          right: isEnglish ? 0 : 8,
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
    });
  }
}

class PickupOrderCompletedDialog extends StatelessWidget {
  const PickupOrderCompletedDialog({
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
                    text: 'keep_tracking_your_order_pick_up'.tr,
                    size: 12,
                    weight: FontWeight.w500,
                    color: isDark ? kPrimaryColor : kBlackColor2,
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
                            () => PickupOrderStatus(),
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
                    isDark ? Assets.imagesVaiLight : Assets.imagesLogoHorizBlk,
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
