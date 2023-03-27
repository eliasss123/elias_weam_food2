import 'package:elias_weam_food2/constant/color.dart';
import 'package:elias_weam_food2/constant/instance.dart';
import 'package:elias_weam_food2/main.dart';
import 'package:elias_weam_food2/view/widget/common_image_view.dart';
import 'package:elias_weam_food2/view/widget/custom_chart.dart';
import 'package:elias_weam_food2/view/widget/my_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

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
    return Obx(() {
      bool isDark = themeController.isDarkTheme.value;
      bool isEnglish = languageController.isEnglish.value;
      return Scaffold(
        backgroundColor: isDark ? kDarkPrimaryColor : kSeoulColor10,
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
              color: isDark ? kPrimaryColor : kBlackColor2,
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
                        text: '9,190.62',
                        paddingLeft: isEnglish ? 30 : 0,
                        paddingRight: isEnglish ? 0 : 30,
                        size: 28,
                        weight: FontWeight.w500,
                        letterSpacing: 0.0,
                        color: isDark ? kPrimaryColor : kBlackColor2,
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
                          heading: 'total_courses'.tr,
                          subHeading: '123',
                          targetedText: '',
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        StatsCard(
                          heading: 'average_rating'.tr,
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
                          heading: 'accepted'.tr,
                          subHeading: '87%',
                          targetedText: '',
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        StatsCard(
                          heading: 'tip'.tr,
                          subHeading: '100',
                          targetedText: '€',
                        ),
                      ],
                    ),
                  ),
                  MyText(
                    paddingTop: 40,
                    paddingLeft: isEnglish ? 30 : 0,
                    paddingRight: isEnglish ? 0 : 30,
                    size: 16,
                    weight: FontWeight.w700,
                    text: 'your_latest_courses'.tr,
                    paddingBottom: 15,
                    color: isDark ? kPrimaryColor : kBlackColor2,
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
                          day: '${'today'.tr}',
                          time: '12:32pm',
                          distance: '3.2 ${'km'.tr}',
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
    });
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
    return Obx(() {
      bool isDark = themeController.isDarkTheme.value;
      bool isEnglish = languageController.isEnglish.value;
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
            color: isDark ? kDarkInputBgColor : kPrimaryColor,
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
                      color: isDark
                          ? kPrimaryColor
                          : kDarkGreyColor4.withOpacity(0.96),
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
    return Obx(() {
      bool isDark = themeController.isDarkTheme.value;
      return Expanded(
        child: Container(
          padding: EdgeInsets.all(15),
          height: 78,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: isDark ? kDarkInputBgColor : kPrimaryColor,
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
                color: isDark
                    ? kPrimaryColor.withOpacity(0.66)
                    : kBlackColor.withOpacity(0.44),
              ),
              Row(
                children: [
                  MyText(
                    text: subHeading,
                    size: 19,
                    weight: FontWeight.w500,
                    color: isDark ? kPrimaryColor : kBlackColor,
                  ),
                  targetedText!.isEmpty
                      ? SizedBox()
                      : MyText(
                          paddingTop: 3,
                          text: '$targetedText',
                          size: 15,
                          weight: FontWeight.w500,
                          color: isDark ? kPrimaryColor : kBlackColor,
                        ),
                ],
              ),
            ],
          ),
        ),
      );
    });
  }
}

// ignore: must_be_immutable
class CustomChartWidget extends StatefulWidget {
  final String heading;

  CustomChartWidget({
    super.key,
    required this.heading,
    required this.charts,
  });

  final List<CustomChart> charts;

  @override
  State<CustomChartWidget> createState() => _CustomChartWidgetState();
}

class _CustomChartWidgetState extends State<CustomChartWidget> {
  final pageController = PageController();
  int currentIndex = 0;

  final List<String> statusBy = [
    '1D',
    '1W',
    '1M',
    '3M',
    '1Y',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 15,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            height: 200,
            child: PageView.builder(
              onPageChanged: (index) {
                setState(() {
                  currentIndex = index;
                });
              },
              physics: BouncingScrollPhysics(),
              controller: pageController,
              itemCount: widget.charts.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  child: widget.charts[index],
                );
              },
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(
                statusBy.length,
                (index) {
                  return IntrinsicWidth(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          currentIndex = index;
                          pageController.jumpToPage(currentIndex);
                        });
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          MyText(
                            text: statusBy[index],
                            size: 13,
                            color: currentIndex == index
                                ? kDarkGreyColor4
                                : kDarkGreyColor4.withOpacity(0.47),
                            paddingBottom: 10,
                          ),
                          Container(
                            height: 3,
                            color: currentIndex == index
                                ? kSecondaryColor
                                : Colors.transparent,
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CustomChart extends StatelessWidget {
  CustomChart({
    this.customSplineChartData,
    this.primaryYAxisMax,
    this.primaryYAxisMin,
    this.primaryYAxisInterval,
    this.primaryXYAxisMax,
    this.primaryXYAxisMin,
    this.primaryXYAxisInterval,
  });

  List<CustomSplineChartData>? customSplineChartData;

  double? primaryYAxisMax;
  double? primaryYAxisMin;
  double? primaryYAxisInterval;
  double? primaryXYAxisMax;
  double? primaryXYAxisMin;
  double? primaryXYAxisInterval;

  @override
  Widget build(BuildContext context) {
    return SfCartesianChart(
      tooltipBehavior: TooltipBehavior(
        enable: true,
      ),
      margin: EdgeInsets.zero,
      borderWidth: 0,
      borderColor: Colors.transparent,
      plotAreaBorderWidth: 0,
      enableAxisAnimation: true,
      primaryYAxis: NumericAxis(
        name: 'yAxis',
        maximum: primaryYAxisMax,
        minimum: primaryYAxisMin,
        interval: primaryYAxisInterval,
        isVisible: true,
        plotOffset: 10.0,
        majorGridLines: MajorGridLines(
          width: 1,
          color: Color(0xffCCCCCC),
          dashArray: [
            2,
            3,
          ],
        ),
        majorTickLines: MajorTickLines(
          width: 0,
        ),
        axisLine: AxisLine(
          width: 0,
        ),
        opposedPosition: false,
        labelStyle: TextStyle(
          color: Color(0xff8A8A8A),
          fontSize: 11.0,
          fontFamily: GoogleFonts.dmSans().fontFamily,
          fontWeight: FontWeight.w500,
        ),
      ),
      primaryXAxis: CategoryAxis(
        name: 'xAxis',
        isVisible: false,
        maximum: primaryXYAxisMax,
        minimum: primaryXYAxisMin,
        interval: primaryXYAxisInterval,
        plotOffset: 0.0,
        majorGridLines: MajorGridLines(
          width: 0,
        ),
        axisLine: AxisLine(
          width: 0,
        ),
        majorTickLines: MajorTickLines(
          width: 0,
        ),
        labelStyle: TextStyle(
          color: Color(0xff8A8A8A),
          fontSize: 11.0,
          fontFamily: GoogleFonts.dmSans().fontFamily,
          fontWeight: FontWeight.w500,
        ),
      ),
      series: graphData(),
    );
  }

  dynamic graphData() {
    return <ChartSeries>[
      ColumnSeries<CustomSplineChartData, dynamic>(
        dataSource: customSplineChartData!,
        xValueMapper: (CustomSplineChartData data, _) => data.xValueMapper,
        yValueMapper: (CustomSplineChartData data, _) => data.yValueMapper,
        xAxisName: 'xAxis',
        yAxisName: 'yAxis',
        color: kSecondaryColor,
        width: 0.56,
        spacing: 0.3,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(5),
          topRight: Radius.circular(5),
        ),
      ),
    ];
  }
}

class CustomSplineChartData {
  CustomSplineChartData(
    this.xValueMapper,
    this.yValueMapper,
  );

  String? xValueMapper;
  int? yValueMapper;
}
