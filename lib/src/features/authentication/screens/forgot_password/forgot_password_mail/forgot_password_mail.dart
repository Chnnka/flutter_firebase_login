import 'package:flutter/material.dart';
import 'package:flutter_firebase_login/src/common_widgets/form/header_widget.dart';
import 'package:flutter_firebase_login/src/constants/constants.dart';
import 'package:flutter_firebase_login/src/features/authentication/screens/forgot_password/forgot_password_otp/otp_screen.dart';
import 'package:get/get.dart';

class ForgotPasswordMailScreen extends StatelessWidget {
  const ForgotPasswordMailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(cDefaultSize),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: cDefaultSize * 4,
              ),
              const FormHeaderWidget(
                image: cForgotPasswordImg,
                title: cForgotPassword,
                subTitle: cForgotEmailSubtitle,
                crossAxisAlignment: CrossAxisAlignment.center,
                textAlign: TextAlign.center,
                heightBetween: 30,
              ),
              const SizedBox(height: 20),
              Form(
                child: Column(
                  children: [
                    TextFormField(
                      decoration: const InputDecoration(
                          label: Text(cEmail),
                          hintText: cEmailPlaceholder,
                          prefixIcon: Icon(Icons.mail_outline_outlined)),
                    ),
                    const SizedBox(height: cDefaultPaddingValue),
                    SizedBox(
                      height: 50,
                      width: double.infinity,
                      child: ElevatedButton(
                          onPressed: () {
                            Get.to(() => const OTPScreen());
                          },
                          child: const Text('Send Verification Code')),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
