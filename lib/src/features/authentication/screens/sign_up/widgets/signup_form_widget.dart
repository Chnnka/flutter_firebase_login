import 'package:flutter/material.dart';
import 'package:flutter_firebase_login/src/constants/constants.dart';
import 'package:flutter_firebase_login/src/features/authentication/controllers/signup_controller.dart';
// import 'package:flutter_firebase_login/src/features/authentication/controllers/login_controller.dart';
import 'package:get/get.dart';

class SignUpFormWidget extends StatelessWidget {
  const SignUpFormWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignUpController());
    final _formKey = GlobalKey<FormState>();
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 10),
          //full name
          TextFormField(
            controller: controller.fullName,
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
            controller: controller.email,
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
            controller: controller.phoneNo,
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
            controller: controller.password,
            decoration: const InputDecoration(
              label: Text(cPassword),
              prefixIcon: Icon(
                Icons.fingerprint,
              ),
            ),
          ),
          const SizedBox(height: 20),
          //SIGN UP BUTTON
          Obx(
            () => SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                isLoading: controller.isLoading.value ? true : false,
                onPressed: controller.isFacebookLoading.value ||
                        controller.isGoogleLoading.value
                    ? () {}
                    : controller.isLoading.value
                        ? () {}
                        : () => controller.createUser(),
                child: Text(cSignUpText.toUpperCase()),
              ),
            ),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
