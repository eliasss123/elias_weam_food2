import 'dart:io';

import 'package:elias_weam_food2/constant/color.dart';
import 'package:elias_weam_food2/constant/instance.dart';
import 'package:elias_weam_food2/generated/assets.dart';
import 'package:elias_weam_food2/utils/instances.dart';
import 'package:elias_weam_food2/view/screens/main_app/cart_and_checkout/delivery_options/tabs/delivery.dart';
import 'package:elias_weam_food2/view/screens/main_app/cart_and_checkout/delivery_options/tabs/pick_up.dart';
import 'package:elias_weam_food2/view/widget/my_button.dart';
import 'package:elias_weam_food2/view/widget/my_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DeliveryOptions extends StatefulWidget {
  @override
  State<DeliveryOptions> createState() => _DeliveryOptionsState();
}

class _DeliveryOptionsState extends State<DeliveryOptions>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    tabController = TabController(
      length: _labels.length,
      vsync: this,
    );
  }

  late TabController tabController;
  final List<String> _labels = [
    'delivery',
    'pick_up',
  ];
  final List<Widget> tabsData = [
    Delivery(),
    Pickup(),
  ];

  int currentTab = 0;

  @override
  Widget build(BuildContext context) {
    var platform = Theme.of(context).platform;
    return Obx(() {
      bool isDark = themeController.isDarkTheme.value;
      bool isEnglish = languageController.isEnglish.value;
      return Scaffold(
        appBar: AppBar(
          backgroundColor: isDark ? kDarkPrimaryColor : kPrimaryColor,
          centerTitle: true,
          leading: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () => Get.back(),
                child: RotatedBox(
                  quarterTurns: isEnglish ? 0 : 2,
                  child: Image.asset(
                    Assets.imagesArrowBack,
                    height: 24,
                    color: isDark ? kPrimaryColor : kBlackColor2,
                  ),
                ),
              ),
            ],
          ),
          title: MyText(
            text: 'delivery_options'.tr,
            size: 21,
            weight: FontWeight.w700,
            color: isDark ? kPrimaryColor : kBlackColor2,
          ),
          bottom: PreferredSize(
            preferredSize: Size(0, 70),
            child: Theme(
              data: Theme.of(context).copyWith(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 25,
                  vertical: 10,
                ),
                child: TabBar(
                  onTap: (index) => setState(() {
                    currentTab = index;
                  }),
                  padding: EdgeInsets.zero,
                  labelPadding: EdgeInsets.symmetric(horizontal: 10),
                  controller: tabController,
                  indicatorColor: Colors.transparent,
                  tabs: List.generate(
                    _labels.length,
                    (index) {
                      return Container(
                        height: 39,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(18),
                          color: currentTab == index
                              ? kSecondaryColor
                              : isDark
                                  ? kDarkInputBgColor
                                  : Colors.transparent,
                          border: Border.all(
                            color: currentTab == index
                                ? kSecondaryColor
                                : isDark
                                    ? kDarkBorderColor2
                                    : kBorderColor,
                            width: 1.0,
                          ),
                        ),
                        child: Center(
                          child: MyText(
                            size: 13,
                            text: _labels[index].toString().tr,
                            color: currentTab == index
                                ? kPrimaryColor
                                : kSecondaryColor,
                            weight: FontWeight.w700,
                            paddingTop: Platform.isIOS
                                ? index == 0
                                    ? languageController.currentIndex.value == 1
                                        ? 5
                                        : 0
                                    : 0
                                : 0,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: TabBarView(
                controller: tabController,
                physics: NeverScrollableScrollPhysics(),
                children: tabsData,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 40,
                vertical: platform == TargetPlatform.iOS ? 23 : 20,
              ),
              child: MyButton(
                buttonText: 'save'.tr,
                onTap: () => cartCheckOutController.changeDeliveryOption(
                  tabController.index == 0 ? false : true,
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}
