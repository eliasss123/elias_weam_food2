import 'package:elias_weam_food2/constant/color.dart';
import 'package:elias_weam_food2/generated/assets.dart';
import 'package:elias_weam_food2/view/screens/driver_app/driver_app_home/driver_app_home.dart';
import 'package:elias_weam_food2/view/screens/driver_app/driver_app_settings/driver_app_settings.dart';
import 'package:elias_weam_food2/view/screens/driver_app/driver_app_stats/driver_app_stats.dart';
import 'package:elias_weam_food2/view/screens/merchant_app/merchant_app_stats/merchant_app_stats.dart';
import 'package:elias_weam_food2/view/screens/merchant_app/merchant_app_settings/merchant_app_settings.dart';
import 'package:elias_weam_food2/view/screens/merchant_app/merchant_home/merchant_home.dart';
import 'package:flutter/material.dart';

class DriverBottomNav extends StatefulWidget {
  @override
  _DriverBottomNavState createState() => _DriverBottomNavState();
}

class _DriverBottomNavState extends State<DriverBottomNav> {
  int currentIndex = 0;
  final List<Map<String, dynamic>> items = [
    {
      'icon': Assets.imagesHomeA,
      'label': 'Home',
    },
    {
      'icon': Assets.imagesStats,
      'label': 'Statistics',
    },
    {
      'icon': Assets.imagesGear,
      'label': 'Settings',
    },
  ];
  final List<Widget> screens = [
    DriverAppHome(),
    DriverAppStats(),
    DriverAppSettings(),
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
      bottomNavigationBar: Container(
        height: isIos ? null : 75,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Color(0xffD1D1D1).withOpacity(0.25),
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
          backgroundColor: kPrimaryColor,
          selectedItemColor: kSecondaryColor,
          unselectedItemColor: kUnselectedColor,
          currentIndex: currentIndex,
          onTap: (index) => _getCurrentIndex(index),
          items: List.generate(
            items.length,
            (index) {
              var data = items[index];
              return BottomNavigationBarItem(
                icon: Padding(
                  padding: EdgeInsets.only(
                    bottom: 6,
                    top: isIos ? 4.5 : 0,
                  ),
                  child: ImageIcon(
                    AssetImage(data['icon']),
                    size: 19.0,
                  ),
                ),
                label: data['label'],
              );
            },
          ),
        ),
      ),
    );
  }
}
