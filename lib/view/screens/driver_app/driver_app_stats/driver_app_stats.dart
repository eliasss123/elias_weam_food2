import 'package:elias_weam_food2/constant/color.dart';
import 'package:elias_weam_food2/main.dart';
import 'package:elias_weam_food2/view/widget/common_image_view.dart';
import 'package:elias_weam_food2/view/widget/custom_chart.dart';
import 'package:elias_weam_food2/view/widget/my_text.dart';
import 'package:flutter/material.dart';

class DriverAppStats extends StatelessWidget {
  final List<CustomSplineChartData> weightChatHistory = [
    CustomSplineChartData(
      '1',
      0,
    ),
    CustomSplineChartData(
      '2',
      1,
    ),
    CustomSplineChartData(
      '3',
      2,
    ),
    CustomSplineChartData(
      '4',
      4,
    ),
    CustomSplineChartData(
      '5',
      5,
    ),
    CustomSplineChartData(
      '6',
      3,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kSeoulColor10,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          MyText(
            paddingLeft: 30,
            text: 'Statistics',
            size: 22,
            weight: FontWeight.w700,
            paddingTop: 55,
          ),
          Expanded(
            child: ListView(
              shrinkWrap: true,
              physics: BouncingScrollPhysics(),
              padding: EdgeInsets.zero,
              children: [
                MyText(
                  paddingLeft: 30,
                  text: 'Total Revenue Earned',
                  size: 14,
                  color: kDarkGreyColor4,
                  weight: FontWeight.w500,
                  paddingTop: 25,
                  paddingBottom: 4.0,
                  letterSpacing: 0.0,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    MyText(
                      text: '9,190.62',
                      paddingLeft: 30,
                      size: 28,
                      weight: FontWeight.w500,
                      letterSpacing: 0.0,
                    ),
                    MyText(
                      paddingLeft: 4,
                      text: '€',
                      size: 15,
                      color: kDarkGreyColor4,
                      weight: FontWeight.w700,
                      letterSpacing: 0.0,
                      paddingBottom: 5,
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                CustomChartWidget(
                  heading: 'Sold stats',
                  charts: List.generate(
                    5,
                    (index) {
                      return CustomChart(
                        customSplineChartData: weightChatHistory,
                        primaryXYAxisMax: 5,
                        primaryXYAxisInterval: 1,
                        primaryXYAxisMin: 0,
                        primaryYAxisMax: 5,
                        primaryYAxisInterval: 1,
                        primaryYAxisMin: 0,
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Row(
                    children: [
                      StatsCard(
                        heading: 'Total courses',
                        subHeading: '123',
                        targetedText: '',
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      StatsCard(
                        heading: 'Average rating',
                        subHeading: '4.9',
                        targetedText: '/5',
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Row(
                    children: [
                      StatsCard(
                        heading: 'Accepted',
                        subHeading: '87%',
                        targetedText: '',
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      StatsCard(
                        heading: 'Tip',
                        subHeading: '100',
                        targetedText: '€',
                      ),
                    ],
                  ),
                ),
                MyText(
                  paddingTop: 40,
                  paddingLeft: 30,
                  size: 16,
                  weight: FontWeight.w700,
                  text: 'Your Latest Courses',
                  paddingBottom: 15,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: List.generate(
                    2,
                    (index) {
                      return CourseTiles(
                        imgUrl: dummyImg1,
                        name: 'Maria Cantina',
                        price: '12,87€',
                        day: 'Today',
                        time: '12:32pm',
                        distance: '3.2 km',
                        onTap: () {},
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CourseTiles extends StatelessWidget {
  const CourseTiles({
    Key? key,
    required this.imgUrl,
    required this.name,
    required this.price,
    required this.day,
    required this.time,
    required this.distance,
    required this.onTap,
  }) : super(key: key);

  final String imgUrl, name, price, day, time, distance;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(15),
        height: 74,
        margin: EdgeInsets.only(
          bottom: 20,
          left: 30,
          right: 30,
        ),
        decoration: BoxDecoration(
          color: kPrimaryColor,
          boxShadow: [
            BoxShadow(
              color: kBlackColor.withOpacity(0.02),
              offset: Offset(10, 10),
              blurRadius: 30,
              spreadRadius: 14.0,
            ),
          ],
          borderRadius: BorderRadius.circular(14.0),
        ),
        child: Row(
          children: [
            CommonImageView(
              height: 47,
              width: 47,
              radius: 8.0,
              url: imgUrl,
            ),
            SizedBox(
              width: 15,
            ),
            Expanded(
              flex: 7,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MyText(
                    text: name,
                    size: 13,
                    weight: FontWeight.w500,
                    color: kDarkGreyColor4.withOpacity(0.96),
                    paddingBottom: 6,
                  ),
                  MyText(
                    text: '$day · $time',
                    size: 12,
                    color: kGreyColor13,
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MyText(
                    text: '$price',
                    size: 13,
                    weight: FontWeight.w500,
                    color: kSecondaryColor,
                    paddingBottom: 6,
                  ),
                  MyText(
                    text: '$distance',
                    size: 12,
                    color: kGreyColor13,
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

class StatsCard extends StatelessWidget {
  StatsCard({
    Key? key,
    required this.heading,
    required this.subHeading,
    this.targetedText,
  }) : super(key: key);
  final String heading, subHeading;
  String? targetedText;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.all(15),
        height: 78,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: kPrimaryColor,
          boxShadow: [
            BoxShadow(
              offset: Offset(10, 10),
              blurRadius: 30,
              spreadRadius: 14,
              color: kBlackColor.withOpacity(0.02),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            MyText(
              text: heading,
              size: 12,
              color: kBlackColor.withOpacity(0.44),
            ),
            Row(
              children: [
                MyText(
                  text: subHeading,
                  size: 19,
                  weight: FontWeight.w500,
                  color: kBlackColor,
                ),
                targetedText!.isEmpty
                    ? SizedBox()
                    : MyText(
                        paddingTop: 3,
                        text: '$targetedText',
                        size: 15,
                        weight: FontWeight.w500,
                        color: kBlackColor,
                      ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
