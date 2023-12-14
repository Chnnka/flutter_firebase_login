import 'package:flutter/material.dart';
import 'package:flutter_firebase_login/src/constants/colors.dart';

class CElevatedButtonTheme {
  CElevatedButtonTheme._();
  //light theme
  static final lightElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      padding: const EdgeInsets.symmetric(vertical: 10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      foregroundColor: cSecondaryColor,
      backgroundColor: cPrimaryColor,
      elevation: 0,
      textStyle: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w600,
      ),
    ),
  );
  //dark theme
  static final darkElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      padding: const EdgeInsets.symmetric(vertical: 10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      foregroundColor: cSecondaryColor,
      backgroundColor: cPrimaryColor,
      elevation: 0,
      textStyle: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w600,
      ),
    ),
  );
}
