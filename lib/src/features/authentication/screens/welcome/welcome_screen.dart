import 'package:flutter/material.dart';
import 'package:flutter_firebase_login/src/common_widgets/fade_in_animation/animation_design.dart';
import 'package:flutter_firebase_login/src/common_widgets/fade_in_animation/fade_in_animation_controller.dart';
import 'package:flutter_firebase_login/src/common_widgets/fade_in_animation/fade_in_animation_model.dart';
import 'package:flutter_firebase_login/src/constants/constants.dart';
import 'package:flutter_firebase_login/src/features/authentication/screens/screens.dart';

import 'package:get/get.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(FadeInAnimationController());
    controller.startAnimation();
    var mediaQuery = MediaQuery.of(context);
    var height = mediaQuery.size.height;

    return Scaffold(
      body: Stack(
        children: [
          CFadeInAnimation(
            durationInMs: 700,
            animate: CAnimatedPosition(
              bottomAfter: 0,
              bottomBefore: -100,
              topAfter: 0,
              topBefore: 0,
              rightAfter: 0,
              rightBefore: 0,
              leftAfter: 0,
              leftBefore: 0,
            ),
            child: Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: cDefaultPaddingValue),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  //welcome image
                  Image(
                    image: const AssetImage(cWelcomeScreenImage),
                    height: height * 0.6,
                  ),
                  //welcome title
                  Text(
                    cWelcomeTitle,
                    style: Theme.of(context).textTheme.headlineLarge,
                    textAlign: TextAlign.center,
                  ),
                  //welcome subtitle
                  Text(
                    cWelcomeSubtitle,
                    style: Theme.of(context).textTheme.headlineSmall,
                    textAlign: TextAlign.center,
                  ),
                  //login, sign up button
                  Row(
                    children: [
                      //login button
                      Expanded(
                        child: OutlinedButton(
                          onPressed: () => Get.to(() => const LoginScreen()),
                          child: const Text(cLoginText),
                        ),
                      ),
                      const SizedBox(width: 10),
                      //sign up button
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            Get.to(() => const SignupScreen());
                          },
                          child: const Text(cSignUpText),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
