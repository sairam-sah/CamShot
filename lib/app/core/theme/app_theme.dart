import 'package:flutter/material.dart';
// import 'package:get/get.dart';

import '../values/colors.dart';
import 'widget_theme/s_system_widget_theme.dart';
import 'widget_theme/s_text_theme.dart';

class SAppTheme {
  SAppTheme._();

  static ThemeData baseThemeLight = ThemeData.light();
  static ThemeData baseThemeDark = ThemeData.dark();

  static IconThemeData iconTheme(ColorScheme colors) {
    return baseThemeLight.iconTheme.copyWith(
      color: Colors.grey.shade600,
      size: 20,
    );
  }

  static ThemeData lightTheme = ThemeData.light().copyWith(
    // Add page transitions
    //general

    //color
    colorScheme: lightColorScheme,
    primaryColor: lightColorScheme.primary,

    //typography & icon
    textTheme: STextTheme.lightTextTheme,
    iconTheme: iconTheme(lightColorScheme),

    //components
    appBarTheme: SSystemWidgetTheme.sAppBarTheme(lightColorScheme),
    elevatedButtonTheme:
        SSystemWidgetTheme.sElevatedButtonTheme(lightColorScheme),
    outlinedButtonTheme:
        SSystemWidgetTheme.sOutlinedButtonTheme(lightColorScheme),
    inputDecorationTheme:
        SSystemWidgetTheme.sInputDecorationTheme(lightColorScheme),

    cardTheme: SSystemWidgetTheme.sCardTheme(),
    listTileTheme: SSystemWidgetTheme.sListTileTheme(lightColorScheme),
    bottomAppBarTheme: SSystemWidgetTheme.sBottomAppBarTheme(lightColorScheme),
    bottomNavigationBarTheme:
        SSystemWidgetTheme.sBottomNavigationBarTheme(lightColorScheme),
    navigationRailTheme:
        SSystemWidgetTheme.sNavigationRailTheme(lightColorScheme),
    // tabBarTheme: SSystemWidgetTheme.sTabBarTheme(lightColorScheme),
    drawerTheme: SSystemWidgetTheme.sDrawerTheme(lightColorScheme),
    scaffoldBackgroundColor: lightColorScheme.background,
  );

  static ThemeData darkTheme = ThemeData.dark().copyWith(
    // Add page transitions
    //general

    //color
    colorScheme: darkColorScheme,
    primaryColor: darkColorScheme.primary,

    //typography & icon
    textTheme: STextTheme.darkTextTheme,
    iconTheme: iconTheme(darkColorScheme),

    //components

    appBarTheme: SSystemWidgetTheme.sAppBarTheme(darkColorScheme),
    elevatedButtonTheme:
        SSystemWidgetTheme.sElevatedButtonTheme(darkColorScheme),
    outlinedButtonTheme:
        SSystemWidgetTheme.sOutlinedButtonTheme(darkColorScheme),
    inputDecorationTheme:
        SSystemWidgetTheme.sInputDecorationTheme(darkColorScheme),

    cardTheme: SSystemWidgetTheme.sCardTheme(),
    listTileTheme: SSystemWidgetTheme.sListTileTheme(darkColorScheme),
    bottomAppBarTheme: SSystemWidgetTheme.sBottomAppBarTheme(darkColorScheme),
    bottomNavigationBarTheme:
        SSystemWidgetTheme.sBottomNavigationBarTheme(darkColorScheme),
    navigationRailTheme:
        SSystemWidgetTheme.sNavigationRailTheme(darkColorScheme),
    tabBarTheme: SSystemWidgetTheme.sTabBarTheme(darkColorScheme),
    drawerTheme: SSystemWidgetTheme.sDrawerTheme(darkColorScheme),
    scaffoldBackgroundColor: darkColorScheme.background,
  );
}
