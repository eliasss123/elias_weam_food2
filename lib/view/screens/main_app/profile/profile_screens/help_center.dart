import 'package:elias_weam_food2/constant/color.dart';
import 'package:elias_weam_food2/generated/assets.dart';
import 'package:elias_weam_food2/view/screens/main_app/support/support.dart';
import 'package:elias_weam_food2/view/widget/common_image_view.dart';
import 'package:elias_weam_food2/view/widget/my_text.dart';
import 'package:elias_weam_food2/view/widget/profile_tiles.dart';
import 'package:elias_weam_food2/view/widget/simple_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HelpCenter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: Get.height,
        width: Get.width,
        padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
        decoration: ContainerDec.profileBg,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            simpleAppBar(
              bgColor: Colors.transparent,
              title: 'Help Center',
              titleWeight: FontWeight.w700,
            ),
            SizedBox(
              height: 10,
            ),
            Center(
              child: CommonImageView(
                height: 90,
                width: 90,
                imagePath: Assets.imagesHelpCenterLocation,
                radius: 0,
              ),
            ),
            SizedBox(
              height: 90,
            ),
            Expanded(
              child: ListView(
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                physics: BouncingScrollPhysics(),
                children: [
                  profileTiles(
                    icon: Assets.imagesContactUs,
                    title: 'Contact us',
                    onTap: () => Get.to(
                      () => Support(
                        title: 'Contact Us',
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  profileTiles(
                    icon: Assets.imagesVisitUs,
                    title: 'Visit us ',
                    onTap: () {},
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  profileTiles(
                    icon: Assets.imagesDeliverWithVaiContact,
                    title: 'Deliver with “vai”',
                    onTap: () {},
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  profileTiles(
                    icon: Assets.imagesFaq,
                    title: 'FAQs',
                    onTap: () {},
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  profileTiles(
                    icon: Assets.imagesPrivacyPolicies,
                    title: 'Privacy polices ',
                    onTap: () {},
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  profileTiles(
                    icon: Assets.imagesDeleteAcc,
                    title: 'Delete account',
                    onTap: () {},
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
