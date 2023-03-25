import 'package:elias_weam_food2/shared_preferences/user_simple_preferences.dart';
import 'package:elias_weam_food2/translations/ar_IL.dart';
import 'package:elias_weam_food2/translations/en_US.dart';
import 'package:elias_weam_food2/translations/he_IL.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class LanguageController extends GetxController {
  static LanguageController instance = Get.find<LanguageController>();

  RxInt currentIndex = 0.obs;
  RxBool isEnglish = true.obs;

  void onLanguageChanged(
    String lang,
    int index,
  ) async {
    currentIndex.value = index;
    Localization().selectedLocale(lang);
    await UserSimplePreferences.setLanguageIndex(index);
    if (currentIndex.value != 0) {
      isEnglish.value = false;
    } else {
      isEnglish.value = true;
    }
    // isOnGetStarted ? null : Get.offAll(() => SplashScreen());
    // Get.back();
  }

  getCurrentLocale() {
    if (currentIndex.value == 0) {
      return 'en';
    } else if (currentIndex.value == 1) {
      return 'he';
    } else {
      return 'ar';
    }
  }
}

class Localization extends Translations {
  static Locale currentLocale = Locale('en', 'US');
  static Locale fallBackLocale = Locale('ar', 'IL');

  final List<String> languages = [
    'English',
    'Hebrew',
    'Arabic',
  ];

  final List<Locale> locales = [
    Locale('en', 'US'),
    Locale('he', 'IL'),
    Locale('ar', 'IL'),
  ];

  void selectedLocale(String lang) {
    final _locale = _getLocaleFromLanguage(lang);
    currentLocale = _locale;
    Get.updateLocale(currentLocale);
  }

  Locale _getLocaleFromLanguage(String lang) {
    for (int i = 0; i < languages.length; i++) {
      if (lang == languages[i]) {
        return locales[i];
      }
    }
    return Get.locale!;
  }

  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': english,
        'he_IL': hebrew,
        'ar_IL': arabic,
      };
}
