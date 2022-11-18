import 'package:elias_weam_food2/constant/color.dart';
import 'package:elias_weam_food2/main.dart';
import 'package:elias_weam_food2/view/screens/main_app/notifications/promotions.dart';
import 'package:elias_weam_food2/view/widget/common_image_view.dart';
import 'package:elias_weam_food2/view/widget/my_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NewsAndUpdates extends StatelessWidget {
  final List<Map<String, dynamic>> dummyNotifications = [
    {
      'dateTime': 'New Notification',
      'content': [
        {
          'avatarUrl': dummyImg3,
          'notificationText': 'Buy 1 get 1 free',
          'subTitle': 'Valid till 20 May',
        },
        {
          'avatarUrl': dummyImg3,
          'notificationText': 'Sale 50% today',
          'subTitle': 'Valid till 20 May',
        },
      ],
    },
    {
      'dateTime': 'This week',
      'content': [
        {
          'avatarUrl': dummyImg3,
          'notificationText': 'ONLY TODAY 20%',
          'subTitle': 'Valid till 20 May',
        },
        {
          'avatarUrl': dummyImg3,
          'notificationText': 'Sale 50% today',
          'subTitle': 'Valid till 20 May',
        },
        {
          'avatarUrl': dummyImg3,
          'notificationText': 'ONLY TODAY 20%',
          'subTitle': 'Valid till 20 May',
        },
      ],
    },
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: BouncingScrollPhysics(),
      padding: EdgeInsets.symmetric(
        vertical: 15,
      ),
      itemCount: dummyNotifications.length,
      itemBuilder: (context, index) {
        var data = dummyNotifications[index];
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            MyText(
              text: data['dateTime'],
              size: 18,
              weight: FontWeight.w500,
              paddingTop: 10,
              paddingLeft: 20,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: List.generate(
                data['content'].length,
                (i) {
                  var content = data['content'][i];
                  return NewsAndUpdateTiles(
                    avatarUrl: content['avatarUrl'],
                    notificationText: content['notificationText'],
                    subTitle: content['subTitle'],
                    onTap: () => Get.to(() => Promotions()),
                  );
                },
              ),
            ),
          ],
        );
      },
    );
  }
}

class NewsAndUpdateTiles extends StatelessWidget {
  const NewsAndUpdateTiles({
    Key? key,
    required this.avatarUrl,
    required this.notificationText,
    required this.subTitle,
    required this.onTap,
  }) : super(key: key);

  final String avatarUrl, notificationText, subTitle;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        GestureDetector(
          onTap: onTap,
          child: Container(
            padding: EdgeInsets.all(20),
            child: Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: kPrimaryColor,
                    shape: BoxShape.circle,
                    border: Border.all(
                      width: 1.0,
                      color: kBorderColor,
                    ),
                  ),
                  child: CommonImageView(
                    height: 48,
                    width: 48,
                    radius: 100.0,
                    url: avatarUrl,
                  ),
                ),
                SizedBox(
                  width: 15,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      MyText(
                        text: notificationText,
                        size: 15,
                        weight: FontWeight.w700,
                        paddingBottom: 6,
                      ),
                      MyText(
                        text: subTitle,
                        color: kGreyColor5,
                        size: 14,
                        weight: FontWeight.w500,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 20),
          height: 1,
          color: kBorderColor,
        ),
      ],
    );
  }
}
