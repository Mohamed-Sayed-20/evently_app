import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppThemeProvider extends ChangeNotifier {
  ThemeMode appTheme = ThemeMode.dark;

  AppThemeProvider() {
    loadTheme();
  }

  void changeTheme(ThemeMode newTheme) async {
    if (appTheme == newTheme) {
      return;
    }
    appTheme = newTheme;

    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isDark', newTheme == ThemeMode.dark);
    notifyListeners();
  }

  bool isDarkMode() {
    return appTheme == ThemeMode.dark;
  }

  void loadTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isDark = prefs.getBool('isDark') ?? true;
    appTheme = isDark ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
}
