import 'package:flutter/material.dart';
import 'package:flutter_firebase_login/src/constants/constants.dart';
import 'package:flutter_firebase_login/src/repository/authentication_repository/authentication_repository.dart';
import 'package:get/get.dart';
import 'package:modern_form_line_awesome_icons/modern_form_line_awesome_icons.dart';

class MailVerification extends StatelessWidget {
  const MailVerification({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(MailVerificationController());
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: cDefaultPaddingValue),
          child: Column(
            children: [
              const Icon(
                LineAwesomeIcons.envelope_o,
                size: 100,
              ),
              const SizedBox(height: cDefaultSize * 2),
              Text('Email Verification',
                  style: Theme.of(context).textTheme.headlineMedium),
              const SizedBox(height: cDefaultSize),
              const Text(
                'Email verification subtitle',
                textAlign: TextAlign.center,
              ),
              SizedBox(
                width: 200,
                child: OutlinedButton(
                    onPressed: () =>
                        controller.manuallyCheckEmailVerificationStatus(),
                    child: const Text('Continue')),
              ),
              const SizedBox(height: cDefaultPaddingValue),
              TextButton(
                  onPressed: () => controller.sendVerificationEmail(),
                  child: const Text('Resend email link')),
              TextButton(
                onPressed: () => AuthenticationRepository.instance.logout(),
                child: const Row(
                  children: [
                    Icon(LineAwesomeIcons.arrow_left),
                    SizedBox(width: 5),
                    Text('Back To Login'),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
