import 'package:flutter/material.dart';

// Color Scheme for LightMode
ThemeData lightMode = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    appBarTheme: AppBarTheme(backgroundColor: Colors.white),
    scaffoldBackgroundColor: Colors.white,
    colorScheme: ColorScheme.light(
        background: Colors.white,
        primary: Colors.grey.shade900,
        onPrimary: Colors.pink,
        secondary: Colors.white,
        onSecondary: Colors.pink.shade300,
        tertiary: Colors.white,
        shadow: Colors.grey.shade300));

// Color Scheme for DarkMode

ThemeData darkMode = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    appBarTheme: AppBarTheme(backgroundColor: Colors.grey.shade900),
    scaffoldBackgroundColor: Colors.grey.shade900,
    colorScheme: ColorScheme.dark(
        background: Colors.grey.shade900,
        primary: Colors.white,
        onPrimary: Colors.pink,
        secondary: Colors.grey.shade800,
        onSecondary: Colors.pink.shade300,
        tertiary: Colors.grey.shade600,
        shadow: Colors.transparent));
