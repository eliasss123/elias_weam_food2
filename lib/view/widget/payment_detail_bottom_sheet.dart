import 'package:elias_weam_food2/constant/color.dart';
import 'package:elias_weam_food2/constant/instance.dart';
import 'package:elias_weam_food2/view/widget/my_text.dart';
import 'package:elias_weam_food2/view/widget/simple_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PaymentDetailBottomSheet extends StatelessWidget {
  const PaymentDetailBottomSheet({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      bool isDark = themeController.isDarkTheme.value;
      return SimpleBottomSheet(
        height: 373,
        content: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              MyText(
                text: 'Payment Details',
                size: 18,
                weight: FontWeight.w700,
                paddingBottom: 20,
                color: isDark ? kPrimaryColor : kBlackColor2,
              ),
              Container(
                padding: const EdgeInsets.all(15),
                decoration: ContainerDec.border3R14,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        MyText(
                          text: 'Price',
                          size: 14,
                          weight: FontWeight.w500,
                          color: isDark ? kPrimaryColor : kBlackColor2,
                        ),
                        MyText(
                          text: '\$87.10',
                          size: 14,
                          weight: FontWeight.w500,
                          color: isDark ? kPrimaryColor : kBlackColor2,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: List.generate(
                        3,
                        (index) {
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                MyText(
                                  text: 'German hamburger',
                                  size: 12,
                                  color: kLightGreyColor2,
                                ),
                                MyText(
                                  text: '\$19.99',
                                  size: 12,
                                  color: kLightGreyColor2,
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                      height: 1,
                      color: kBorderColor3,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        MyText(
                          text: 'Delivery fee',
                          size: 14,
                          weight: FontWeight.w500,
                          color: isDark ? kPrimaryColor : kBlackColor2,
                        ),
                        MyText(
                          text: '\$1.5',
                          size: 14,
                          weight: FontWeight.w500,
                          color: isDark ? kPrimaryColor : kBlackColor2,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: 1,
                      color: kBorderColor3,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        MyText(
                          text: 'Total Payment',
                          size: 14,
                          weight: FontWeight.w700,
                          color: isDark ? kPrimaryColor : kBlackColor2,
                        ),
                        MyText(
                          text: '\$88.6',
                          size: 14,
                          weight: FontWeight.w700,
                          color: isDark ? kPrimaryColor : kBlackColor2,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
