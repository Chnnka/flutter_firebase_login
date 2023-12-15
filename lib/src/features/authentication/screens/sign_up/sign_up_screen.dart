import 'package:flutter/material.dart';
import 'package:flutter_firebase_login/src/common_widgets/form/header_widget.dart';
import 'package:flutter_firebase_login/src/constants/constants.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Container(
        padding: const EdgeInsets.all(cDefaultSize),
        child: const Column(
          children: [
            FormHeaderWidget(image: cOnBoardingImage2,title: cSignUpTitle,subTitle: cSignUpSubtitle,),
          ],
        ),
      )),
    );
  }
}
