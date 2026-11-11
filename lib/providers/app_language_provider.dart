import 'package:flutter/material.dart';

class AppLanguageProvider extends ChangeNotifier {
  String language = 'en';

  void changeLanguage(String nweLanguage) {
    if (language == nweLanguage) {
      return;
    }
    language = nweLanguage;
    notifyListeners();
  }
}
