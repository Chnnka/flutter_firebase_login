import 'package:flutter/material.dart';
import 'package:flutter_firebase_login/src/features/authentication/screens/screens.dart';
import 'package:flutter_firebase_login/src/utils/theme/theme.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: CAppTheme.lightTheme,
      darkTheme: CAppTheme.darkTheme,
      themeMode: ThemeMode.system,
      home: const SplashScreen(),
    );
  }
}
