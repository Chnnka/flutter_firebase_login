import 'package:flutter/material.dart';
import 'package:flutter_firebase_login/src/common_widgets/form/header_widget.dart';
import 'package:flutter_firebase_login/src/constants/constants.dart';

import 'widgets/signup_form_widget.dart';
import 'widgets/signup_footer_widget.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Padding(
        padding: EdgeInsets.all(cDefaultSize),
        child: SingleChildScrollView(
            child: Column(
          children: [
            SizedBox(height: 20),
            FormHeaderWidget(
              image: cOnBoardingImage2,
              title: cSignUpTitle,
              subTitle: cSignUpSubtitle,
            ),
            SignUpFormWidget(),
            SignupFooterWidget(),
          ],
        )),
      ),
    );
  }
}
