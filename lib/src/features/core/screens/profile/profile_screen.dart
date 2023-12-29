// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:modern_form_line_awesome_icons/modern_form_line_awesome_icons.dart';

import 'package:flutter_firebase_login/src/constants/constants.dart';

import 'widgets/profile_menu_widget.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
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
              const SizedBox(height: 20),
              SizedBox(
                width: 200,
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Text('Edit Profile'),
                ),
              ),
              const SizedBox(height: 10),
              const Divider(),
              const SizedBox(height: 10),

              ///MENU
              ProfileMenuWidget(
                title: 'Settings',
                onPress: () {},
                icon: LineAwesomeIcons.cog,
              ),
              ProfileMenuWidget(
                title: 'Billing Details',
                onPress: () {},
                icon: LineAwesomeIcons.money,
              ),
              const Divider(),
              ProfileMenuWidget(
                title: 'Privacy Policy',
                onPress: () {},
                icon: LineAwesomeIcons.info,
              ),
              ProfileMenuWidget(
                title: 'User Management',
                onPress: () {},
                icon: LineAwesomeIcons.user,
              ),
              const Divider(),
              ProfileMenuWidget(
                title: 'Sign Out',
                textColor: Colors.red[900],
                onPress: () {},
                endIcon: false,
                icon: LineAwesomeIcons.sign_out,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
