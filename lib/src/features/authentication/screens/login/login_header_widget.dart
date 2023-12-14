import 'package:flutter/material.dart';
import 'package:flutter_firebase_login/src/constants/constants.dart';

class LoginHeaderWidget extends StatelessWidget {
  const LoginHeaderWidget({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        //greetings section
        Image(
          image: const AssetImage(cOnBoardingImage1),
          height: size.height * 0.40,
        ),
        Text(cLoginTitle, style: Theme.of(context).textTheme.headlineLarge),
        Text(
          cLoginSubtitle,
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
