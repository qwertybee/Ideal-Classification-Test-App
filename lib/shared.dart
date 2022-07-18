import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefUtils {

  static saveInt(String key, int message) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setInt(key, message);
  }

  static readPrefInt(String key) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    debugPrint(pref.getInt(key).toString());
    return pref.getInt(key);
  }

  static clearPref() async { // clear all data from sharedPrefs
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }

}