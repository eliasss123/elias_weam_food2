
import 'package:elias_weam_food2/constant/color.dart';
import 'package:elias_weam_food2/view/widget/edit_merchant_app_dialog.dart';
import 'package:elias_weam_food2/view/widget/my_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

EditMerchantAppDialog changeRestaurantImage() {
  return EditMerchantAppDialog(
    children: [
      MyButton(
        radius: 10.0,
        buttonText: 'Take a photo',
        onTap: () {},
      ),
      SizedBox(
        height: 15,
      ),
      MyButton(
        radius: 10.0,
        buttonText: 'Choose from gallery',
        onTap: () {},
      ),
      SizedBox(
        height: 15,
      ),
      MyButton(
        radius: 10.0,
        bgColor: kUnSelectedButtonColor,
        buttonText: 'Back',
        onTap: () => Get.back(),
      ),
    ],
  );
}