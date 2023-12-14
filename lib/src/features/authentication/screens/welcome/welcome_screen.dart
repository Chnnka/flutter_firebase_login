import 'package:flutter/material.dart';
import 'package:flutter_firebase_login/src/constants/colors.dart';
import 'package:flutter_firebase_login/src/constants/default_values.dart';
import 'package:flutter_firebase_login/src/constants/images.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    var height = mediaQuery.size.height;

    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: cDefaultPaddingValue),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image(
              image: const AssetImage(cWelcomeScreenImage),
              height: height * 0.6,
            ),
            Text(
              cWelcomeTitle,
              style: Theme.of(context).textTheme.headlineLarge,
              textAlign: TextAlign.center,
            ),
            Text(
              cWelcomeSubtitle,
              style: Theme.of(context).textTheme.headlineSmall,
              textAlign: TextAlign.center,
            ),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {},
                    child: const Text(cLoginText),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    child: const Text(cSignUpText),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
