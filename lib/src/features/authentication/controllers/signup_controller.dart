import 'package:flutter/material.dart';
import 'package:flutter_firebase_login/src/features/authentication/models/user_model.dart';

import 'package:flutter_firebase_login/src/repository/authentication_repository/authentication_repository.dart';
import 'package:flutter_firebase_login/src/repository/user_repository/user_repository.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  static SignUpController get instance => Get.find();

  //loader
  final isLoading = false.obs;

  //TEXT FIELD Controllers
  final email = TextEditingController();
  final password = TextEditingController();
  final fullName = TextEditingController();
  final phoneNo = TextEditingController();
  GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();

  final userRepo = Get.put(UserRepository());

  //CALL this function from design & it will do the next steps
  void registerUser(String email, String password) {
    String? error = AuthenticationRepository.instance
        .createUserWithEmailAndPassword(email, password) as String?;
    if (error != null) {
      Get.showSnackbar(GetSnackBar(message: error.toString()));
    }
  }

  //get phoneNo from user and pass it to Auth Repo for firebase authentication
  Future<void> createUser() async {
    try {
      isLoading.value = true;
      if (!signupFormKey.currentState!.validate()) {
        isLoading.value = false;
        return;
      }

      final user = UserModel(
        fullName: fullName.text.trim(),
        email: email.text.trim(),
        phoneNo: phoneNo.text.trim(),
        password: password.text.trim(),
      );

      //Authenticate user first
      final auth = AuthenticationRepository.instance;
      await AuthenticationRepository.instance
          .createUserWithEmailAndPassword(user.email, user.password);
      await UserRepository.instance.createUser(user);
      auth.setInitialScreen(auth.firebaseUser);
    } catch (e) {
      isLoading.value = false;
      Get.snackbar('Error', e.toString(),
          snackPosition: SnackPosition.BOTTOM,
          duration: const Duration(seconds: 5));
    }
    // await userRepo.createUser(user);
    // phoneAuthentication(user.phoneNo);
    // Get.to(() => const OTPScreen());
  }

  void phoneAuthentication(String phoneNo) {
    AuthenticationRepository.instance.phoneAuthentication(phoneNo);
  }
}
