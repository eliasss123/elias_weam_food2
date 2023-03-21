import 'package:elias_weam_food2/constant/color.dart';
import 'package:elias_weam_food2/constant/instance.dart';
import 'package:elias_weam_food2/main.dart';
import 'package:elias_weam_food2/view/widget/common_image_view.dart';
import 'package:elias_weam_food2/view/widget/my_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Delivery extends StatelessWidget {
  final List<Map<String, dynamic>> dummyNotifications = [
    {
      'dateTime': 'Current',
      'content': [
        {
          'avatarUrl': dummyImg3,
          'notificationText': 'Squid Sweet and Sour Salad, J...',
          'totalItems': '1',
          'isOrderOTW': true,
          'isOTW': false,
          'isReady': false,
        },
        {
          'avatarUrl': dummyImg3,
          'notificationText': 'Black Pepper Beef Lumpia',
          'totalItems': '2',
          'isOrderOTW': false,
          'isReady': true,
          'isOTW': false,
        },
        {
          'avatarUrl': dummyImg3,
          'notificationText': 'KFC',
          'totalItems': '3',
          'isOrderOTW': false,
          'isReady': false,
          'isOTW': true,
        },
      ],
    },
    {
      'dateTime': 'October 2021',
      'content': [
        {
          'avatarUrl': dummyImg3,
          'notificationText': 'Japan Hainanese Sashimi, Squ...',
          'totalItems': '1',
          'isOrderOTW': false,
          'isOTW': false,
          'isReady': false,
        },
      ],
    },
    {
      'dateTime': 'August 2021',
      'content': [
        {
          'avatarUrl': dummyImg3,
          'notificationText': 'Burger king',
          'totalItems': '1',
          'isOrderOTW': false,
          'isOTW': false,
          'isReady': false,
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
        return Obx(() {
          bool isDark = themeController.isDarkTheme.value;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              MyText(
                text: data['dateTime'],
                size: 18,
                weight: FontWeight.w500,
                paddingTop: 10,
                paddingLeft: 20,
                color: isDark ? kPrimaryColor : kBlackColor2,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: List.generate(
                  data['content'].length,
                  (i) {
                    var content = data['content'][i];
                    return DeliveryTiles(
                      avatarUrl: content['avatarUrl'],
                      notificationText: content['notificationText'],
                      totalItems: content['totalItems'],
                      isOrderOTW: content['isOrderOTW'],
                      isOTW: content['isOTW'],
                      isReady: content['isReady'],
                      isDark: isDark,
                    );
                  },
                ),
              ),
            ],
          );
        });
      },
    );
  }
}

class DeliveryTiles extends StatelessWidget {
  const DeliveryTiles({
    Key? key,
    required this.avatarUrl,
    required this.notificationText,
    required this.totalItems,
    required this.isOrderOTW,
    required this.isOTW,
    required this.isReady,
    required this.isDark,
  }) : super(key: key);

  final String avatarUrl, notificationText, totalItems;
  final bool isOrderOTW;
  final bool isOTW;
  final bool isReady;
  final bool isDark;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          padding: EdgeInsets.all(20),
          child: Row(
            children: [
              CommonImageView(
                height: 48,
                width: 48,
                radius: 100.0,
                url: avatarUrl,
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
                      color: isDark ? kPrimaryColor : kBlackColor2,
                    ),
                    Wrap(
                      spacing: 5,
                      runSpacing: 10,
                      children: [
                        MyText(
                          text: isOrderOTW
                              ? 'Order is on the way - delivery'
                              : isReady
                                  ? 'Order ready - pick up'
                                  : isOTW
                                      ? 'On the way'
                                      : 'Delivered',
                          color: kSecondaryColor,
                          size: 14,
                          weight: FontWeight.w500,
                        ),
                        MyText(
                          text: '•',
                          size: 14,
                          weight: FontWeight.w500,
                          color: kBorderColor3,
                        ),
                        MyText(
                          text: '$totalItems items',
                          size: 14,
                          weight: FontWeight.w500,
                          color: Color(0xff7A7A7A),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
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
