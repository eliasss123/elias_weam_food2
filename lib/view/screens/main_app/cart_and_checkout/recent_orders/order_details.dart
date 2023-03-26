import 'package:elias_weam_food2/constant/color.dart';
import 'package:elias_weam_food2/constant/instance.dart';
import 'package:elias_weam_food2/generated/assets.dart';
import 'package:elias_weam_food2/model/recent_order_model/recent_order_model.dart';
import 'package:elias_weam_food2/view/widget/my_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderDetails extends StatelessWidget {
  OrderDetails({
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
      return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Card(
            color: isDark ? kDarkInputBgColor : kPrimaryColor,
            margin: EdgeInsets.all(10),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
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
                        width: 15,
                      ),
                      GestureDetector(
                        onTap: () => Get.back(),
                        child: Image.asset(
                          Assets.imagesX,
                          height: 18,
                          color: isDark ? kPrimaryColor : kBlackColor2,
                        ),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                    ],
                  ),
                  MyText(
                    text: 'order_details'.tr,
                    size: 23,
                    align: TextAlign.center,
                    paddingBottom: 10,
                    color: isDark ? kPrimaryColor : kBlackColor2,
                  ),
                  MyText(
                    text: '${'order_number'.tr} #$orderNo',
                    size: 12,
                    color: kSecondaryColor,
                    align: TextAlign.center,
                    paddingBottom: 2,
                  ),
                  MyText(
                    text: '$restaurantName',
                    size: 12,
                    color: kSecondaryColor,
                    align: TextAlign.center,
                    paddingBottom: 20,
                  ),
                  Container(
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: isDark ? kDarkInputBgColor2 : kSeoulColor5,
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
                                          paddingLeft: isEnglish ? 15 : 0,
                                          text: '₪${data.itemPrice}',
                                          size: 14,
                                          color: kGreyColor4,
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
                                                var subItems = data.subItems[i];
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
                ],
              ),
            ),
          ),
        ],
      );
    });
  }
}
