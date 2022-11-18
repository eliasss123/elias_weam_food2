import 'package:elias_weam_food2/constant/color.dart';
import 'package:elias_weam_food2/generated/assets.dart';
import 'package:elias_weam_food2/view/screens/main_app/browse/browse.dart';
import 'package:elias_weam_food2/view/screens/main_app/home/home.dart';
import 'package:flutter/material.dart';

class BottomNavBar extends StatefulWidget {
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int currentIndex = 0;
  final List<Map<String, dynamic>> items = [
    {
      'icon': Assets.imagesHomeA,
      'label': 'Home',
    },
    {
      'icon': Assets.imagesBrowse,
      'label': 'Browse',
    },
    {
      'icon': Assets.imagesShoppingCart,
      'label': 'Cart',
    },
    {
      'icon': Assets.imagesUserB,
      'label': 'Profile',
    },
  ];
  final List<Widget> screens = [
    Home(),
    Browse(),
    Container(),
    Container(),
  ];

  void _getCurrentIndex(int index) => setState(() {
        currentIndex = index;
      });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: currentIndex,
        children: screens,
      ),
      bottomNavigationBar: Container(
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
        height: 70,
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
                  padding: const EdgeInsets.only(bottom: 6),
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
