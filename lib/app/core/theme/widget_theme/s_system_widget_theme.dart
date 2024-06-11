import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SSystemWidgetTheme {
  SSystemWidgetTheme._();

  static AppBarTheme sAppBarTheme(ColorScheme colors) {
    return AppBarTheme(
      elevation: 0,
      backgroundColor: colors.surface,
      foregroundColor: colors.onSurface,
    );
  }

  static TabBarTheme sTabBarTheme(ColorScheme colors) {
    return TabBarTheme(
      labelColor: colors.secondary,
      unselectedLabelColor: colors.onSurfaceVariant,
      indicator: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: colors.secondary,
            width: 2,
          ),
        ),
      ),
    );
  }

  static BottomAppBarTheme sBottomAppBarTheme(ColorScheme colors) {
    return BottomAppBarTheme(
      color: colors.surface,
      elevation: 0,
    );
  }

  static BottomNavigationBarThemeData sBottomNavigationBarTheme(
      ColorScheme colors) {
    return BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      backgroundColor: colors.surfaceVariant,
      selectedItemColor: colors.onSurface,
      unselectedItemColor: colors.onSurfaceVariant,
      elevation: 0,
      landscapeLayout: BottomNavigationBarLandscapeLayout.centered,
    );
  }

  static NavigationRailThemeData sNavigationRailTheme(ColorScheme colors) {
    return const NavigationRailThemeData();
  }

  static DrawerThemeData sDrawerTheme(ColorScheme colors) {
    return DrawerThemeData(
      backgroundColor: colors.surface,
    );
  }

  static ShapeBorder get shapeMedium => RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(2),
      );

  static CardTheme sCardTheme() {
    return CardTheme(
      elevation: 0,
      shape: shapeMedium,
      clipBehavior: Clip.antiAlias,
    );
  }

  static ListTileThemeData sListTileTheme(ColorScheme colors) {
    return ListTileThemeData(
      shape: shapeMedium,
      selectedColor: colors.secondary,
    );
  }

  static ElevatedButtonThemeData sElevatedButtonTheme(ColorScheme colorScheme) {
    return ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
      minimumSize: const Size(double.maxFinite, 40),
      backgroundColor: colorScheme.primary,
      foregroundColor: colorScheme.onPrimary,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(2),
      ),
      elevation: 0,
    ));
  }

  static OutlinedButtonThemeData sOutlinedButtonTheme(ColorScheme colorScheme) {
    return OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        minimumSize: const Size(double.maxFinite, 40),
        side: BorderSide(color: colorScheme.primary),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(2),
          // side: BorderSide(color: lightColorScheme.primary ),
        ),
        elevation: 0,
      ),
    );
  }

  static InputDecorationTheme sInputDecorationTheme(ColorScheme colorScheme) {
    return InputDecorationTheme(
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      hintStyle: Get.textTheme.bodySmall,
      border: OutlineInputBorder(
          borderSide: BorderSide(color: colorScheme.outline),
          borderRadius: BorderRadius.circular(2)),
      enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: colorScheme.outline),
          borderRadius: BorderRadius.circular(2)),
      disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: colorScheme.outline.withOpacity(0.5)),
          borderRadius: BorderRadius.circular(2)),
      focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: colorScheme.primary),
          borderRadius: BorderRadius.circular(2)),
    );
  }
}
