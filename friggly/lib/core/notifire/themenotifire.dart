import 'package:flutter/material.dart';
import 'package:friggly/app/constants/appkeys.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeNotifier with ChangeNotifier {
  bool _darktheme = false;
  bool get darkTheme => _darktheme;

  themeNotifire() {
    _loadFromPrefs();
  }

  toggleTheme() {
    _darktheme = !_darktheme;
    notifyListeners();
  }

  _loadFromPrefs() async {
    var val = await getDarkMode();
    _darktheme = val ?? false;
    notifyListeners();
  }

  _saveToPrefs() async {
    await saveDarkMode(_darktheme);
  }

  static Future<bool?> saveDarkMode(bool darkMode) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    return await pref.setBool(AppKeys.appMode, darkMode);
  }

  static Future<bool?> getDarkMode() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    return await pref.getBool(AppKeys.appMode);
  }
}
