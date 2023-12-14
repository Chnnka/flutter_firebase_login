import 'package:flutter/material.dart';
import 'package:flutter_firebase_login/src/constants/colors.dart';

class COutlineButtonTheme {
  COutlineButtonTheme._();
  //light theme
  static final lightOutlineButtonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      padding: const EdgeInsets.symmetric(vertical: 10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      foregroundColor: cSecondaryColor,
      backgroundColor: cWhiteColor,
      side: const BorderSide(color: cSecondaryColor),
      textStyle: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w600,
      ),
    ),
  );
  //dark theme
  static final darkOutlineButtonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      padding: const EdgeInsets.symmetric(vertical: 10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      foregroundColor: cWhiteColor,
      side: const BorderSide(color: cWhiteColor),
      textStyle: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w600,
      ),
    ),
  );
}
