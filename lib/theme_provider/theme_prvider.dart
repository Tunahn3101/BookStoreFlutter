import 'package:flutter/material.dart';

class ThemeProvider with ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.system;
  Brightness? _systemBrightness;

  ThemeMode get themeMode => _themeMode;
  Brightness? get systemBrightness => _systemBrightness;

  void setThemeMode(ThemeMode themeMode) {
    if (_themeMode != themeMode) {
      _themeMode = themeMode;
      notifyListeners();
    }
  }

  void updateSystemBrightness(Brightness brightness) {
    if (_systemBrightness != brightness) {
      _systemBrightness = brightness;
      notifyListeners();
    }
  }

  Color get swapColor {
    Brightness currentBrightness = themeMode == ThemeMode.system
        ? _systemBrightness ?? Brightness.light
        : (themeMode == ThemeMode.dark ? Brightness.dark : Brightness.light);

    return currentBrightness == Brightness.dark ? Colors.white : Colors.black;
  }
}
