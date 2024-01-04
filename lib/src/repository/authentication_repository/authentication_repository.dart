import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter_firebase_login/src/exceptions/c_exceptions.dart';
import 'package:flutter_firebase_login/src/features/authentication/screens/mail_verification/mail_verification.dart';
import 'package:flutter_firebase_login/src/features/authentication/screens/screens.dart';
import 'package:flutter_firebase_login/src/features/core/screens/dashboard/dashboard.dart';
import 'package:flutter_firebase_login/src/repository/authentication_repository/exceptions/signup_email_password_failure.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
// import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  //Variables
  late final Rx<User?> _firebaseUser;
  final _auth = FirebaseAuth.instance;
  // final _phoneVerificationId = ''.obs;
  late final GoogleSignInAccount _googleUser;
  var verificationId = ''.obs;

  //Getters
  User? get firebaseUser => _firebaseUser.value;
  String get getUserId => firebaseUser?.uid ?? "";
  String get getUserEmail => firebaseUser?.email ?? "";

  ///loads when app  launch from main.dart
  @override
  void onReady() {
    _firebaseUser = Rx<User?>(_auth.currentUser);
    _firebaseUser.bindStream(_auth.userChanges());
    FlutterNativeSplash.remove();
    setInitialScreen(_firebaseUser.value);
    // ever(_firebaseUser, _setInitialScreen);
  }

  //setting initial screen on load
  setInitialScreen(User? user) {
    user == null
        ? Get.offAll(() => const WelcomeScreen())
        : user.emailVerified
            ? Get.offAll(() => const Dashboard())
            : Get.offAll(() => const MailVerificationScreen());
  }

  //FUNCTIONS
  // ------------------- LOGIN ------------------//
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

  // -------------- REGISTER -------------------------//
  Future<String?> createUserWithEmailAndPassword(
      String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);

      _firebaseUser.value != null
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

  // -------------- VERIFICATION -------------------------//
  Future<void> sendEmailVerification() async {
    try {
      await _auth.currentUser?.sendEmailVerification();
    } on FirebaseAuthException catch (e) {
      final ex = CExceptions.fromCode(e.code);
      throw ex.message;
    } catch (_) {
      const ex = CExceptions();
      throw ex.message;
    }
  }

  // ------- GOOGLE SIGN IN --------------------//
  Future<UserCredential> signInWithGoogle() async {
    try {
      // Trigger the authentication flow
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      // Obtain the auth details from the request
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      // Once signed in, return the UserCredential
      return await FirebaseAuth.instance.signInWithCredential(credential);
    } on FirebaseAuthException catch (e) {
      final ex = CExceptions.fromCode(e.code);
      throw ex.message;
    } catch (_) {
      const ex = CExceptions();
      throw ex.message;
    }
    
  }

  // ------- Facebook SIGN IN --------------------//
  // Future<UserCredential> signInWithFacebook() async {
  //   // Trigger the sign-in flow
  //   final LoginResult loginResult = await FacebookAuth.instance.login();

  //   // Create a credential from the access token
  //   final OAuthCredential facebookAuthCredential = FacebookAuthProvider.credential(loginResult.accessToken.token);

  //   // Once signed in, return the UserCredential
  //   return FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
  // }

  // -------------------- phone authentication --------------//
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

  // phone authentication Verification (register)
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

  Future<void> logout() async {
    try {
      await GoogleSignIn().signOut();
      // await FacebookAuth.instance.logOut();
      await FirebaseAuth.instance.signOut();
      Get.offAll(() => const LoginScreen());
    } on FirebaseAuthException catch (e) {
      throw e.message!;
    } on FormatException catch (e) {
      throw e.message;
    } catch (e) {
      throw 'Unable to logout, try again';
    }
  }
}
