import 'package:elias_weam_food2/constant/color.dart';
import 'package:elias_weam_food2/constant/instance.dart';
import 'package:elias_weam_food2/generated/assets.dart';
import 'package:elias_weam_food2/view/screens/main_app/cart_and_checkout/payment_methods/edit_payment_method_details.dart';
import 'package:elias_weam_food2/view/widget/my_text.dart';
import 'package:elias_weam_food2/view/widget/simple_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SelectedPaymentMethodDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var platform = Theme.of(context).platform;
    return Obx(() {
      bool isDark = themeController.isDarkTheme.value;
      bool isEnglish = languageController.isEnglish.value;
      return SimpleBottomSheet(
        height: Get.height * 0.48,
        content: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () => Get.back(),
                    child: Icon(
                      Icons.arrow_back,
                      color: isDark ? kPrimaryColor : kBlackColor2,
                    ),
                  ),
                  MyText(
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        elevation: 0,
                        backgroundColor: Colors.transparent,
                        builder: (_) {
                          return EditPaymentMethodDetails();
                        },
                      );
                    },
                    text: 'edit'.tr,
                    size: 16,
                    weight: FontWeight.w700,
                    decoration: TextDecoration.underline,
                    color: isDark ? kPrimaryColor : kBlackColor2,
                  ),
                ],
              ),
              SizedBox(
                height: 28,
              ),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        MyText(
                          text: 'Mastercard',
                          size: 24,
                          weight: FontWeight.w700,
                          color: isDark ? kPrimaryColor : kBlackColor2,
                        ),
                        MyText(
                          paddingTop: 4,
                          text: '**** 5888',
                          size: 14,
                          letterSpacing: 1.3,
                          color: kGreyColor4,
                          weight: FontWeight.w500,
                        ),
                      ],
                    ),
                  ),
                  Image.asset(
                    Assets.imagesMas,
                    height: 26,
                  ),
                ],
              ),
              MyText(
                paddingTop: 40,
                text: 'expiry_date'.tr,
                size: 14,
                letterSpacing: 1.3,
                color: kGreyColor4,
                weight: FontWeight.w500,
              ),
              MyText(
                paddingTop: 7,
                text: '02/2022',
                size: 16,
                weight: FontWeight.w500,
                color: isDark ? kPrimaryColor : kBlackColor2,
              ),
              Container(
                height: 1,
                color: kBorderColor3,
                margin: EdgeInsets.symmetric(vertical: 20),
              ),
              Row(
                children: [
                  Image.asset(
                    Assets.imagesRemove,
                    height: 30,
                  ),
                  Expanded(
                    child: MyText(
                      paddingLeft: isEnglish ? 10 : 0,
                      paddingRight: isEnglish ? 0 : 10,
                      text: 'remove_payment_method'.tr,
                      size: 14,
                      weight: FontWeight.w500,
                      color: isDark ? kPrimaryColor : kBlackColor2,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    });
  }
}
