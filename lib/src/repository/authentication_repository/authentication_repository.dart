import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_firebase_login/src/features/authentication/screens/screens.dart';
import 'package:flutter_firebase_login/src/features/core/screens/dashboard/dashboard.dart';
import 'package:flutter_firebase_login/src/repository/authentication_repository/exceptions/signup_email_password_failure.dart';
import 'package:get/get.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  //Variables
  final _auth = FirebaseAuth.instance;
  late final Rx<User?> firebaseUser;
  var verificationId = ''.obs;

  @override
  void onReady() {
    firebaseUser = Rx<User?>(_auth.currentUser);
    firebaseUser.bindStream(_auth.userChanges());
    ever(firebaseUser, _setInitialScreen);
  }

  //setting initial screen on load
  _setInitialScreen(User? user) {
    user == null
        ? Get.offAll(() => const WelcomeScreen())
        : Get.offAll(() => const Dashboard());
  }

  //FUNCTIONS

  //phone authentication
  loginWithPhoneNo(String phoneNumber) async {
    try {
      await _auth.signInWithPhoneNumber(phoneNumber);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'invalid-phone-number') {
        Get.snackbar('Error', 'Invalid Phone Number');
      }
    } catch (_) {
      Get.snackbar('Error', 'Something went wrong.');
    }
  }

  Future<void> phoneAuthentication(String phoneNo) async {
    await _auth.verifyPhoneNumber(
      phoneNumber: phoneNo,
      verificationCompleted: (credential) async {
        await _auth.signInWithCredential(credential);
      },
      codeSent: (verificationId, forceResendingToken) {
        this.verificationId.value = verificationId;
      },
      codeAutoRetrievalTimeout: (verificationId) {
        this.verificationId.value = verificationId;
      },
      verificationFailed: (e) {
        if (e.code == 'invalid-phone-number') {
          Get.snackbar('Error', 'Provided Phone Number is not valid');
        } else {
          Get.snackbar('Error', 'Something went wrong');
        }
      },
    );
  }

  Future<bool> verifyOTP(String otp) async {
    var credentials = await _auth.signInWithCredential(
        PhoneAuthProvider.credential(
            verificationId: verificationId.value, smsCode: otp));
    return credentials.user != null ? true : false;
  }

  Future<String?> createUserWithEmailAndPassword(
      String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);

      firebaseUser.value != null
          ? Get.offAll(() => const Dashboard())
          : Get.to(() => const WelcomeScreen());
    } on FirebaseAuthException catch (e) {
      final ex = SignUpWithEmailAndPasswordFailure.code(e.code);
      // ignore: avoid_print
      print('Firebase auth exceptipn - ${ex.message}');
      throw ex;
    } catch (_) {
      const ex = SignUpWithEmailAndPasswordFailure();
      // ignore: avoid_print
      print('exceptipn - ${ex.message}');
      throw ex;
    }
    return null;
  }

  Future<String?> loginUserWithEmailAndPassword(
      String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      final ex = SignUpWithEmailAndPasswordFailure.code(e.code);
      // ignore: avoid_print
      print('Firebase auth exceptipn - ${ex.message}');
    } catch (_) {
      const ex = SignUpWithEmailAndPasswordFailure();
      // ignore: avoid_print
      print('exceptipn - ${ex.message}');
    }
    return null;
  }

  Future<void> logout() async => await _auth.signOut();
}
