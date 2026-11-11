import 'package:flutter/material.dart';

class AppThemeProvider extends ChangeNotifier {
  ThemeMode appTheme = ThemeMode.dark;

  void changeTheme(ThemeMode nweTheme) {
    if (appTheme == nweTheme) {
      return;
    }
    appTheme = nweTheme;
    notifyListeners();
  }

  bool isDarkMode() {
    return appTheme == ThemeMode.dark;
  }
}
