import 'package:elias_weam_food2/constant/color.dart';
import 'package:elias_weam_food2/generated/assets.dart';
import 'package:elias_weam_food2/view/widget/my_text.dart';
import 'package:flutter/material.dart';

class PasswordField extends StatefulWidget {
  PasswordField({
    this.labelText,
    this.hintText,
    this.controller,
    this.onChanged,
    this.keyBoardType,
    this.isObSecure = true,
    this.marginBottom = 15.0,
  });

  TextEditingController? controller;
  ValueChanged<String>? onChanged;
  TextInputType? keyBoardType;
  String? labelText, hintText;
  bool? isObSecure;
  double? marginBottom;

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: widget.marginBottom!),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          MyText(
            text: widget.labelText,
            size: 14,
            weight: FontWeight.w600,
            paddingBottom: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: TextFormField(
              obscuringCharacter: '•',
              obscureText: widget.isObSecure!,
              controller: widget.controller,
              onChanged: widget.onChanged,
              keyboardType: widget.keyBoardType,
              textInputAction: TextInputAction.next,
              style: TextStyle(
                fontSize: 14,
                color: kBlackColor2,
              ),
              decoration: InputDecoration(
                suffixIcon: Column(
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
                ),
                counterText: '',
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 21,
                  vertical: 16.5,
                ),
                hintText: widget.hintText,
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
          ),
        ],
      ),
    );
  }
}
