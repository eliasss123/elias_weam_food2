import 'package:elias_weam_food2/constant/color.dart';
import 'package:elias_weam_food2/generated/assets.dart';
import 'package:elias_weam_food2/main.dart';
import 'package:elias_weam_food2/view/screens/main_app/cart_and_checkout/recent_orders/recent_orders.dart';
import 'package:elias_weam_food2/view/screens/main_app/profile/profile_screens/help_center.dart';
import 'package:elias_weam_food2/view/screens/main_app/profile/profile_screens/languages.dart';
import 'package:elias_weam_food2/view/screens/main_app/profile/profile_screens/my_account.dart';
import 'package:elias_weam_food2/view/screens/main_app/profile/profile_screens/my_favorites.dart';
import 'package:elias_weam_food2/view/screens/main_app/profile/profile_screens/my_location/my_location.dart';
import 'package:elias_weam_food2/view/screens/main_app/profile/profile_screens/payment_method/payment_method.dart';
import 'package:elias_weam_food2/view/widget/common_image_view.dart';
import 'package:elias_weam_food2/view/widget/my_text.dart';
import 'package:elias_weam_food2/view/widget/profile_tiles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {


    return Scaffold(
      body: Container(
        height: Get.height,
        width: Get.width,
        padding: EdgeInsets.fromLTRB(0, 45, 0, 0),
        decoration: ContainerDec.profileBg,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Wrap(
              spacing: 7,
              alignment: WrapAlignment.end,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                Image.asset(
                  Assets.imagesLogout,
                  height: 15,
                ),
                MyText(
                  text: 'Logout',
                  size: 16,
                  paddingRight: 20,
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Center(
              child: CommonImageView(
                height: 100,
                width: 100,
                url: dummyImg1,
                radius: 100.0,
              ),
            ),
            MyText(
              paddingTop: 8,
              text: 'Adam lenken',
              size: 21,
              weight: FontWeight.w700,
              align: TextAlign.center,
              paddingBottom: 50,
            ),
            Expanded(
              child: ListView(
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                physics: BouncingScrollPhysics(),
                children: [
                  profileTiles(
                    icon: Assets.imagesMyAccount,
                    title: 'My Account',
                    onTap: () => Get.to(
                      () => MyAccount(),
                    ),
                  ),
                  profileTiles(
                    icon: Assets.imagesMyLocationProfile,
                    title: 'My Location',
                    onTap: () => Get.to(
                      () => MyLocation(),
                    ),
                  ),
                  profileTiles(
                    icon: Assets.imagesMyFavorites,
                    title: 'Your Favorites',
                    onTap: () => Get.to(
                      () => MyFavorites(),
                    ),
                  ),
                  profileTiles(
                    icon: Assets.imagesMyOrderHistory,
                    title: 'Order History',
                    onTap: () => Get.to(
                      () => RecentOrders(),
                    ),
                  ),
                  profileTiles(
                    icon: Assets.imagesMyPaymentMethods,
                    title: 'Payment Methods',
                    onTap: () => Get.to(
                      () => PaymentMethod(),
                    ),
                  ),
                  profileTiles(
                    icon: Assets.imagesMyLanguages,
                    title: 'Language',
                    onTap: () => Get.to(
                      () => Languages(),
                    ),
                  ),
                  profileTiles(
                    icon: Assets.imagesDeliverWithVai,
                    title: 'Deliver with “vai”',
                    onTap: () {},
                  ),
                  profileTiles(
                    icon: Assets.imagesVaiHelpCenter,
                    title: 'Help Center',
                    onTap: () => Get.to(
                      () => HelpCenter(),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
