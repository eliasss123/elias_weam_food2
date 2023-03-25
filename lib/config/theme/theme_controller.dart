import 'dart:developer';

import 'package:elias_weam_food2/config/theme/dark_theme.dart';
import 'package:elias_weam_food2/config/theme/light_theme.dart';
import 'package:elias_weam_food2/shared_preferences/user_simple_preferences.dart';
import 'package:get/get.dart';

class ThemeController extends GetxController {
  static ThemeController instance = Get.find<ThemeController>();
  RxBool isDarkTheme = false.obs;

  onToggle() {
    isDarkTheme.value = !isDarkTheme.value;
    isDarkTheme.value
        ? Get.changeTheme(darkTheme)
        : Get.changeTheme(lightTheme);
    UserSimplePreferences.setTheme(
      isDarkTheme.value ? 'DARK_MODE' : 'LIGHT_MODE',
    );
  }
}
