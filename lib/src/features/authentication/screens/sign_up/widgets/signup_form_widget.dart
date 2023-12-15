import 'package:flutter/material.dart';
import 'package:flutter_firebase_login/src/constants/constants.dart';

class SignUpFormWidget extends StatelessWidget {
  const SignUpFormWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 10),
          //full name
          TextFormField(
            decoration: const InputDecoration(
              label: Text(cFullName),
              prefixIcon: Icon(
                Icons.person_2_outlined,
              ),
            ),
          ),
          const SizedBox(height: 10),
          //user email
          TextFormField(
            decoration: const InputDecoration(
              label: Text(cEmail),
              prefixIcon: Icon(
                Icons.email_outlined,
              ),
            ),
          ),
          const SizedBox(height: 10),
          //user phone number
          TextFormField(
            decoration: const InputDecoration(
              label: Text('Phone Number'),
              prefixIcon: Icon(
                Icons.phone,
              ),
            ),
          ),
          const SizedBox(height: 10),
          //user password
          TextFormField(
            decoration: const InputDecoration(
              label: Text(cPassword),
              prefixIcon: Icon(
                Icons.fingerprint,
              ),
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: double.infinity,
            height: 50,
            child: ElevatedButton(
              onPressed: () {},
              child: Text(cSignUpText.toUpperCase()),
            ),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
