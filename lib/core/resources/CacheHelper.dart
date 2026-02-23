import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static late SharedPreferences _sharedPreferences;

  static Future<void> init() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  static Future<bool> saveData({
    required String key,
    required dynamic value,
  }) async {
    if (value is bool) return _sharedPreferences.setBool(key, value);
    if (value is String) return _sharedPreferences.setString(key, value);
    if (value is int) return _sharedPreferences.setInt(key, value);
    if (value is double) return _sharedPreferences.setDouble(key, value);
    return _sharedPreferences.setString(key, value.toString());
  }

  static dynamic getData({required String key}) {
    return _sharedPreferences.get(key);
  }

  static bool getBool({required String key}) {
    return _sharedPreferences.getBool(key) ?? false;
  }

  static Future<bool> removeData({required String key}) async {
    return _sharedPreferences.remove(key);
  }

  static Future<bool> clearData() async {
    return _sharedPreferences.clear();
  }
}