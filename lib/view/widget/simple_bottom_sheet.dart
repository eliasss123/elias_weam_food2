import 'package:elias_weam_food2/constant/color.dart';
import 'package:elias_weam_food2/constant/instance.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class SimpleBottomSheet extends StatelessWidget {
  SimpleBottomSheet({
    Key? key,
    required this.content,
    this.height,
  }) : super(key: key);
  final Widget content;
  double? height;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      bool isDark = themeController.isDarkTheme.value;
      return Container(
        height: height ?? 316,
        // margin: MediaQuery.of(context).viewInsets,
        decoration: BoxDecoration(
          color: isDark ? kDarkInputBgColor : kPrimaryColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(35),
            topRight: Radius.circular(35),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(
              child: Container(
                margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
                height: 4,
                width: 45,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: isDark ? Color(0xff909090): Color(0xffDFDFDF),
                ),
              ),
            ),
            Expanded(
              child: content,
            ),
          ],
        ),
      );
    });
  }
}
