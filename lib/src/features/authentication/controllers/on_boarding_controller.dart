import 'package:flutter_firebase_login/src/constants/colors.dart';
import 'package:flutter_firebase_login/src/constants/default_values.dart';
import 'package:flutter_firebase_login/src/constants/images.dart';
import 'package:flutter_firebase_login/src/features/authentication/models/model_on_boarding.dart';
import 'package:flutter_firebase_login/src/features/authentication/screens/on_boarding_screen/on_boarding_screen_widget.dart';
import 'package:get/get.dart';
import 'package:liquid_swipe/PageHelpers/LiquidController.dart';

class OnBoardingController extends GetxController {
  final controller = LiquidController();
  RxInt currentPage = 0.obs;
  final pages = [
    OnBoardingPageWidget(
      model: OnBoardingModel(
        bgColor: cOnBoardingPage1Color,
        counterText: cOnBoardingCounterText1,
        height: 20,
        image: cOnBoardingImage1,
        subTitle: cOnBoardingSubtext1,
        title: cOnBoardingMaintext1,
      ),
    ),
    OnBoardingPageWidget(
      model: OnBoardingModel(
        bgColor: cOnBoardingPage2Color,
        counterText: cOnBoardingCounterText2,
        height: 20,
        image: cOnBoardingImage2,
        subTitle: cOnBoardingSubtext2,
        title: cOnBoardingMaintext2,
      ),
    ),
    OnBoardingPageWidget(
      model: OnBoardingModel(
        counterText: cOnBoardingCounterText3,
        height: 20,
        image: cOnBoardingImage3,
        title: cOnBoardingMaintext3,
        subTitle: cOnBoardingSubtext3,
        bgColor: cOnBoardingPage3Color,
      ),
    ),
  ];
  onPageChangeCallback(int activePageIndex) =>
      currentPage.value = activePageIndex;
  skip() => controller.jumpToPage(page: 2);
  animateToNextSlide() {
    int nextPage = controller.currentPage + 1;
    controller.animateToPage(page: nextPage);
  }
}
