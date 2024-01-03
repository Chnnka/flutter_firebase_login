import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_firebase_login/src/repository/authentication_repository/authentication_repository.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  static LoginController get instance => Get.find();

  //textField controllers to get data from textfields
  final showPassword = false.obs;
  final email = TextEditingController();
  final password = TextEditingController();
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  //loader
  final isLoading = false.obs;
  final isGoogleLoading = false.obs;
  final isFacebookLoading = false.obs;

  Future<void> login() async {
    try {
      isLoading.value = true;
      if (!loginFormKey.currentState!.validate()) {
        isLoading.value = false;
        return;
      }
      final auth = AuthenticationRepository.instance;
      await auth.loginUserWithEmailAndPassword(
          email.text.trim(), password.text.trim());
      auth.setInitialScreen(auth.firebaseUser);
    } catch (e) {
      isLoading.value = false;
      Helper.errorSnackBar(time: 'Ohno', message: e.toString());
    }
  }

  // call this function from design
  Future<void> loginUser(String email, String password) async {
    String? error = await AuthenticationRepository.instance
        .loginUserWithEmailAndPassword(email, password);
    if (error != null) {
      Get.showSnackbar(GetSnackBar(message: error.toString()));
    }
  }
}
