import 'package:elias_weam_food2/constant/color.dart';
import 'package:elias_weam_food2/generated/assets.dart';
import 'package:elias_weam_food2/view/widget/edit_merchant_app_dialog.dart';
import 'package:elias_weam_food2/view/widget/my_button.dart';
import 'package:elias_weam_food2/view/widget/my_text.dart';
import 'package:elias_weam_food2/view/widget/simple_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

EditMerchantAppDialog changeCategory(BuildContext context) {
  return EditMerchantAppDialog(
    children: [
      MyButton(
        radius: 10.0,
        buttonText: 'Add category',
        onTap: () {
          Get.back();
          showDialog(
            context: context,
            builder: (_) {
              return EditMerchantAppDialog(
                children: [
                  Container(
                    height: 209,
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        width: 1.0,
                        color: kBorderColor,
                      ),
                    ),
                    child: ListView(
                      shrinkWrap: true,
                      padding: EdgeInsets.zero,
                      physics: BouncingScrollPhysics(),
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: SimpleTextField(
                                hintText: 'Add item',
                                marginBottom: 0.0,
                              ),
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            Image.asset(
                              Assets.imagesAddSchedule,
                              height: 32,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: List.generate(
                            3,
                            (index) => Padding(
                              padding: const EdgeInsets.only(bottom: 8),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  MyText(
                                    text: '•',
                                    size: 14,
                                    weight: FontWeight.w500,
                                    color: kBlackColor,
                                  ),
                                  Expanded(
                                    child: MyText(
                                      paddingLeft: 10,
                                      text: 'item${index + 1}',
                                      size: 14,
                                      weight: FontWeight.w500,
                                      color: kBlackColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 15,
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
        buttonText: 'Change category name',
        onTap: () {
          Get.back();
          showDialog(
            context: context,
            builder: (_) {
              return EditMerchantAppDialog(
                children: [
                  SimpleTextField(
                    hintText: 'Category name',
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
        buttonText: 'Change categories order',
        onTap: () {},
      ),
      SizedBox(
        height: 15,
      ),
      MyButton(
        radius: 10.0,
        bgColor: kRedColor3,
        buttonText: 'Delete item',
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
