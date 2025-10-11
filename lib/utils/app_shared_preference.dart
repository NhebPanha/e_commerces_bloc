import 'package:shared_preferences/shared_preferences.dart';

class AppSharedPreference {
  static SharedPreferences? _prefs;

  static Future init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static String? getAppLanguage() => _prefs?.getString("language");

  static Future<bool> setAppLanguage(String lan) => _prefs!.setString("language", lan);

  static String? getToken() => _prefs?.getString("token");

  static Future<bool> setToken(String token) => _prefs!.setString("token", token);
}
