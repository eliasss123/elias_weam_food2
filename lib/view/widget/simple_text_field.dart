import 'package:elias_weam_food2/constant/color.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SimpleTextField extends StatelessWidget {
  SimpleTextField({
    Key? key,
    this.hintText,
    this.marginBottom = 15.0,
    this.controller,
    this.onChanged,
    this.keyBoardType,
  }) : super(key: key);

  String? hintText;
  double? marginBottom;
  TextEditingController? controller;
  ValueChanged<String>? onChanged;
  TextInputType? keyBoardType;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: marginBottom!),
      child: TextFormField(
        controller: controller,
        onChanged: onChanged,
        keyboardType: keyBoardType,
        textInputAction: TextInputAction.next,
        style: TextStyle(
          fontSize: 14,
          color: kBlackColor,
        ),
        decoration: InputDecoration(
          counterText: '',
          contentPadding: EdgeInsets.symmetric(
            horizontal: 21,
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
        ),
      ),
    );
  }
}
