import 'package:elias_weam_food2/constant/color.dart';
import 'package:elias_weam_food2/constant/instance.dart';
import 'package:elias_weam_food2/generated/assets.dart';
import 'package:elias_weam_food2/model/recent_order_model/recent_order_model.dart';
import 'package:elias_weam_food2/view/widget/my_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderReceipt extends StatelessWidget {
  OrderReceipt({
    super.key,
    required this.orderNo,
    required this.restaurantName,
    required this.subTotal,
    required this.deliveryFee,
    required this.total,
    required this.items,
    required this.orderDate,
    required this.orderDeliveryTime,
  });

  final String orderNo,
      restaurantName,
      subTotal,
      deliveryFee,
      total,
      orderDate,
      orderDeliveryTime;

  final List<OrderDetailsModel> items;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      bool isDark = themeController.isDarkTheme.value;
      bool isEnglish = languageController.isEnglish.value;
      return Scaffold(
        backgroundColor: isDark ? kDarkPrimaryColor : kSeoulColor6,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 25, 20, 30),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () => Get.back(),
                    child: RotatedBox(
                      quarterTurns: isEnglish ? 0 : 2,
                      child: Image.asset(
                        isDark
                            ? Assets.imagesArrowBackDark
                            : Assets.imagesRoundedBackBlk,
                        height: 43,
                        width: 43,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        MyText(
                          paddingTop: 25,
                          text: 'order_receipt'.tr,
                          size: 24,
                          weight: FontWeight.w700,
                          paddingBottom: 7,
                          color: isDark ? kPrimaryColor : kBlackColor2,
                        ),
                        MyText(
                          text: '${'order_number'.tr} #$orderNo',
                          size: 12.5,
                          color: kSecondaryColor,
                          paddingBottom: 3.0,
                        ),
                        MyText(
                          text: '$restaurantName',
                          size: 12,
                          color: kSecondaryColor,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 30,
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView(
                shrinkWrap: true,
                padding: EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 20,
                ),
                physics: BouncingScrollPhysics(),
                children: [
                  Card(
                    color: isDark ? kDarkInputBgColor : kPrimaryColor,
                    elevation: 0,
                    margin: EdgeInsets.only(top: 30),
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
                            height: 5,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              MyText(
                                text: 'subtotal'.tr,
                                size: 14,
                                weight: FontWeight.w500,
                                color: isDark ? kPrimaryColor : kBlackColor2,
                              ),
                              MyText(
                                text: '₪$subTotal',
                                size: 14,
                                weight: FontWeight.w500,
                                color: isDark ? kPrimaryColor : kBlackColor2,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 18,
                          ),
                          Container(
                            height: 1,
                            color: kBorderColor3,
                          ),
                          SizedBox(
                            height: 18,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: List.generate(
                              items.length,
                              (index) {
                                var data = items[index];
                                return Padding(
                                  padding: const EdgeInsets.only(bottom: 8),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: [
                                      Row(
                                        children: [
                                          MyText(
                                            text: '${data.itemQuantity}x',
                                            size: 14,
                                            color: kGreyColor4,
                                            weight: FontWeight.w500,
                                            paddingRight: isEnglish ? 15 : 0,
                                            paddingLeft: isEnglish ? 0 : 15,
                                          ),
                                          Expanded(
                                            child: MyText(
                                              text: '${data.itemName}',
                                              size: 14,
                                              weight: FontWeight.w500,
                                              letterSpacing: 0.0,
                                              color: isDark
                                                  ? kPrimaryColor
                                                  : kBlackColor2,
                                            ),
                                          ),
                                          MyText(
                                            paddingRight: isEnglish ? 0 : 15,
                                            paddingLeft: isEnglish ? 15 : 0,
                                            text: '₪${data.itemPrice}',
                                            size: 14,
                                            color: isDark
                                                ? kPrimaryColor
                                                : kGreyColor4,
                                            weight: FontWeight.w500,
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      data.subItems.length == 0
                                          ? SizedBox()
                                          : Column(
                                              children: List.generate(
                                                data.subItems.length,
                                                (i) {
                                                  var subItems =
                                                      data.subItems[i];
                                                  return Row(
                                                    children: [
                                                      MyText(
                                                        text: '',
                                                        size: 14,
                                                        color: kGreyColor4,
                                                        weight: FontWeight.w500,
                                                        paddingRight: 27,
                                                        paddingBottom: 4,
                                                      ),
                                                      Expanded(
                                                        child: MyText(
                                                          text:
                                                              '${subItems.itemName}',
                                                          size: 12,
                                                          letterSpacing: 0.0,
                                                          color: isDark
                                                              ? kPrimaryColor
                                                              : kBlackColor2,
                                                        ),
                                                      ),
                                                      MyText(
                                                        paddingRight:
                                                            isEnglish ? 0 : 15,
                                                        paddingLeft:
                                                            isEnglish ? 15 : 0,
                                                        text:
                                                            '₪${subItems.itemPrice}',
                                                        size: 12,
                                                        color: kGreyColor4,
                                                      ),
                                                    ],
                                                  );
                                                },
                                              ),
                                            ),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              MyText(
                                text: 'delivery_fee'.tr,
                                weight: FontWeight.w500,
                                color: isDark ? kPrimaryColor : kBlackColor2,
                              ),
                              MyText(
                                text: '₪$deliveryFee',
                                weight: FontWeight.w500,
                                color: isDark ? kPrimaryColor : kBlackColor2,
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              MyText(
                                text: 'total_payment'.tr,
                                size: 14,
                                weight: FontWeight.w700,
                                color: isDark ? kPrimaryColor : kBlackColor2,
                              ),
                              MyText(
                                text: '₪$total',
                                size: 14,
                                weight: FontWeight.w700,
                                color: isDark ? kPrimaryColor : kBlackColor2,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              MyText(
                                text: 'order_date'.tr,
                                size: 14,
                                weight: FontWeight.w500,
                                color: isDark ? kPrimaryColor : kBlackColor2,
                              ),
                              MyText(
                                text: '$orderDate',
                                size: 14,
                                weight: FontWeight.w500,
                                color: isDark ? kPrimaryColor : kBlackColor2,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              MyText(
                                text: 'delivery_time'.tr,
                                size: 14,
                                weight: FontWeight.w500,
                                color: isDark ? kPrimaryColor : kBlackColor2,
                              ),
                              MyText(
                                text: '$orderDeliveryTime',
                                size: 14,
                                weight: FontWeight.w500,
                                color: isDark ? kPrimaryColor : kBlackColor2,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 30, 0, 80),
              child: Image.asset(
                Assets.imagesLogoHorizBlk,
                height: 52.93,
              ),
            ),
          ],
        ),
      );
    });
  }
}
