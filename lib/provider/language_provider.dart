import 'package:flutter/material.dart';
import 'package:tmdb_app/l10n/l10n.dart';

class LanguageProvider extends ChangeNotifier {
  Locale _currentLocale = const Locale("en");

  Locale get currentLocale => _currentLocale;

  void changeLocale(String code) {
    if (!L10n.allLanguages.contains(Locale(code))) return;

    _currentLocale = Locale(code);
    notifyListeners();
  }

  // void clearLocale() {
  //   _locale = null;
  //   notifyListeners();
  // }
}
