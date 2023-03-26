import 'package:elias_weam_food2/constant/color.dart';
import 'package:elias_weam_food2/constant/instance.dart';
import 'package:elias_weam_food2/generated/assets.dart';
import 'package:elias_weam_food2/view/widget/my_button.dart';
import 'package:elias_weam_food2/view/widget/my_text.dart';
import 'package:elias_weam_food2/view/widget/simple_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditPaymentMethodDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      bool isDark = themeController.isDarkTheme.value;
      return SimpleBottomSheet(
        height: Get.height * 0.85,
        content: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
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
                text: 'add_payment_method'.tr,
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
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 7),
                child: MyButton(
                  buttonText: 'save_make_payment'.tr,
                  onTap: () {},
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}

// ignore: must_be_immutable
class EditPaymentMethodFields extends StatelessWidget {
  EditPaymentMethodFields({
    Key? key,
    required this.label,
    required this.hint,
    this.controller,
    this.isTransparentBorder = false,
    this.isReadOnly = false,
    this.haveSuffix = false,
    this.suffixIcon,
    this.maxLength,
  }) : super(key: key);
  final String? label, hint, suffixIcon;
  TextEditingController? controller;
  bool? isTransparentBorder, isReadOnly, haveSuffix;
  int? maxLength;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      bool isDark = themeController.isDarkTheme.value;
      return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          MyText(
            text: label,
            size: 14,
            letterSpacing: 1.3,
            color: kGreyColor4,
            weight: FontWeight.w500,
          ),
          TextFormField(
            textAlignVertical: TextAlignVertical.center,
            readOnly: isReadOnly!,
            maxLength: maxLength,
            controller: controller,
            cursorColor: isDark ? kPrimaryColor : kBlackColor2,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: isDark ? kPrimaryColor : kBlackColor2,
            ),
            decoration: InputDecoration(
              counterText: '',
              contentPadding: EdgeInsets.zero,
              hintText: hint,
              hintStyle: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: isDark ? kPrimaryColor : kBlackColor2,
              ),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: isTransparentBorder!
                      ? Colors.transparent
                      : isDark
                          ? kDarkBorderColor2
                          : kBorderColor2,
                  width: 1.0,
                ),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: isTransparentBorder!
                      ? Colors.transparent
                      : isDark
                          ? kDarkBorderColor2
                          : kBlackColor2,
                  width: 1.0,
                ),
              ),
              suffixIcon: haveSuffix!
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          suffixIcon!,
                          height: 26,
                        ),
                      ],
                    )
                  : SizedBox(),
            ),
          ),
        ],
      );
    });
  }
}
