import 'package:flutter/material.dart';
import 'package:flutter_firebase_login/src/constants/constants.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //email textfield
        TextFormField(
          decoration: const InputDecoration(
              prefixIcon: Icon(Icons.person_2),
              labelText: cEmail,
              hintText: cEmailPlaceholder,
              border: OutlineInputBorder()),
        ),
        const SizedBox(height: 10),
        //password textfield
        TextFormField(
          decoration: const InputDecoration(
              suffixIcon: Icon(Icons.remove_red_eye),
              prefixIcon: Icon(Icons.fingerprint),
              labelText: cPassword,
              hintText: cPasswordPlaceholder,
              border: OutlineInputBorder()),
        ),
        //forgot password button
        Align(
          alignment: Alignment.centerRight,
          child: TextButton(
            onPressed: () {},
            child: const Text(cForgotPassword),
          ),
        ),
        SizedBox(
          width: double.infinity,
          height: 50,
          child: ElevatedButton(
            onPressed: () {},
            child: Text(cLoginText.toUpperCase()),
          ),
        ),
      ],
    ));
  }
}
