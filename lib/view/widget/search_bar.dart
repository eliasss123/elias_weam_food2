import 'package:elias_weam_food2/constant/color.dart';
import 'package:elias_weam_food2/constant/instance.dart';
import 'package:elias_weam_food2/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class SearchBar extends StatelessWidget {
  SearchBar({
    Key? key,
    this.onChanged,
    this.controller,
  }) : super(key: key);

  ValueChanged<String>? onChanged;
  TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      bool isDark = themeController.isDarkTheme.value;
      return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.02),
              offset: Offset(8, 8),
              blurRadius: 20,
              spreadRadius: 4,
            ),
          ],
        ),
        child: TextFormField(
          controller: controller,
          onChanged: onChanged,
          style: TextStyle(
            fontSize: 14,
            fontFamily: GoogleFonts.montserrat().fontFamily,
            color: isDark ? kPrimaryColor : kBlackColor2,
          ),
          decoration: InputDecoration(
            fillColor: isDark ? kDarkInputBgColor : kPrimaryColor,
            filled: true,
            prefixIcon: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  Assets.imagesSearch,
                  height: 15,
                ),
              ],
            ),
            counterText: '',
            contentPadding: EdgeInsets.symmetric(
              horizontal: 21,
              vertical: 16.5,
            ),
            hintText: 'search'.tr,
            hintStyle: TextStyle(
              fontFamily: GoogleFonts.montserrat().fontFamily,
              fontSize: 13,
              fontWeight: FontWeight.w500,
              color: kSearchHintColor,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14.0),
              borderSide: BorderSide(
                color: Colors.transparent,
                width: 1.0,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14.0),
              borderSide: BorderSide(
                color: Colors.transparent,
                width: 1.0,
              ),
            ),
          ),
        ),
      );
    });
  }
}
