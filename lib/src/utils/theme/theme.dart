import 'package:flutter/material.dart';
import 'widget_theme/widget_theme.dart';

class CAppTheme {
  CAppTheme._();
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    textTheme: CTextTheme.customLightTextTheme,
    elevatedButtonTheme: CElevatedButtonTheme.lightElevatedButtonTheme,
    outlinedButtonTheme: COutlineButtonTheme.lightOutlineButtonTheme,
  );
  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    textTheme: CTextTheme.customDarkTextTheme,
    elevatedButtonTheme: CElevatedButtonTheme.darkElevatedButtonTheme,
    outlinedButtonTheme: COutlineButtonTheme.darkOutlineButtonTheme,
  );
}
