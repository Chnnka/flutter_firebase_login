import 'package:flutter/material.dart';
import 'package:flutter_firebase_login/src/features/authentication/models/user_model.dart';
import 'package:flutter_firebase_login/src/repository/authentication_repository/authentication_repository.dart';
import 'package:flutter_firebase_login/src/repository/user_repository/user_repository.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  static ProfileController get instance => Get.find();



  // --- Repository --- //
  final _authRepo = Get.put(AuthenticationRepository());
  final _userRepo = Get.put(UserRepository());

  //get user email and password to userRepo to fetch user record
  getUserData() {
    final email = _authRepo.firebaseUser.value?.email;
    if (email != null) {
      return _userRepo.getUserDetails(email);
    } else {
      Get.snackbar('Error', 'Login to continue');
    }
  }

  //fetch list of user records
  Future<List<UserModel>> getAllUser() async => await _userRepo.allUser();

  updateRecord(UserModel user) async {
    await _userRepo.updateUserRecord(user);
  }
}
