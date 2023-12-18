import 'package:flutter/material.dart';
import 'package:flutter_firebase_login/src/constants/constants.dart';
import 'package:flutter_firebase_login/src/features/authentication/screens/forgot_password/forgot_password_mail/forgot_password_mail.dart';
import 'package:get/get.dart';

import 'forgot_password_options.dart';

class ForgotPasswordScreen {
  static Future<dynamic> buildShowModelBottomSheet(BuildContext context) {
    return showModalBottomSheet(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
          bottomLeft: Radius.circular(0),
          bottomRight: Radius.circular(0),
        ),
      ),
      context: context,
      builder: (context) => Container(
        padding: const EdgeInsets.all(cDefaultSize),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(cForgotPasswordBtmsheetTitle,
                style: Theme.of(context).textTheme.headlineMedium),
            Text(cForgotPasswordBtmsheetSubtitle,
                style: Theme.of(context).textTheme.bodySmall),
            const SizedBox(height: 30),
            ResetPasswordOptionWidget(
              btnIcon: Icons.mail_outline_outlined,
              title: cEmail,
              subtitle: cResetViaEmail,
              onTap: () {
                Navigator.pop(context);
                Get.to(() => const ForgotPasswordMailScreen());
              },
            ),
            const SizedBox(height: 16),
            ResetPasswordOptionWidget(
              btnIcon: Icons.phone_android_outlined,
              title: cPhone,
              subtitle: cResetViaPhone,
              onTap: () {},
            )
          ],
        ),
      ),
    );
  }
}
