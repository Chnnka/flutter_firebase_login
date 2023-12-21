import 'package:flutter/material.dart';
import 'package:flutter_firebase_login/src/repository/authentication_repository/authentication_repository.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  static LoginController get instance => Get.find();

  //textField controllers to get data from textfields
  final email = TextEditingController();
  final password = TextEditingController();

  // call this function from design
  Future<void> loginUser(String email, String password) async {
    String? error = await AuthenticationRepository.instance
        .loginUserWithEmailAndPassword(email, password);
    if (error != null) {
      Get.showSnackbar(GetSnackBar(message: error.toString()));
    }
  }
}
