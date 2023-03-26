import 'package:elias_weam_food2/constant/color.dart';
import 'package:elias_weam_food2/view/widget/my_button.dart';
import 'package:elias_weam_food2/view/widget/my_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class OutGoingOrders extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          height: 144,
          child: SfRadialGauge(
            axes: <RadialAxis>[
              RadialAxis(
                minimum: 0,
                maximum: 100,
                showLabels: false,
                showTicks: false,
                axisLineStyle: AxisLineStyle(
                  thickness: 0.1,
                  cornerStyle: CornerStyle.bothFlat,
                  color: Color(0xfff0f0f0),
                  thicknessUnit: GaugeSizeUnit.factor,
                ),
                startAngle: 270,
                endAngle: 270,
                radiusFactor: 1.0,
                canScaleToFit: false,
                pointers: <GaugePointer>[
                  RangePointer(
                    value: 15.0,
                    width: 0.1,
                    sizeUnit: GaugeSizeUnit.factor,
                    color: kOrangeColor,
                    cornerStyle: CornerStyle.bothFlat,
                  ),
                  MarkerPointer(
                    value: 15,
                    markerType: MarkerType.rectangle,
                    markerWidth: 7.5,
                    color: kPrimaryColor,
                  )
                ],
                annotations: <GaugeAnnotation>[
                  GaugeAnnotation(
                    positionFactor: 0.1,
                    angle: 90,
                    widget: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        MyText(
                          text: '5',
                          size: 27,
                          weight: FontWeight.w500,
                          color: kBlackColor,
                        ),
                        MyText(
                          text: '13:54',
                          size: 17,
                          color: kBlackColor.withOpacity(0.60),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        MyText(
          paddingTop: 80,
          text: '5 ${'minutes'.tr} ${'left'.tr}',
          size: 19,
          weight: FontWeight.w700,
          align: TextAlign.center,
          paddingBottom: 15,
        ),
        MyText(
          text: 'start_preparing_the_order'.tr,
          color: kDarkGreyColor4.withOpacity(0.60),
          align: TextAlign.center,
          paddingBottom: 70,
        ),
        Center(
          child: SizedBox(
            width: 211,
            child: MyButton(
              height: 50,
              radius: 14.0,
              buttonText: 'ok'.tr.toUpperCase(),
              onTap: () {},
            ),
          ),
        ),
        SizedBox(
          height: 50,
        ),
      ],
    );
  }
}
