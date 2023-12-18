import 'package:flutter/material.dart';
import 'package:flutter_firebase_login/src/common_widgets/form/footer_widget.dart';
import 'package:flutter_firebase_login/src/common_widgets/form/header_widget.dart';
import 'package:flutter_firebase_login/src/constants/constants.dart';

import 'widgets/login_form_widget.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: const Padding(
            padding: EdgeInsets.all(cDefaultSize),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //header
                FormHeaderWidget(
                  image: cOnBoardingImage3,
                  title: cLoginTitle,
                  subTitle: cLoginSubtitle,
                ),
                SizedBox(height: 16),
                //form section
                LoginForm(),
                //footer
                FormFooterWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
