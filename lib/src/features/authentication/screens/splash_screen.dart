import 'package:flutter/material.dart';

import 'package:flutter_firebase_login/src/constants/images.dart';
import 'package:flutter_firebase_login/src/features/authentication/controllers/splash_screen_controller.dart';
import 'package:get/get.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({super.key});

  final splashScreenController = Get.put(SplashScreenController());

  @override
  Widget build(BuildContext context) {
    splashScreenController.startAnimation();
    return Scaffold(
      body: Stack(
        children: [
          Obx(
            () => AnimatedPositioned(
              duration: const Duration(milliseconds: 3000),
              top: splashScreenController.animate.value ? 0 : -30,
              left: splashScreenController.animate.value ? 0 : -30,
              child: const Image(
                height: 130,
                image: AssetImage(cSplashLogo),
              ),
            ),
          ),
          Obx(
            () => AnimatedPositioned(
              duration: const Duration(milliseconds: 3000),
              top: 80,
              left: splashScreenController.animate.value ? 189 : -80,
              child: AnimatedOpacity(
                opacity: splashScreenController.animate.value ? 1 : 0,
                duration: const Duration(milliseconds: 300),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text('appName',
                        style: Theme.of(context).textTheme.headlineLarge),
                    Text('tagline',
                        style: Theme.of(context).textTheme.headlineSmall),
                  ],
                ),
              ),
            ),
          ),
          Obx(
            () => AnimatedPositioned(
              duration: const Duration(milliseconds: 3000),
              bottom: splashScreenController.animate.value ? 250 : 0,
              child: const Image(
                height: 330,
                image: AssetImage(cSplashImage),
              ),
            ),
          ),
          Obx(
            () => AnimatedPositioned(
              duration: const Duration(milliseconds: 3000),
              bottom: splashScreenController.animate.value ? 30 : 0,
              right: splashScreenController.animate.value ? 30 : 0,
              child: Container(
                height: 50,
                width: 50,
                color: Colors.yellowAccent,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
