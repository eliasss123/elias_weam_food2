import 'package:elias_weam_food2/constant/color.dart';
import 'package:elias_weam_food2/view/screens/main_app/location/pin_location.dart';
import 'package:elias_weam_food2/view/widget/my_text.dart';
import 'package:elias_weam_food2/view/widget/simple_bottom_sheet.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BrowseByLocation extends StatelessWidget {
  final List<String> cities = [
    'Maalot-Tarshiha',
    'Nahariya',
    'Mi’ilya',
  ];

  @override
  Widget build(BuildContext context) {
    return SimpleBottomSheet(
      height: Get.height * 0.7,
      content: Material(
        color: Colors.transparent,
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.symmetric(
            vertical: 5,
          ),
          physics: BouncingScrollPhysics(),
          children: [
            customTiles(
              title: 'Use your current location',
              onTap: () => Get.to(
                () => PinLocation(),
              ),
            ),
            customTiles(
              title: 'Add another address',
              onTap: () {},
            ),
            customTiles(
              title: 'Home',
              onTap: () {},
            ),
            customTiles(
              title: 'Office',
              onTap: () {},
            ),
            ExpandableNotifier(
              child: ScrollOnExpand(
                scrollOnExpand: true,
                scrollOnCollapse: false,
                child: ExpandablePanel(
                  theme: const ExpandableThemeData(
                    iconPadding:
                        EdgeInsets.only(right: 20, top: 17, bottom: 17),
                    iconColor: kBlackColor2,
                    headerAlignment: ExpandablePanelHeaderAlignment.center,
                    tapBodyToCollapse: true,
                  ),
                  header: MyText(
                    paddingLeft: 20,
                    text: 'Browse our cities',
                    size: 18,
                    weight: FontWeight.w700,
                  ),
                  collapsed: SizedBox(),
                  expanded: ListView(
                    shrinkWrap: true,
                    physics: BouncingScrollPhysics(),
                    padding: EdgeInsets.zero,
                    children: List.generate(
                      cities.length,
                      (index) {
                        return InkWell(
                          onTap: () {},
                          child: MyText(
                            paddingLeft: 20,
                            paddingRight: 20,
                            paddingBottom: 12,
                            paddingTop: 12,
                            text: cities[index],
                            size: 18,
                            weight: FontWeight.w500,
                            color: kBlackColor2.withOpacity(0.80),
                          ),
                        );
                      },
                    ),
                  ),
                  builder: (_, collapsed, expanded) {
                    return Expandable(
                      collapsed: collapsed,
                      expanded: expanded,
                      theme: const ExpandableThemeData(
                        crossFadePoint: 0,
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  ListTile customTiles({
    String? title,
    VoidCallback? onTap,
  }) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(
        horizontal: 20,
      ),
      onTap: onTap,
      title: MyText(
        text: title,
        size: 18,
        weight: FontWeight.w700,
      ),
    );
  }
}
