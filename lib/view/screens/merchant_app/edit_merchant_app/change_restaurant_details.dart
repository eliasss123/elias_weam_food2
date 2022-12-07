import 'package:elias_weam_food2/constant/color.dart';
import 'package:elias_weam_food2/view/screens/merchant_app/edit_merchant_app/change_restaurant_image.dart';
import 'package:elias_weam_food2/view/widget/edit_merchant_app_dialog.dart';
import 'package:elias_weam_food2/view/widget/my_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

EditMerchantAppDialog changeRestaurantDetails(BuildContext context) {
  return EditMerchantAppDialog(
    children: [
      MyButton(
        radius: 10.0,
        buttonText: 'Change profile picture',
        onTap: () {
          Get.back();
          showDialog(
            context: context,
            builder: (_) {
              return changeRestaurantImage();
            },
          );
        },
      ),
      SizedBox(
        height: 15,
      ),
      MyButton(
        radius: 10.0,
        buttonText: 'Change resturant name',
        onTap: () {},
      ),
      SizedBox(
        height: 15,
      ),
      MyButton(
        radius: 10.0,
        buttonText: 'Change restaurant description',
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
