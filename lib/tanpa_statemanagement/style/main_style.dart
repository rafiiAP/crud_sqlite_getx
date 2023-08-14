import 'package:flutter/material.dart';

class MainStyle {
  static final light = ThemeData(
    colorScheme: const ColorScheme.light().copyWith(
      primary: Colors.deepPurple,
      onPrimary: Colors.white,
      secondary: const Color.fromARGB(255, 129, 93, 190),
      onSecondary: Colors.white,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.deepPurple,
      foregroundColor: Colors.white,
    ),
    cardTheme: const CardTheme(
      color: Colors.deepPurple,
    ),
    textTheme: const TextTheme(
      displayLarge: TextStyle(
          fontSize: 96, fontWeight: FontWeight.w300, letterSpacing: -1.5),
      displayMedium: TextStyle(
          fontSize: 60, fontWeight: FontWeight.w300, letterSpacing: -0.5),
      displaySmall: TextStyle(fontSize: 48, fontWeight: FontWeight.w400),
      headlineMedium: TextStyle(
          fontSize: 34, fontWeight: FontWeight.w400, letterSpacing: 0.25),
      headlineSmall: TextStyle(fontSize: 24, fontWeight: FontWeight.w400),
      titleLarge: TextStyle(
          fontSize: 20, fontWeight: FontWeight.w500, letterSpacing: 0.15),
      titleMedium: TextStyle(
          fontSize: 16, fontWeight: FontWeight.w400, letterSpacing: 0.15),
      titleSmall: TextStyle(
          fontSize: 14, fontWeight: FontWeight.w500, letterSpacing: 0.1),
      bodyLarge: TextStyle(
          fontSize: 16, fontWeight: FontWeight.w400, letterSpacing: 0.5),
      bodyMedium: TextStyle(
          fontSize: 14, fontWeight: FontWeight.w400, letterSpacing: 0.25),
      labelLarge: TextStyle(
          fontSize: 14, fontWeight: FontWeight.w500, letterSpacing: 1.25),
      bodySmall: TextStyle(
          fontSize: 12, fontWeight: FontWeight.w400, letterSpacing: 0.4),
      labelSmall: TextStyle(
          fontSize: 10, fontWeight: FontWeight.w400, letterSpacing: 1.5),
    ),
  );

  static final dark = ThemeData(
    colorScheme: const ColorScheme.dark().copyWith(
      primary: Colors.redAccent,
      onPrimary: Colors.white,
      secondary: const Color.fromARGB(255, 129, 93, 190),
      onSecondary: Colors.white,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.deepPurple,
      foregroundColor: Colors.white,
    ),
    cardTheme: const CardTheme(
      color: Colors.deepPurple,
    ),
    textTheme: const TextTheme(
      displayLarge: TextStyle(
          fontSize: 96, fontWeight: FontWeight.w300, letterSpacing: -1.5),
      displayMedium: TextStyle(
          fontSize: 60, fontWeight: FontWeight.w300, letterSpacing: -0.5),
      displaySmall: TextStyle(fontSize: 48, fontWeight: FontWeight.w400),
      headlineMedium: TextStyle(
          fontSize: 34, fontWeight: FontWeight.w400, letterSpacing: 0.25),
      headlineSmall: TextStyle(fontSize: 24, fontWeight: FontWeight.w400),
      titleLarge: TextStyle(
          fontSize: 20, fontWeight: FontWeight.w500, letterSpacing: 0.15),
      titleMedium: TextStyle(
          fontSize: 16, fontWeight: FontWeight.w400, letterSpacing: 0.15),
      titleSmall: TextStyle(
          fontSize: 14, fontWeight: FontWeight.w500, letterSpacing: 0.1),
      bodyLarge: TextStyle(
          fontSize: 16, fontWeight: FontWeight.w400, letterSpacing: 0.5),
      bodyMedium: TextStyle(
          fontSize: 14, fontWeight: FontWeight.w400, letterSpacing: 0.25),
      labelLarge: TextStyle(
          fontSize: 14, fontWeight: FontWeight.w500, letterSpacing: 1.25),
      bodySmall: TextStyle(
          fontSize: 12, fontWeight: FontWeight.w400, letterSpacing: 0.4),
      labelSmall: TextStyle(
          fontSize: 10, fontWeight: FontWeight.w400, letterSpacing: 1.5),
    ),
  );
}
