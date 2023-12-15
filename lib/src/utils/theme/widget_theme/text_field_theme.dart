import 'package:flutter/material.dart';
import 'package:flutter_firebase_login/src/constants/constants.dart';

class CTextFormFieldTheme {
  CTextFormFieldTheme._();
  //light theme
  static InputDecorationTheme lightInputDecorationTheme =
      const InputDecorationTheme(
    border: OutlineInputBorder(),
    prefixIconColor: cSecondaryColor,
    floatingLabelStyle: TextStyle(color: cSecondaryColor),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(
        width: 2.0,
        color: cSecondaryColor,
      ),
    ),
  );
  //dark theme
  static InputDecorationTheme darkInputDecorationTheme =
      const InputDecorationTheme(
    border: OutlineInputBorder(),
    prefixIconColor: cPrimaryColor,
    floatingLabelStyle: TextStyle(color: cPrimaryColor),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(
        width: 2.0,
        color: cPrimaryColor,
      ),
    ),
  );
}
