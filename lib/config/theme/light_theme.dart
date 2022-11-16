import 'package:elias_weam_food2/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final ThemeData lightTheme = ThemeData(
  scaffoldBackgroundColor: kPrimaryColor,
  fontFamily: GoogleFonts.dmSans().fontFamily,
  appBarTheme: AppBarTheme(
    elevation: 0,
    backgroundColor: kPrimaryColor,
  ),
  splashColor: kBlackColor.withOpacity(0.05),
  highlightColor: kBlackColor.withOpacity(0.05),
  colorScheme: ColorScheme.fromSwatch().copyWith(
    secondary: kSecondaryColor.withOpacity(0.05),
  ),
  textSelectionTheme: TextSelectionThemeData(
    cursorColor: kSecondaryColor,
  ),
);
