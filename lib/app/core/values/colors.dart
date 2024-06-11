/* -- List of colors --*/
import 'package:flutter/material.dart';

// const lightColorScheme = ColorScheme(
//   brightness: Brightness.light,
//   primary: Color(0xFF00ccbc),
//   onPrimary: Color(0xFFFFFFFF),
//   primaryContainer: Color(0xFF65F9E8),
//   onPrimaryContainer: Color(0xFF00201D),
//   secondary: Color(0xFF0060A8),
//   onSecondary: Color(0xFFFFFFFF),
//   secondaryContainer: Color(0xFFD3E4FF),
//   onSecondaryContainer: Color(0xFF001C38),
//   tertiary: Color(0xFF006E2B),
//   onTertiary: Color(0xFFFFFFFF),
//   tertiaryContainer: Color(0xFF69FF88),
//   onTertiaryContainer: Color(0xFF002108),
//   error: Color(0xFFBA1A1A),
//   errorContainer: Color(0xFFFFDAD6),
//   onError: Color(0xFFFFFFFF),
//   onErrorContainer: Color(0xFF410002),
//   background: Color(0xFFFAFDFB),
//   onBackground: Color(0xFF191C1C),
//   surface: Color(0xFFFAFDFB),
//   onSurface: Color(0xFF191C1C),
//   surfaceVariant: Color(0xFFDAE5E2),
//   onSurfaceVariant: Color(0xFF3F4947),
//   outline: Color(0xFFCCCCCC),
//   onInverseSurface: Color(0xFFEFF1EF),
//   inverseSurface: Color(0xFF2D3130),
//   inversePrimary: Color(0xFF40DCCC),
//   shadow: Color(0xFF000000),
//   surfaceTint: Color(0xFF006A62),
//   outlineVariant: Color(0xFFBEC9C6),
//   scrim: Color(0xFF000000),
// );

// const darkColorScheme = ColorScheme(
//   brightness: Brightness.dark,
//   primary: Color(0xFF40DCCC),
//   onPrimary: Color(0xFF003732),
//   primaryContainer: Color(0xFF005049),
//   onPrimaryContainer: Color(0xFF65F9E8),
//   secondary: Color(0xFFA1C9FF),
//   onSecondary: Color(0xFF00325B),
//   secondaryContainer: Color(0xFF004880),
//   onSecondaryContainer: Color(0xFFD3E4FF),
//   tertiary: Color(0xFF42E26D),
//   onTertiary: Color(0xFF003913),
//   tertiaryContainer: Color(0xFF00531E),
//   onTertiaryContainer: Color(0xFF69FF88),
//   error: Color(0xFFFFB4AB),
//   errorContainer: Color(0xFF93000A),
//   onError: Color(0xFF690005),
//   onErrorContainer: Color(0xFFFFDAD6),
//   background: Color(0xFF191C1C),
//   onBackground: Color(0xFFE0E3E1),
//   surface: Color(0xFF191C1C),
//   onSurface: Color(0xFFE0E3E1),
//   surfaceVariant: Color(0xFF3F4947),
//   onSurfaceVariant: Color(0xFFBEC9C6),
//   outline: Color(0xFF899390),
//   onInverseSurface: Color(0xFF191C1C),
//   inverseSurface: Color(0xFFE0E3E1),
//   inversePrimary: Color(0xFF006A62),
//   shadow: Color(0xFF000000),
//   surfaceTint: Color(0xFF40DCCC),
//   outlineVariant: Color(0xFF3F4947),
//   scrim: Color(0xFF000000),
// );
const lightColorScheme = ColorScheme(
  brightness: Brightness.light,
  primary: Color(0xFFFF0066),
  onPrimary: Color(0xFFFFFFFF),
  primaryContainer: Color(0xFFFFD8E6),
  onPrimaryContainer: Color(0xFF3D0024),
  secondary: Color(0xFF006E17),
  onSecondary: Color(0xFFFFFFFF),
  secondaryContainer: Color(0xFF76FF74),
  onSecondaryContainer: Color(0xFF002203),
  tertiary: Color(0xFF005FAE),
  onTertiary: Color(0xFFFFFFFF),
  tertiaryContainer: Color(0xFFD4E3FF),
  onTertiaryContainer: Color.fromRGBO(0, 28, 58, 1),
  error: Color(0xFFBA1A1A),
  errorContainer: Color(0xFFFFDAD6),
  onError: Color(0xFFFFFFFF),
  onErrorContainer: Color(0xFF410002),
  background: Color(0xFFFFFBFF),
  onBackground: Color(0xFF1F1A1C),
  surface: Color(0xFFFFFBFF),
  onSurface: Color(0xFF1F1A1C),
  surfaceVariant: Color(0xFFF1DEE3),
  onSurfaceVariant: Color(0xFF504348),
  outline: Color(0xFFCCCCCC),
  onInverseSurface: Color(0xFFFAEEF0),
  inverseSurface: Color(0xFF352F31),
  inversePrimary: Color(0xFFFFAFD1),
  shadow: Color(0xFF000000),
  surfaceTint: Color(0xFFAC2571),
  outlineVariant: Color(0xFFD4C2C7),
  scrim: Color(0xFF000000),
);

const darkColorScheme = ColorScheme(
  brightness: Brightness.dark,
  primary: Color(0xFFFFAFD1),
  onPrimary: Color(0xFF63003D),
  primaryContainer: Color(0xFF8B0058),
  onPrimaryContainer: Color(0xFFFFD8E6),
  secondary: Color(0xFF58E15B),
  onSecondary: Color(0xFF003908),
  secondaryContainer: Color(0xFF00530F),
  onSecondaryContainer: Color(0xFF76FF74),
  tertiary: Color(0xFFA5C8FF),
  onTertiary: Color(0xFF00315E),
  tertiaryContainer: Color(0xFF004785),
  onTertiaryContainer: Color(0xFFD4E3FF),
  error: Color(0xFFFFB4AB),
  errorContainer: Color(0xFF93000A),
  onError: Color(0xFF690005),
  onErrorContainer: Color(0xFFFFDAD6),
  background: Color(0xFF1F1A1C),
  onBackground: Color(0xFFEBE0E2),
  surface: Color(0xFF1F1A1C),
  onSurface: Color(0xFFEBE0E2),
  surfaceVariant: Color(0xFF504348),
  onSurfaceVariant: Color(0xFFD4C2C7),
  outline: Color(0xFF9D8C92),
  onInverseSurface: Color(0xFF1F1A1C),
  inverseSurface: Color(0xFFEBE0E2),
  inversePrimary: Color(0xFFAC2571),
  shadow: Color(0xFF000000),
  surfaceTint: Color(0xFFFFAFD1),
  outlineVariant: Color(0xFF504348),
  scrim: Color(0xFF000000),
);

class SColors {
  SColors._();

  static const Color white = Color.fromARGB(255, 255, 255, 255);
  static const Color black = Color.fromARGB(255, 0, 0, 0);
  static const Color grey = Color.fromARGB(255, 143, 143, 143);
  static const Color titleTextColor = Color.fromARGB(255, 192, 87, 145);
  static const Color locationIconColor = Color(0xFFFFD700);
  static const Color sunsineYellow = Color(0xFFFFD700);
  static const Color golden = Color(0xFFFFD700);
  static const Color iconColor = Color.fromARGB(255, 148, 46, 46);
  static const Color iconColor2 = Color.fromARGB(255, 230, 63, 12);
  static const Color favoriteColor = Color.fromARGB(255, 245, 6, 78);

  static const Color textColor = Color.fromARGB(169, 0, 0, 0);
  static const Color textColorGrey = Color.fromRGBO(158, 158, 158, 1);
}
