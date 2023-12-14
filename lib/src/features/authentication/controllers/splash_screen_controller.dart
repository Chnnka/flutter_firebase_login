import 'package:flutter_firebase_login/src/features/authentication/screens/on_boarding_screen/on_boarding_screen.dart';
import 'package:get/get.dart';

class SplashScreenController extends GetxController {
  static SplashScreenController get find => Get.find();
  RxBool animate = false.obs;

  Future startAnimation() async {
    await Future.delayed(const Duration(milliseconds: 500));
    animate.value = true;
    await Future.delayed(const Duration(milliseconds: 4000));
    Get.to(OnBoardingScreen());
  }
}
