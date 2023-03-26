import 'package:elias_weam_food2/constant/color.dart';
import 'package:elias_weam_food2/constant/instance.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class PrefixTextField extends StatelessWidget {
  PrefixTextField({
    Key? key,
    this.hintText,
    this.marginBottom = 15.0,
    this.controller,
    this.onChanged,
    this.keyBoardType,
    this.prefixIcon,
    this.prefixIconSize,
    this.isObSecure = false,
  }) : super(key: key);

  String? hintText, prefixIcon;
  double? marginBottom, prefixIconSize;
  TextEditingController? controller;
  ValueChanged<String>? onChanged;
  TextInputType? keyBoardType;
  bool? isObSecure;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      bool isDark = themeController.isDarkTheme.value;
      bool isEnglish = languageController.isEnglish.value;
      return TextFormField(
        cursorColor: kSecondaryColor,
        obscuringCharacter: '•',
        obscureText: isObSecure!,
        controller: controller,
        onChanged: onChanged,
        keyboardType: keyBoardType,
        textInputAction: TextInputAction.next,
        textAlignVertical: TextAlignVertical.center,
        style: TextStyle(
          fontSize: 14,
          color: isDark ? kPrimaryColor : kBlackColor2,
        ),
        decoration: InputDecoration(
          counterText: '',
          contentPadding: EdgeInsets.symmetric(
            horizontal: 8,
            vertical: 16.5,
          ),
          hintText: hintText,
          hintStyle: TextStyle(
            fontSize: 14,
            color: isDark ? kDarkHintColor : kHintTextColor,
          ),
          filled: true,
          fillColor: isDark ? kDarkInputBgColor : Colors.transparent,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16.0),
            borderSide: BorderSide(
              color: isDark ? kPrimaryColor.withOpacity(0.06) : kBorderColor,
              width: 1.0,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16.0),
            borderSide: BorderSide(
              color: kSecondaryColor,
              width: 1.0,
            ),
          ),
          prefixIcon: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment:isEnglish ? CrossAxisAlignment.center: CrossAxisAlignment.start,
            children: [
              Transform(
                transform: Matrix4.identity()
                  ..scale(isEnglish ? 1.0 : -1.0, 1.0, 1.0),
                child: Image.asset(
                  prefixIcon!,
                  height: prefixIconSize,
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
