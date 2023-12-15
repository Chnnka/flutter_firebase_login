import 'package:flutter/material.dart';
import 'package:flutter_firebase_login/src/constants/constants.dart';
import 'package:flutter_firebase_login/src/features/authentication/screens/screens.dart';
import 'package:get/get.dart';

class SignupFooterWidget extends StatelessWidget {
  const SignupFooterWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text('or'),
        const SizedBox(height: 10),
        SizedBox(
          width: double.infinity,
          height: 50,
          child: OutlinedButton(
            onPressed: () {},
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image(
                  image: AssetImage(cGoogleLogo),
                  height: 20,
                ),
                Text('Sign Up with Google')
              ],
            ),
          ),
        ),
        Align(
          alignment: Alignment.center,
          child: TextButton(
            onPressed: () => Get.to(() => const LoginScreen()),
            child: Text.rich(
              const TextSpan(
                  text: '$cAlreadyHaveAnAccount ',
                  children: [TextSpan(text: cLoginText)]),
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: Colors.blueAccent, fontWeight: FontWeight.w600),
            ),
          ),
        ),
      ],
    );
  }
}
