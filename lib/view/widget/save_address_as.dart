import 'package:elias_weam_food2/constant/color.dart';
import 'package:elias_weam_food2/constant/instance.dart';
import 'package:elias_weam_food2/view/widget/address_toggle_buttons.dart';
import 'package:elias_weam_food2/view/widget/my_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SaveAddressAs extends StatelessWidget {
  SaveAddressAs({
    Key? key,
  }) : super(key: key);

  final List<String> addressOp = [
    'Home',
    'Work',
    'Other',
  ];
  final List<String> addressOpTr = [
    'home',
    'work',
    'other',
  ];

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      bool isDark = themeController.isDarkTheme.value;
      return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          MyText(
            text: 'save_address_as'.tr,
            size: 15,
            weight: FontWeight.w700,
            paddingBottom: 15,
            color: isDark ? kPrimaryColor : kBlackColor2,
          ),
          Wrap(
            spacing: 10.0,
            children: List.generate(
              addressOp.length,
              (index) {
                return AddressToggleButton(
                  isDark: isDark,
                  onTap: () {},
                  text: addressOpTr[index].tr,
                  isSelected: index == 0 ? true : false,
                );
              },
            ),
          ),
        ],
      );
    });
  }
}
