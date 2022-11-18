import 'package:elias_weam_food2/constant/color.dart';
import 'package:elias_weam_food2/generated/assets.dart';
import 'package:elias_weam_food2/view/screens/main_app/notifications/tabs/delivery.dart';
import 'package:elias_weam_food2/view/screens/main_app/notifications/tabs/news_and_updates.dart';
import 'package:elias_weam_food2/view/widget/my_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Notifications extends StatefulWidget {
  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications>
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
    'Delivery',
    'News & Update',
  ];
  final List<Widget> tabsData = [
    Delivery(),
    NewsAndUpdates(),
  ];

  int currentTab = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        centerTitle: true,
        leading: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () => Get.back(),
              child: Image.asset(
                Assets.imagesArrowBack,
                height: 24,
              ),
            ),
          ],
        ),
        title: MyText(
          text: 'Notifications',
          size: 21,
          weight: FontWeight.w700,
        ),
        bottom: PreferredSize(
          preferredSize: Size(0, 60),
          child: Theme(
            data: Theme.of(context).copyWith(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
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
                      height: 35,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        color: currentTab == index
                            ? kSecondaryColor
                            : Colors.transparent,
                        border: Border.all(
                          color: currentTab == index
                              ? kSecondaryColor
                              : kBorderColor,
                          width: 1.0,
                        ),
                      ),
                      child: Center(
                        child: MyText(
                          text: _labels[index],
                          color:
                              currentTab == index ? kPrimaryColor : kBlackColor,
                          weight: currentTab == index
                              ? FontWeight.w500
                              : FontWeight.w400,
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
      body: TabBarView(
        controller: tabController,
        physics: NeverScrollableScrollPhysics(),
        children: tabsData,
      ),
    );
  }
}
