import 'package:elias_weam_food2/constant/color.dart';
import 'package:elias_weam_food2/constant/instance.dart';
import 'package:elias_weam_food2/view/widget/custom_chart.dart';
import 'package:elias_weam_food2/view/widget/my_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MerchantAppStats extends StatelessWidget {
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
    return Obx(() {
      bool isEnglish = languageController.isEnglish.value;
      return Scaffold(
        backgroundColor: kSeoulColor10,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            MyText(
              paddingLeft: isEnglish ? 30 : 0,
              paddingRight: isEnglish ? 0 : 30,
              text: 'statistics'.tr,
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
                    paddingLeft: isEnglish ? 30 : 0,
                    paddingRight: isEnglish ? 0 : 30,
                    text: 'total_revenue_earned'.tr,
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
                        text: '55,290',
                        paddingLeft: isEnglish ? 30 : 0,
                        paddingRight: isEnglish ? 0 : 30,
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
                          heading: 'total_orders'.tr,
                          subHeading: '1502',
                          targetedText: '',
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        StatsCard(
                          heading: 'restaurant_rating'.tr,
                          subHeading: '4.9',
                          targetedText: '5',
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
                          heading: 'delivered_on_time'.tr,
                          subHeading: '92%',
                          targetedText: '',
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        StatsCard(
                          heading: 'cancelled'.tr,
                          subHeading: '1%',
                          targetedText: '',
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    });
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
                        text: '/$targetedText',
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
