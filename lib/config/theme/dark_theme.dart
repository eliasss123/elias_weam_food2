import 'package:elias_weam_food2/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final ThemeData darkTheme = ThemeData(
  scaffoldBackgroundColor: kDarkPrimaryColor,
  fontFamily: GoogleFonts.dmSans().fontFamily,
  appBarTheme: AppBarTheme(
    elevation: 0,
    backgroundColor: kDarkPrimaryColor,
  ),
  splashColor: kPrimaryColor.withOpacity(0.05),
  highlightColor: kPrimaryColor.withOpacity(0.05),
  colorScheme: ColorScheme.fromSwatch().copyWith(
    secondary: kDarkPrimaryColor.withOpacity(0.05),
  ),
  textSelectionTheme: TextSelectionThemeData(
    cursorColor: kPrimaryColor,
  ),
);
