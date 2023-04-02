import 'package:shared_preferences/shared_preferences.dart';

class UserSimplePreferences {
  static SharedPreferences? pref;
  static const _themeKey = 'themeKey';
  static const _languageIndexKey = 'languageKey';
  static const _chooseLanguageFirstTime = 'chooseLanguageFirstTime';

  static Future init() async {
    pref = await SharedPreferences.getInstance();
  }

  static Future setTheme(String theme) async {
    await pref!.setString(_themeKey, theme);
  }

  static Future getTheme() async {
    return await pref!.getString(_themeKey);
  }

  static Future setLanguageIndex(int index) async {
    await pref!.setInt(_languageIndexKey, index);
  }

  static Future getLanguageIndex() async {
    return await pref!.getInt(_languageIndexKey);
  }

  static Future isFirstLaunch(bool value) async {
    await pref!.setBool(_chooseLanguageFirstTime, value);
  }

  static Future getIsFirstLaunch() async {
    return await pref!.getBool(_chooseLanguageFirstTime);
  }
}
