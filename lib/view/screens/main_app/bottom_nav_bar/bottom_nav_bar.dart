import 'dart:convert';

import 'package:elias_weam_food2/constant/color.dart';
import 'package:elias_weam_food2/constant/instance.dart';
import 'package:elias_weam_food2/generated/assets.dart';
import 'package:elias_weam_food2/view/screens/main_app/browse/browse.dart';
import 'package:elias_weam_food2/view/screens/main_app/cart_and_checkout/my_cart/my_cart.dart';
import 'package:elias_weam_food2/view/screens/main_app/home/home.dart';
import 'package:elias_weam_food2/view/screens/main_app/profile/profile.dart';
import 'package:elias_weam_food2/view/widget/my_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Response;
import 'package:http/http.dart';
import 'dart:math' as math;

import '../home/restaurant_details.dart';
import 'package:elias_weam_food2/api/requests.dart';
import 'package:elias_weam_food2/api/api.dart';
class BottomNavBar extends StatefulWidget {
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  void getresturant(String id) async {
    try{
      String j="https://10.0.2.2:7264/api/homecats";
      Response respone= await get(
        Uri.parse(j),
      );

      if(respone.statusCode==200){

        Iterable l = json.decode(respone.body);
        List<HomeCat> homecats = List<HomeCat>.from(l.map((model)=> HomeCat.fromJson(model)));
        String j="https://10.0.2.2:7264/api/homecats";
        Response respone1= await get(
          Uri.parse(j),
        );
        if (respone1.statusCode==200){
          String j="https://10.0.2.2:7264/api/restcats";
          Response respone1= await get(
            Uri.parse(j),
          );
          Iterable l = json.decode(respone1.body);
          List<HomeCat> restcat = List<HomeCat>.from(l.map((model)=> HomeCat.fromJson(model)));
          String j1="https://10.0.2.2:7264/api/resturants";
          Response respone2= await get(
            Uri.parse(j1),
          );
          if(respone2.statusCode==200){
            Iterable l = json.decode(respone2.body);
            List<Restaurant> resturants = List<Restaurant>.from(l.map((model)=> HomeCat.fromJson(model)));
            int i=0;

            Get.to(()=>Home(homecats: homecats, resturants: resturants, resturantcats: restcat,));

          }
        }



      }else{
        print("no");
      }
    }catch(e){
      print(e.toString());
    }



  }
  int currentIndex = 0;
  final List<Map<String, dynamic>> items = [
    {
      'icon': Assets.imagesHomeA,
      'label': 'home_nav',
    },
    {
      'icon': Assets.imagesBrowse,
      'label': 'browse_nav',
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
    Home(homecats: [], resturants: [], resturantcats: [],),
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
        bool isEnglish = languageController.isEnglish.value;
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
                          left: index == 2
                              ? !isEnglish
                                  ? 10
                                  : 0
                              : 0,
                        ),
                        child: Transform(
                          alignment: Alignment.center,
                          transform: isEnglish
                              ? Matrix4.identity()
                              : Matrix4.rotationY(math.pi),
                          child: ImageIcon(
                            AssetImage(data['icon']),
                            size: 19.0,
                          ),
                        ),
                      ),
                      index == 2
                          ? Positioned(
                              top: isIos ? -1.5 : -5,
                              right: isEnglish ? -2 : null,
                              left: isEnglish ? null : 3.5,
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
