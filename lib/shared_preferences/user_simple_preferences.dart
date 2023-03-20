import 'package:shared_preferences/shared_preferences.dart';

class UserSimplePreferences {
  static SharedPreferences? pref;
  static const _themeKey = 'themeKey';

  static Future init() async {
    pref = await SharedPreferences.getInstance();
  }

  static Future setTheme(String theme) async {
    await pref!.setString(_themeKey, theme);
  }

  static Future getTheme() async {
    return await pref!.getString(_themeKey);
  }
}
