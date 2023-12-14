import 'package:flutter/material.dart';
import 'package:flutter_firebase_login/src/constants/constants.dart';
import 'package:flutter_firebase_login/src/features/authentication/controllers/on_boarding_controller.dart';


import 'package:get/get.dart';

import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final obController = OnBoardingController();

    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          //swipe
          LiquidSwipe(
            liquidController: obController.controller,
            onPageChangeCallback: obController.onPageChangeCallback,
            pages: obController.pages,
            slideIconWidget: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black45,
            ),
            enableSideReveal: true,
          ),
          //next button
          Positioned(
            bottom: 60.0,
            child: OutlinedButton(
              style: OutlinedButton.styleFrom(
                side: const BorderSide(
                  color: Colors.black26,
                ),
                shape: const CircleBorder(),
                padding: const EdgeInsets.all(20),
              ),
              onPressed: () => obController.animateToNextSlide(),
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: const BoxDecoration(
                  color: cDarkColor,
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.arrow_forward_ios),
              ),
            ),
          ),
          //skip button
          Positioned(
            top: 50,
            right: 20,
            child: TextButton(
              onPressed: () => obController.skip(),
              child: Text(
                'Skip',
                style: TextStyle(color: Colors.grey[700]),
              ),
            ),
          ),
          //bottom page indication
          Obx(
            () => Positioned(
              bottom: 10,
              child: AnimatedSmoothIndicator(
                effect: const WormEffect(
                    dotHeight: 5.0,
                    activeDotColor: Color.fromARGB(115, 4, 45, 105)),
                activeIndex: obController.currentPage.value,
                count: 3,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
