import 'package:elias_weam_food2/constant/color.dart';
import 'package:elias_weam_food2/constant/instance.dart';
import 'package:elias_weam_food2/generated/assets.dart';
import 'package:elias_weam_food2/view/widget/my_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class ProfileFilledTextField extends StatefulWidget {
  ProfileFilledTextField({
    this.labelText,
    this.hintText,
    this.controller,
    this.onChanged,
    this.keyBoardType,
    this.isObSecure = false,
    this.haveObSecureIcon = false,
    this.havePrefix = false,
    this.prefix,
    this.marginBottom = 18.0,
  });

  TextEditingController? controller;
  ValueChanged<String>? onChanged;
  TextInputType? keyBoardType;
  String? labelText, hintText;
  bool? isObSecure, haveObSecureIcon, havePrefix;
  double? marginBottom;
  Widget? prefix;

  @override
  State<ProfileFilledTextField> createState() => _ProfileFilledTextFieldState();
}

class _ProfileFilledTextFieldState extends State<ProfileFilledTextField> {
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      bool isDark = themeController.isDarkTheme.value;
      return Container(
        margin: EdgeInsets.only(bottom: widget.marginBottom!),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            MyText(
              text: widget.labelText,
              size: 14,
              weight: FontWeight.w600,
              paddingBottom: 8,
              color: isDark ? kPrimaryColor : kBlackColor2,
            ),
            TextFormField(
              cursorColor: isDark ? kPrimaryColor : kBlackColor,
              obscuringCharacter: '•',
              obscureText: widget.isObSecure!,
              controller: widget.controller,
              onChanged: widget.onChanged,
              keyboardType: widget.keyBoardType,
              textInputAction: TextInputAction.next,
              style: TextStyle(
                fontSize: 16,
                color: isDark ? kPrimaryColor : kBlackColor,
              ),
              decoration: InputDecoration(
                fillColor: isDark ? kDarkInputBgColor : kSeoulColor4,
                filled: true,
                prefixIcon: widget.havePrefix! ? widget.prefix : null,
                suffixIcon: widget.haveObSecureIcon!
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                widget.isObSecure = !widget.isObSecure!;
                              });
                            },
                            child: Image.asset(
                              widget.isObSecure!
                                  ? Assets.imagesEyeDisable
                                  : Assets.imagesEye,
                              height: 21,
                            ),
                          ),
                        ],
                      )
                    : SizedBox(),
                counterText: '',
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 21,
                  vertical: 16.5,
                ),
                hintText: widget.hintText,
                hintStyle: TextStyle(
                  fontSize: 14,
                  color: isDark ? kDarkHintColor : kHintTextColor,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16.0),
                  borderSide: BorderSide(
                    color: Colors.transparent,
                    width: 1.0,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16.0),
                  borderSide: BorderSide(
                    color: Colors.transparent,
                    width: 1.0,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}
