import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppLanguageProvider extends ChangeNotifier {
  String language = 'en';

  AppLanguageProvider() {
    loadLanguage();
  }

  void changeLanguage(String nweLanguage) async {
    if (language == nweLanguage) {
      return;
    }
    language = nweLanguage;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('language', nweLanguage);
    notifyListeners();
  }

  void loadLanguage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    language = prefs.getString('language') ?? 'en';
    notifyListeners();
  }
}
