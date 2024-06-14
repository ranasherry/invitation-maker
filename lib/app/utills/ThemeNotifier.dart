import 'package:flutter/material.dart';

class ThemeNotifier extends ChangeNotifier {
  // ThemeMode _themeMode = ThemeMode.system;
  ThemeMode _themeMode = ThemeMode.dark;
  // ThemeMode _themeMode = ThemeMode.light;

  ThemeMode get themeMode => _themeMode;

  void setThemeMode(ThemeMode mode) {
    _themeMode = mode;
    notifyListeners();
  }
}


