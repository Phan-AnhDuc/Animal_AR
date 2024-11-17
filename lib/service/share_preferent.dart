import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesHelper {
  static Future<String> getString(String key) async {
    try {
      SharedPreferences preferences = await SharedPreferences.getInstance();
      return preferences.getString(key) ?? '';
    } catch (e) {
      return '';
    }
  }

  static void setString(String key, String value) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString(key, value);
  }

  static void setBool(String key, bool value) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setBool(key, value);
  }

  static Future<bool> getBool(String key) async {
    try {
      SharedPreferences preferences = await SharedPreferences.getInstance();
      return preferences.getBool(key) ?? false;
    } catch (e) {
      return false;
    }
  }

  static void removeValues(String key) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.remove(key);
  }
}
