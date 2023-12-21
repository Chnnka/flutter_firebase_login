import 'package:flutter/material.dart';
import 'package:flutter_firebase_login/src/constants/constants.dart';
import 'package:flutter_firebase_login/src/features/authentication/controllers/otp_controller.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';

class OTPScreen extends StatelessWidget {
  const OTPScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var otpController = Get.put(OTPController());
    var otp;
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              cOTPsubtitle,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const Text(
              '$cOTPmessage\nchannaka.sajith@gmail.com',
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: cDefaultPaddingValue),
            OtpTextField(
              autoFocus: true,
              numberOfFields: 6,
              filled: true,
              fillColor: Colors.black.withOpacity(0.2),
              keyboardType: TextInputType.number,
              onSubmit: (code) {
                otp = code;
                OTPController.instance.verifyOTP(otp);
              },
            ),
            const SizedBox(height: cDefaultPaddingValue),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  OTPController.instance.verifyOTP(otp);
                },
                child: const Text('Next'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
