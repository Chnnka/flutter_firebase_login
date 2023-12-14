import 'package:flutter/material.dart';

import 'package:flutter_firebase_login/src/utils/theme/widget_theme/elevatedbutton_theme.dart';
import 'package:flutter_firebase_login/src/utils/theme/widget_theme/outlinebutton_theme.dart';
import 'package:flutter_firebase_login/src/utils/theme/widget_theme/text_theme.dart';

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
