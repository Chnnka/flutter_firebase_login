import 'package:flutter/material.dart';
import 'package:flutter_firebase_login/src/common_widgets/fade_in_animation/animation_design.dart';
import 'package:flutter_firebase_login/src/common_widgets/fade_in_animation/fade_in_animation_model.dart';
import 'package:flutter_firebase_login/src/constants/constants.dart';
import 'package:flutter_firebase_login/src/common_widgets/fade_in_animation/fade_in_animation_controller.dart';
import 'package:get/get.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(FadeInAnimationController());
    controller.startSplashAnimation();
    return Scaffold(
      body: Stack(
        children: [
          CFadeInAnimation(
            durationInMs: 1500,
            animate: CAnimatedPosition(
                topAfter: 0, topBefore: -30, leftBefore: -30, leftAfter: 0),
            child: const Image(image: AssetImage(cSplashLogo)),
          ),
          CFadeInAnimation(
            durationInMs: 2000,
            animate: CAnimatedPosition(
                topAfter: 80, topBefore: 80, leftAfter: 189, leftBefore: -80),
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
          CFadeInAnimation(
            durationInMs: 2400,
            animate: CAnimatedPosition(bottomBefore: 0, bottomAfter: 100),
            child: const Image(
              height: 330,
              image: AssetImage(cSplashImage),
            ),
          ),
          CFadeInAnimation(
            durationInMs: 2400,
            animate: CAnimatedPosition(
              bottomBefore: 0,
              bottomAfter: 60,
              rightBefore: cDefaultSize,
              rightAfter: cDefaultSize,
            ),
            child: Container(
              height: 50,
              width: 50,
              color: Colors.yellowAccent,
            ),
          ),
        ],
      ),
    );
  }
}
