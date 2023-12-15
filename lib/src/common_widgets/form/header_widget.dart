import 'package:flutter/material.dart';

class FormHeaderWidget extends StatelessWidget {
  const FormHeaderWidget({
    super.key,
    required this.image,
    required this.title,
    required this.subTitle,
  });

  final String image, title, subTitle;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        //greetings section
        Image(
          image: AssetImage(image),
          height: size.height * 0.20,
        ),
        Text(title, style: Theme.of(context).textTheme.headlineLarge),
        Text(subTitle, style: Theme.of(context).textTheme.headlineSmall),
      ],
    );
  }
}
