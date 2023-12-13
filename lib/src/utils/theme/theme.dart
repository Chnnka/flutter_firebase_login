import 'package:flutter/material.dart';
import 'package:flutter_firebase_login/src/utils/theme/widget_theme/button_theme.dart';
import 'package:flutter_firebase_login/src/utils/theme/widget_theme/text_theme.dart';

class CAppTheme {
  CAppTheme._();
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    textTheme: CTextTheme.customLightTextTheme,
    elevatedButtonTheme: CButtonTheme.customElevatedButton,
    outlinedButtonTheme: CButtonTheme.customOutlinedButton,
  );
  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    textTheme: CTextTheme.customDarkTextTheme,
  );
}
