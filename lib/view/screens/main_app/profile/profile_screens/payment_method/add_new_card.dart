import 'package:elias_weam_food2/constant/color.dart';
import 'package:elias_weam_food2/constant/instance.dart';
import 'package:elias_weam_food2/generated/assets.dart';
import 'package:elias_weam_food2/view/screens/main_app/cart_and_checkout/payment_methods/edit_payment_method_details.dart';
import 'package:elias_weam_food2/view/screens/main_app/profile/profile_screens/payment_method/my_cards.dart';
import 'package:elias_weam_food2/view/widget/my_button.dart';
import 'package:elias_weam_food2/view/widget/my_text.dart';
import 'package:elias_weam_food2/view/widget/simple_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddNewCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      bool isDark = themeController.isDarkTheme.value;
      return SimpleBottomSheet(
        height: Get.height * 0.85,
        content: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Expanded(
                child: ListView(
                  shrinkWrap: true,
                  physics: BouncingScrollPhysics(),
                  padding: EdgeInsets.zero,
                  children: [
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () => Get.back(),
                          child: Icon(
                            Icons.arrow_back,
                            color: isDark ? kPrimaryColor : kBlackColor2,
                          ),
                        ),
                      ],
                    ),
                    MyText(
                      paddingTop: 25,
                      text: 'add_card'.tr,
                      size: 24,
                      weight: FontWeight.w700,
                      paddingBottom: 40,
                      color: isDark ? kPrimaryColor : kBlackColor2,
                    ),
                    EditPaymentMethodFields(
                      label: 'card_holder_name'.tr,
                      hint: 'Alex Smith',
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    EditPaymentMethodFields(
                      label: 'card_number'.tr,
                      hint: '**** **** **** 2542',
                      haveSuffix: true,
                      suffixIcon: Assets.imagesMas,
                      maxLength: 16,
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: EditPaymentMethodFields(
                            label: 'expiry_date'.tr,
                            hint: '20/25',
                            maxLength: 5,
                            isTransparentBorder: true,
                          ),
                        ),
                        Expanded(
                          child: EditPaymentMethodFields(
                            label: 'cvc'.tr,
                            hint: '254',
                            isTransparentBorder: true,
                            maxLength: 3,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 50,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: MyButton(
                  buttonText: 'save_card'.tr,
                  onTap: () => Get.to(
                    () => MyCards(),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
