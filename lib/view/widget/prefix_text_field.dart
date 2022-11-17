import 'package:elias_weam_food2/constant/color.dart';
import 'package:flutter/material.dart';

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
    return TextFormField(
      obscuringCharacter: '•',
      obscureText: isObSecure!,
      controller: controller,
      onChanged: onChanged,
      keyboardType: keyBoardType,
      textInputAction: TextInputAction.next,
      textAlignVertical: TextAlignVertical.center,
      style: TextStyle(
        fontSize: 14,
        color: kBlackColor2,
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
          color: kHintTextColor,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.0),
          borderSide: BorderSide(
            color: kBorderColor,
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
          children: [
            Image.asset(
              prefixIcon!,
              height: prefixIconSize,
            ),
          ],
        ),
      ),
    );
  }
}