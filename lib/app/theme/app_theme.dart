import 'package:flutter/material.dart';

// Color Scheme for LightMode
ThemeData lightMode = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    appBarTheme: AppBarTheme(backgroundColor: Color(0xFFE7EBFA)),
    scaffoldBackgroundColor: Color(0xFFE7EBFA),
    colorScheme: ColorScheme.light(
        background: Color(0xFFE7EBFA),
        primary: Colors.grey.shade900,
        secondary: Colors.white,
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
        secondary: Colors.grey.shade800,
        tertiary: Colors.grey.shade600,
        shadow: Colors.transparent));
