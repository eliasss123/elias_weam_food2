import 'package:elias_weam_food2/constant/color.dart';
import 'package:elias_weam_food2/generated/assets.dart';
import 'package:elias_weam_food2/view/widget/my_text.dart';
import 'package:elias_weam_food2/view/widget/simple_app_bar.dart';
import 'package:elias_weam_food2/view/widget/week_day_toggle_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';

class ScheduleDetails extends StatefulWidget {
  @override
  State<ScheduleDetails> createState() => _ScheduleDetailsState();
}

class _ScheduleDetailsState extends State<ScheduleDetails> {
  bool isOpen = false;

  final List<Map<String, dynamic>> weekdays = [
    {
      'day': 'S',
      'isSelected': false,
    },
    {
      'day': 'M',
      'isSelected': false,
    },
    {
      'day': 'T',
      'isSelected': false,
    },
    {
      'day': 'W',
      'isSelected': false,
    },
    {
      'day': 'T',
      'isSelected': false,
    },
    {
      'day': 'F',
      'isSelected': false,
    },
    {
      'day': 'S',
      'isSelected': false,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kSeoulColor6,
      appBar: simpleAppBar(
        bgColor: kSeoulColor6,
        title: 'Time',
        titleWeight: FontWeight.w700,
      ),
      body: ListView(
        shrinkWrap: true,
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 20,
        ),
        children: [
          Container(
            height: 51,
            padding: EdgeInsets.symmetric(
              horizontal: 15,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: kPrimaryColor,
            ),
            child: Row(
              children: [
                Expanded(
                  child: MyText(
                    text: 'Schedule',
                    size: 20,
                    color: kBlackColor,
                  ),
                ),
                FlutterSwitch(
                  width: 46.01,
                  height: 26.71,
                  value: isOpen,
                  onToggle: (value) {
                    setState(() {
                      isOpen = !isOpen;
                    });
                  },
                  activeColor: kSecondaryColor,
                  inactiveColor: kInActiveSwitchColor,
                  borderRadius: 50.0,
                  toggleSize: 22.0,
                  padding: 2.2,
                  showOnOff: false,
                  toggleColor: kPrimaryColor,
                  inactiveToggleColor: kPrimaryColor,
                ),
              ],
            ),
          ),
          MyText(
            paddingTop: 40,
            text: 'TIME',
            size: 14,
            weight: FontWeight.w500,
            color: kBlackColor.withOpacity(0.60),
            paddingBottom: 10,
          ),
          Container(
            height: 112,
            padding: EdgeInsets.symmetric(
              horizontal: 20,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: kPrimaryColor,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MyText(
                      text: 'From',
                      size: 20,
                      color: kBlackColor,
                    ),
                    Container(
                      height: 32,
                      width: 50,
                      decoration: BoxDecoration(
                        color: kUnselectedColor.withOpacity(0.40),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Center(
                        child: MyText(
                          text: '23:00',
                          size: 12,
                          weight: FontWeight.w500,
                          color: kBlackColor.withOpacity(0.80),
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  height: 1,
                  color: kDividerColor,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MyText(
                      text: 'To',
                      size: 20,
                      color: kBlackColor,
                    ),
                    Container(
                      height: 32,
                      width: 50,
                      decoration: BoxDecoration(
                        color: kUnselectedColor.withOpacity(0.40),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Center(
                        child: MyText(
                          text: '23:00',
                          size: 12,
                          weight: FontWeight.w500,
                          color: kBlackColor.withOpacity(0.80),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          MyText(
            paddingTop: 40,
            text: 'REPEAT',
            size: 14,
            weight: FontWeight.w500,
            color: kBlackColor.withOpacity(0.60),
            paddingBottom: 10,
          ),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 10,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: kPrimaryColor,
            ),
            child: Wrap(
              alignment: WrapAlignment.spaceBetween,
              children: List.generate(
                weekdays.length,
                (index) {
                  var data = weekdays[index];
                  return WeekDayToggleButton(
                    onTap: () {
                      setState(() {
                        data['isSelected'] = !data['isSelected'];
                      });
                    },
                    isSelected: data['isSelected'],
                    weekDay: data['day'],
                  );
                },
              ),
            ),
          ),
          MyText(
            paddingTop: 10,
            text: 'Every day',
            size: 14,
            weight: FontWeight.w500,
            color: kBlackColor.withOpacity(0.60),
            paddingBottom: 40,
          ),
          Container(
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: kPrimaryColor,
            ),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () {},
                splashColor: kBlackColor.withOpacity(0.01),
                highlightColor: kBlackColor.withOpacity(0.01),
                borderRadius: BorderRadius.circular(16),
                child: Center(
                  child: MyText(
                    text: 'Delete',
                    size: 20,
                    color: kRedColor3,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
