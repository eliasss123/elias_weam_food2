import 'package:elias_weam_food2/constant/color.dart';
import 'package:elias_weam_food2/view/widget/my_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

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
