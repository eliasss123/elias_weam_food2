import 'package:elias_weam_food2/constant/color.dart';
import 'package:elias_weam_food2/constant/instance.dart';
import 'package:elias_weam_food2/generated/assets.dart';
import 'package:elias_weam_food2/view/screens/main_app/cart_and_checkout/payment_methods/add_payment_method.dart';
import 'package:elias_weam_food2/view/widget/custom_radio.dart';
import 'package:elias_weam_food2/view/widget/my_text.dart';
import 'package:elias_weam_food2/view/widget/simple_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PaymentMethods extends StatelessWidget {
  const PaymentMethods({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      bool isDark = themeController.isDarkTheme.value;
      return SimpleBottomSheet(
        height: Get.height * 0.8,
        content: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              MyText(
                text: 'your_payments'.tr,
                size: 16,
                weight: FontWeight.w500,
                paddingBottom: 20,
                color: isDark ? kPrimaryColor : kBlackColor2,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16),
                height: 72,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(
                    width: 1.0,
                    color: kSecondaryColor,
                  ),
                ),
                child: Row(
                  children: [
                    Image.asset(
                      Assets.imagesRibbion,
                      height: 40,
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          MyText(
                            text: 'cash_on_delivery'.tr,
                            size: 16,
                            weight: FontWeight.w700,
                            paddingBottom: 3,
                            color: isDark ? kPrimaryColor : kBlackColor2,
                          ),
                          MyText(
                            text: 'provide_cash'.tr,
                            size: 12,
                            color: kGreyColor5,
                          ),
                        ],
                      ),
                    ),
                    CustomRadio(
                      onTap: () {},
                      isSelected: true,
                    ),
                  ],
                ),
              ),
              MyText(
                text: 'wallet'.tr,
                size: 16,
                weight: FontWeight.w500,
                paddingBottom: 13,
                paddingTop: 30,
                color: isDark ? kPrimaryColor : kBlackColor2,
              ),
              paymentMethodTile(
                icon: Assets.imagesMasterCard,
                title: '****386 4342',
                onTap: () {},
              ),
              SizedBox(
                height: 10,
              ),
              paymentMethodTile(
                icon: Assets.imagesApplePay,
                title: 'pay_with_apple'.tr,
                iconColor: isDark ? kPrimaryColor : null,
                iconSize: 26,
                onTap: () {},
              ),
              SizedBox(
                height: 10,
              ),
              paymentMethodTile(
                icon: Assets.imagesPayPal,
                title: 'pay_with_payPal'.tr,
                onTap: () {},
              ),
              MyText(
                onTap: () => Get.to(
                  () => AddPaymentMethod(),
                ),
                text: 'add_payment_method'.tr,
                size: 14,
                weight: FontWeight.w500,
                paddingTop: 25,
                paddingBottom: 35,
                color: isDark ? kPrimaryColor : kBlackColor2,
              ),
              MyText(
                text: 'credits'.tr,
                size: 16,
                weight: FontWeight.w500,
                paddingBottom: 13,
                color: isDark ? kPrimaryColor : kBlackColor2,
              ),
              paymentMethodTile(
                icon: Assets.imagesAppCash,
                title: 'app_cash'.tr,
                iconSize: 16,
                iconColor: isDark ? kPrimaryColor : null,
                onTap: () {},
              ),
            ],
          ),
        ),
      );
    });
  }

  Widget paymentMethodTile({
    String? icon,
    String? title,
    double? iconSize,
    VoidCallback? onTap,
    Color? iconColor,
  }) {
    return Obx(() {
      bool isDark = themeController.isDarkTheme.value;
      bool isEnglish = languageController.isEnglish.value;
      return Container(
        height: 48,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            width: 1.0,
            color: kBorderColor3,
          ),
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: onTap,
            borderRadius: BorderRadius.circular(12),
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 16,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 40,
                    alignment: isEnglish
                        ? Alignment.centerLeft
                        : Alignment.centerRight,
                    child: Image.asset(
                      icon!,
                      height: iconSize ?? 24,
                      color: iconColor ?? null,
                    ),
                  ),
                  Expanded(
                    child: Container(
                      child: MyText(
                        text: title,
                        color: isDark ? kPrimaryColor : kBlackColor2,
                      ),
                    ),
                  ),
                  RotatedBox(
                    quarterTurns: isEnglish ? 0 : 2,
                    child: Image.asset(
                      Assets.imagesArrowRight,
                      color: isDark ? kPrimaryColor : kBlackColor,
                      height: 20,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
