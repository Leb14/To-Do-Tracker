import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ThemeController extends GetxController {
  final Rx<ThemeMode> _themeMode = ThemeMode.system.obs;

  ThemeMode get themeMode => _themeMode.value;

  bool get isDarkMode => _themeMode.value == ThemeMode.dark;

  void toggleTheme(bool isDark) {
    _themeMode.value = isDark ? ThemeMode.dark : ThemeMode.light;
    update();
  }

  void setThemeMode(ThemeMode mode) {
    _themeMode.value = mode;
    update();
  }
}
