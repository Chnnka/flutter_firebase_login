import 'package:flutter/material.dart';
import 'package:flutter_firebase_login/src/features/authentication/models/user_model.dart';
import 'package:flutter_firebase_login/src/features/authentication/screens/forgot_password/forgot_password_otp/otp_screen.dart';
import 'package:flutter_firebase_login/src/repository/authentication_repository/authentication_repository.dart';
import 'package:flutter_firebase_login/src/repository/user_repository/user_repository.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  static SignUpController get instance => Get.find();

  //TEXT FIELD Controllers
  final email = TextEditingController();
  final password = TextEditingController();
  final fullName = TextEditingController();
  final phoneNo = TextEditingController();

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
  Future<void> createUser(UserModel user) async {
    await userRepo.createUser(user);
    phoneAuthentication(user.phoneNo);
    Get.to(() => const OTPScreen());
  }

  void phoneAuthentication(String phoneNo) {
    AuthenticationRepository.instance.phoneAuthentication(phoneNo);
  }
}
