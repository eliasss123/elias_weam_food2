import 'package:elias_weam_food2/constant/color.dart';
import 'package:elias_weam_food2/utils/instances.dart';
import 'package:elias_weam_food2/view/widget/custom_tab_buttons.dart';
import 'package:elias_weam_food2/view/widget/my_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MerchantHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            height: 55,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MyText(
                  text: 'Active Orders',
                  size: 22,
                  weight: FontWeight.w700,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: 5,
                      width: 5,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: kOnlineColor,
                      ),
                    ),
                    MyText(
                      paddingLeft: 8,
                      text: 'Open',
                      size: 14,
                      color: kDarkGreyColor4,
                      weight: FontWeight.w500,
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 30),
            height: 38,
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: kSeoulColor9,
            ),
            child: Row(
              children: List.generate(
                merchantHomeController.tabs.length,
                (index) => Obx(
                  () {
                    return CustomTabButton(
                      onTap: () => merchantHomeController.selectTab(index),
                      isSelected:
                          merchantHomeController.currentTab.value == index,
                      text: merchantHomeController.tabs[index],
                    );
                  },
                ),
              ),
            ),
          ),
          Expanded(
            child: Obx(
              () {
                return IndexedStack(
                  index: merchantHomeController.currentTab.value,
                  children: merchantHomeController.tabsData,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
