import 'package:flutter/material.dart';

class STextTheme {
  STextTheme._();

  static TextTheme baseDark = ThemeData.dark().textTheme;
  static TextTheme baseLight = ThemeData.light().textTheme;

  static TextTheme darkTextTheme = ThemeData.dark()
      .textTheme
      .copyWith(
        displayLarge: const TextStyle(
          fontSize: 32,
          fontWeight: FontWeight.w700,
          overflow: TextOverflow.ellipsis,
        ),
        displayMedium: const TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.w700,
          overflow: TextOverflow.ellipsis,
        ),
        displaySmall: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w700,
          overflow: TextOverflow.ellipsis,
        ),
        headlineLarge: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w500,
          overflow: TextOverflow.ellipsis,
        ),
        headlineMedium: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w700,
          overflow: TextOverflow.ellipsis,
        ),
        headlineSmall: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w500,
          overflow: TextOverflow.ellipsis,
        ),
        titleLarge: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w700,
          overflow: TextOverflow.ellipsis,
        ),
        titleMedium: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          overflow: TextOverflow.ellipsis,
        ),
        titleSmall: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w700,
          overflow: TextOverflow.ellipsis,
        ),
        bodyLarge: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          overflow: TextOverflow.ellipsis,
        ),
        bodyMedium: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          overflow: TextOverflow.ellipsis,
        ),
        bodySmall: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w400,
          overflow: TextOverflow.ellipsis,
        ),
        labelLarge: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w700,
          overflow: TextOverflow.ellipsis,
        ),
        labelMedium: const TextStyle(
          fontSize: 10,
          fontWeight: FontWeight.w600,
          overflow: TextOverflow.ellipsis,
        ),
        labelSmall: const TextStyle(
          fontSize: 10,
          fontWeight: FontWeight.w500,
          overflow: TextOverflow.ellipsis,
        ),
      )
      .apply(
        fontFamily: 'inter',
        bodyColor: Colors.white70,
      );

  static TextTheme lightTextTheme = ThemeData.light()
      .textTheme
      .copyWith(
        displayLarge: const TextStyle(
          fontSize: 32,
          fontWeight: FontWeight.w700,
          overflow: TextOverflow.ellipsis,
        ),
        displayMedium: const TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.w700,
          overflow: TextOverflow.ellipsis,
        ),
        displaySmall: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w700,
          overflow: TextOverflow.ellipsis,
        ),
        headlineLarge: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w500,
          overflow: TextOverflow.ellipsis,
        ),
        headlineMedium: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w700,
          overflow: TextOverflow.ellipsis,
        ),
        headlineSmall: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w500,
          overflow: TextOverflow.ellipsis,
        ),
        titleLarge: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w700,
          overflow: TextOverflow.ellipsis,
        ),
        titleMedium: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          overflow: TextOverflow.ellipsis,
        ),
        titleSmall: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w700,
          overflow: TextOverflow.ellipsis,
        ),
        bodyLarge: const TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w500,
          overflow: TextOverflow.ellipsis,
        ),
        bodyMedium: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          overflow: TextOverflow.ellipsis,
        ),
        bodySmall: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w400,
          overflow: TextOverflow.ellipsis,
        ),
        labelLarge: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w700,
          overflow: TextOverflow.ellipsis,
        ),
        labelMedium: const TextStyle(
          fontSize: 10,
          fontWeight: FontWeight.w600,
          overflow: TextOverflow.ellipsis,
        ),
        labelSmall: const TextStyle(
          fontSize: 10,
          fontWeight: FontWeight.w500,
          overflow: TextOverflow.ellipsis,
        ),
      )
      .apply(
          fontFamily: 'inter',
          bodyColor: const Color.fromARGB(204, 0, 0, 0),
          displayColor: const Color.fromARGB(228, 0, 0, 0));
}
