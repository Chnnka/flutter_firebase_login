import 'package:flutter/material.dart';
import 'package:flutter_firebase_login/src/constants/constants.dart';
import 'package:flutter_firebase_login/src/features/authentication/screens/screens.dart';
import 'package:get/get.dart';

class FormFooterWidget extends StatelessWidget {
  const FormFooterWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 5),
        const Align(alignment: Alignment.center, child: Text('or')),
        const SizedBox(height: 5),
        SizedBox(
          width: double.infinity,
          height: 50,
          child: OutlinedButton.icon(
            icon: const Image(
              image: AssetImage(cGoogleLogo),
              width: 20,
            ),
            onPressed: () {},
            label: const Text('Sign In with Google'),
          ),
        ),
        Align(
          alignment: Alignment.center,
          child: TextButton(
            onPressed: () => Get.to(() => const SignupScreen()),
            child: Text.rich(
              const TextSpan(
                  text: '$cDontHaveAnAccount ',
                  children: [TextSpan(text: cSignUpText)]),
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: Colors.blueAccent, fontWeight: FontWeight.w600),
            ),
          ),
        ),
      ],
    );
  }
}
