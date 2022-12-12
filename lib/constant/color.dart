import 'package:elias_weam_food2/generated/assets.dart';
import 'package:flutter/material.dart';

const kPrimaryColor = Color(0xffFFFFFF);
const kSecondaryColor = Color(0xff34D186);
const kTertiaryColor = Color(0xffA6A6A6);
const kGreenColor2 = Color(0xff34D186);
const kOnlineColor = Color(0xff64C862);
const kDarkGreenColor = Color(0xff2D644A);
const kLightGreenColor = Color(0xffD7F6E5);
const kLightGreenColor2 = Color(0xffE3F8EC);
const kOrangeColor = Color(0xffEB6E27);
const kGreyColor = Color(0xff9C9C9C);
const kGreyColor2 = Color(0xff8A8A8A);
const kGreyColor3 = Color(0xff808080);
const kGreyColor4 = Color(0xff8F8F8F);
const kGreyColor5 = Color(0xff7A7A7A);
const kGreyColor6 = Color(0xffEBF2EF);
const kGreyColor7 = Color(0xff9A9A9A);
const kGreyColor8 = Color(0xff7F7F7F);
const kGreyColor9 = Color(0xff6C6C6C);
const kGreyColor10 = Color(0xffD1D1D1);
const kGreyColor11 = Color(0xffC3C3C3);
const kGreyColor12 = Color(0xffA6A6A6);
const kGreyColor13 = Color(0xff979797);
const kBlackColor = Color(0xff000000);
const kBlackColor2 = Color(0xff040415);
const kBlackColor3 = Color(0xff12131D);
const kBlackColor4 = Color(0xff36414C);
const kBlackColor5 = Color(0xffE4E4E4);
const kBlackColor6 = Color(0xff323536);
const kDarkGreyColor = Color(0xff323232);
const kDarkGreyColor2 = Color(0xff717171);
const kDarkGreyColor3 = Color(0xff8F8F8F);
const kDarkGreyColor4 = Color(0xff474847);
const kMaroonColor = Color(0xff941E1E);
const kBorderColor = Color(0xffE9E9E9);
const kBorderColor2 = Color(0xffEAEAEA);
const kBorderColor3 = Color(0xffE8E8E8);
const kBorderColor4 = Color(0xffC3C1C4);
const kBorderColor5 = Color(0xffB8B6B5);
const kBorderColor6 = Color(0xffE0E0E0);
const kSeoulColor = Color(0xffF6F6F6);
const kSeoulColor1 = Color(0xffF5F5F5);
const kSeoulColor2 = Color(0xffFAFAFA);
const kSeoulColor3 = Color(0xffF9F9F9);
const kSeoulColor4 = Color(0xffF1F1F1);
const kSeoulColor5 = Color(0xffF7F7F7);
const kSeoulColor6 = Color(0xffF8F8F8);
const kSeoulColor7 = Color(0xffD9D9D9);
const kSeoulColor8 = Color(0xffE0E0E0);
const kSeoulColor9 = Color(0xffF3F3F3);
const kSeoulColor10 = Color(0xffFCFCFC);
const kLightGreyColor = Color(0xffE1E1E1);
const kLightGreyColor2 = Color(0xffA6A6A6);
const kLightGreyColor3 = Color(0xffA1A1A1);
const kUnselectedColor = Color(0xffCCCCCC);
const kSearchHintColor = Color(0xffABABAB);
const kRatingColor = Color(0xffFFB534);
const kClosedColor = Color(0xff121212);
const kInActiveSwitchColor = Color(0xffDADBDD);
const kRedColor = Color(0xffC81E1E);
const kRedColor2 = Color(0xffE24646);
const kRedColor3 = Color(0xffE31111);
const kUnSelectedButtonColor = Color(0xffC8C8C8);
const kDividerColor = Color(0xffEDEDED);
const kShadowColor = Color(0xff888888);
var kHintTextColor = const Color(0xff474847).withOpacity(0.60);
var kDisableColor = const Color(0xff000000).withOpacity(0.10);
var kDisableTextColor = const Color(0xff000000).withOpacity(0.26);

class ContainerDec {
  static final border3R16 = BoxDecoration(
    borderRadius: BorderRadius.circular(16),
    border: Border.all(
      color: kBorderColor3,
      width: 1.0,
    ),
  );
  static final border3R14 = BoxDecoration(
    borderRadius: BorderRadius.circular(14),
    border: Border.all(
      color: kBorderColor3,
      width: 1.0,
    ),
  );
  static final profileBg = BoxDecoration(
    color: kSeoulColor6,
    image: DecorationImage(
      image: AssetImage(
        Assets.imagesProfileBgEffect,
      ),
      alignment: Alignment.topCenter,
      fit: BoxFit.fitWidth,
    ),
  );
}
