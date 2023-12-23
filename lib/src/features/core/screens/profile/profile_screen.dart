import 'package:flutter/material.dart';
import 'package:flutter_firebase_login/src/constants/constants.dart';
import 'package:modern_form_line_awesome_icons/modern_form_line_awesome_icons.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {}, icon: const Icon(LineAwesomeIcons.angle_left)),
        title: const Text('Profile'),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                  isDark ? LineAwesomeIcons.sun_o : LineAwesomeIcons.moon_o))
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(cDefaultPaddingValue),
          child: Column(
            children: [
              SizedBox(
                width: 120,
                height: 120,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: const Image(
                    image: AssetImage(
                      cOnBoardingImage3,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Text('Profile Heading',
                  style: Theme.of(context).textTheme.bodyMedium),
              Text('Profile Sub heading',
                  style: Theme.of(context).textTheme.bodySmall),
            ],
          ),
        ),
      ),
    );
  }
}
