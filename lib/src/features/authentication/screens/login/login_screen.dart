import 'package:flutter/material.dart';
import 'package:flutter_firebase_login/src/common_widgets/form/footer_widget.dart';
import 'package:flutter_firebase_login/src/common_widgets/form/header_widget.dart';
import 'package:flutter_firebase_login/src/constants/constants.dart';

import 'login_form_widget.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(cDefaultSize),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FormHeaderWidget(
                  image: cOnBoardingImage3,
                  title: cLoginTitle,
                  subTitle: cLoginSubtitle,
                ),

                //form section
                LoginForm(),

                FormFooterWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
