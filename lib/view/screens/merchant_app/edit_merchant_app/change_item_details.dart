
import 'package:elias_weam_food2/constant/color.dart';
import 'package:elias_weam_food2/view/widget/edit_merchant_app_dialog.dart';
import 'package:elias_weam_food2/view/widget/my_button.dart';
import 'package:elias_weam_food2/view/widget/simple_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

EditMerchantAppDialog changeItemDetails(BuildContext context) {
  return EditMerchantAppDialog(
    children: [
      MyButton(
        radius: 10.0,
        buttonText: 'Change item name',
        onTap: () {
          Get.back();
          showDialog(
            context: context,
            builder: (_) {
              return EditMerchantAppDialog(
                children: [
                  SimpleTextField(
                    hintText: 'Item name',
                  ),
                  MyButton(
                    radius: 10.0,
                    buttonText: 'Done',
                    onTap: () {},
                  ),
                ],
              );
            },
          );
        },
      ),
      SizedBox(
        height: 15,
      ),
      MyButton(
        radius: 10.0,
        buttonText: 'Change item Price',
        onTap: () {
          Get.back();
          showDialog(
            context: context,
            builder: (_) {
              return EditMerchantAppDialog(
                children: [
                  SimpleTextField(
                    hintText: 'Item price',
                  ),
                  MyButton(
                    radius: 10.0,
                    buttonText: 'Done',
                    onTap: () {},
                  ),
                ],
              );
            },
          );
        },
      ),
      SizedBox(
        height: 15,
      ),
      MyButton(
        radius: 10.0,
        buttonText: 'Change items description',
        onTap: () {
          Get.back();
          showDialog(
            context: context,
            builder: (_) {
              return EditMerchantAppDialog(
                children: [
                  SimpleTextField(
                    hintText: 'Item description',
                    maxLines: 5,
                  ),
                  MyButton(
                    radius: 10.0,
                    buttonText: 'Done',
                    onTap: () {},
                  ),
                ],
              );
            },
          );
        },
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