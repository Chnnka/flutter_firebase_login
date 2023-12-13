import 'package:flutter/material.dart';

class CButtonTheme {
  static ElevatedButtonThemeData customElevatedButton = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      textStyle: const TextStyle(
        fontSize: 20,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25),
      ),
      elevation: 3,
      minimumSize: const Size(double.infinity, 45),
    ),
  );
  static OutlinedButtonThemeData customOutlinedButton = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      textStyle: const TextStyle(
        fontSize: 20,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25),
      ),
      minimumSize: const Size(double.infinity, 45),
    ),
  );
}
