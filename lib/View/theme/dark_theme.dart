import 'package:flutter/material.dart';

final ThemeData customDarkTheme = ThemeData.dark().copyWith(
  scaffoldBackgroundColor: Colors.black,
  primaryColor: Colors.tealAccent,
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.black87,
    foregroundColor: Colors.white,
    titleTextStyle: TextStyle(color: Colors.white),
  ),
  textTheme: const TextTheme(
    bodyLarge: TextStyle(color: Colors.white, fontSize: 16),
    bodyMedium: TextStyle(color: Colors.white70),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.tealAccent,
      foregroundColor: Colors.black,
    ),
  ),
  switchTheme: SwitchThemeData(
    thumbColor: WidgetStateProperty.all(Colors.tealAccent),
    trackColor: WidgetStateProperty.all(Colors.tealAccent.withOpacity(0.5)),
  ),
);
