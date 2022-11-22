import 'package:elias_weam_food2/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class MyText extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  var text, color, weight, align, decoration, fontFamily;
  double? size, height;
  double? paddingTop, paddingLeft, paddingRight, paddingBottom, letterSpacing;
  FontStyle? fontStyle;

  // ignore: prefer_typing_uninitialized_variables
  var maxLines, overFlow;
  VoidCallback? onTap;

  MyText({
    Key? key,
    @required this.text,
    this.size,
    this.height,
    this.maxLines = 100,
    this.decoration = TextDecoration.none,
    this.color,
    this.letterSpacing,
    this.weight = FontWeight.w400,
    this.align,
    this.overFlow,
    this.fontFamily,
    this.paddingTop = 0,
    this.paddingRight = 0,
    this.paddingLeft = 0,
    this.paddingBottom = 0,
    this.onTap,
    this.fontStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: paddingTop!,
        left: paddingLeft!,
        right: paddingRight!,
        bottom: paddingBottom!,
      ),
      child: GestureDetector(
        onTap: onTap,
        child: Text(
          "$text",
          style: TextStyle(
            fontSize: size ?? 14,
            color: color ?? kBlackColor2,
            fontWeight: weight ?? FontWeight.w400,
            decoration: decoration,
            fontFamily: fontFamily ?? GoogleFonts.dmSans().fontFamily,
            height: height,
            fontStyle: fontStyle,
            letterSpacing: letterSpacing ?? 0.4,
          ),
          textAlign: align,
          maxLines: maxLines,
          overflow: overFlow,
        ),
      ),
    );
  }
}
