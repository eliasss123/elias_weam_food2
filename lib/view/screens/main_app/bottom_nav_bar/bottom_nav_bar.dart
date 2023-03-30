import 'package:elias_weam_food2/constant/color.dart';
import 'package:elias_weam_food2/constant/instance.dart';
import 'package:elias_weam_food2/generated/assets.dart';
import 'package:elias_weam_food2/view/screens/main_app/browse/browse.dart';
import 'package:elias_weam_food2/view/screens/main_app/cart_and_checkout/my_cart/my_cart.dart';
import 'package:elias_weam_food2/view/screens/main_app/home/home.dart';
import 'package:elias_weam_food2/view/screens/main_app/profile/profile.dart';
import 'package:elias_weam_food2/view/widget/my_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomNavBar extends StatefulWidget {
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int currentIndex = 0;
  final List<Map<String, dynamic>> items = [
    {
      'icon': Assets.imagesHomeA,
      'label': 'home_nav',
    },
    {
      'icon': Assets.imagesBrowse,
      'label': 'browse',
    },
    {
      'icon': Assets.imagesShoppingCart,
      'label': 'cart',
    },
    {
      'icon': Assets.imagesUserB,
      'label': 'profile',
    },
  ];
  final List<Widget> screens = [
    Home(),
    Browse(),
    MyCart(),
    Profile(),
  ];

  void _getCurrentIndex(int index) => setState(() {
        currentIndex = index;
      });

  @override
  Widget build(BuildContext context) {
    var platform = Theme.of(context).platform;
    bool isIos = platform == TargetPlatform.iOS;

    return Scaffold(
      body: IndexedStack(
        index: currentIndex,
        children: screens,
      ),
      bottomNavigationBar: Obx(() {
        bool isDark = themeController.isDarkTheme.value;
        return Container(
          height: isIos ? null : 75,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: isDark
                    ? Color(0xff020202).withOpacity(0.4)
                    : Color(0xffD1D1D1).withOpacity(0.25),
                spreadRadius: 0,
                blurRadius: 30,
                offset: Offset(0, -10),
              ),
            ],
          ),
          child: BottomNavigationBar(
            elevation: 0,
            type: BottomNavigationBarType.fixed,
            selectedLabelStyle: TextStyle(
              fontSize: 11,
              color: kSecondaryColor,
              fontWeight: FontWeight.w500,
            ),
            unselectedLabelStyle: TextStyle(
              fontSize: 11,
              color: kUnselectedColor,
            ),
            selectedFontSize: 0,
            unselectedFontSize: 0,
            backgroundColor: isDark ? kDarkBottomNavColor : kPrimaryColor,
            selectedItemColor: kSecondaryColor,
            unselectedItemColor: kUnselectedColor,
            currentIndex: currentIndex,
            onTap: (index) => _getCurrentIndex(index),
            items: List.generate(
              items.length,
              (index) {
                var data = items[index];
                return BottomNavigationBarItem(
                  icon: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                          bottom: 6,
                          top: isIos ? 4.5 : 0,
                          right: index == 2 ? 6 : 0,
                        ),
                        child: ImageIcon(
                          AssetImage(data['icon']),
                          size: 19.0,
                        ),
                      ),
                      index == 2
                          ? Positioned(
                              top: isIos ? -1.5 : -5,
                              right: -2,
                              child: Container(
                                height: 15,
                                width: 15,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: kSecondaryColor,
                                ),
                                child: Center(
                                  child: FittedBox(
                                    child: MyText(
                                      text: '2',
                                      size: 11,
                                      color: kPrimaryColor,
                                      weight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ),
                            )
                          : SizedBox(),
                    ],
                  ),
                  label: data['label'].toString().tr,
                );
              },
            ),
          ),
        );
      }),
    );
  }
}
