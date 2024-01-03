import 'package:flutter/material.dart';
import 'package:flutter_firebase_login/src/constants/constants.dart';
import 'package:flutter_firebase_login/src/features/authentication/models/user_model.dart';
import 'package:flutter_firebase_login/src/features/core/controllers/profile_controller.dart';
import 'package:get/get.dart';
import 'package:modern_form_line_awesome_icons/modern_form_line_awesome_icons.dart';

class UpdateProfileScreen extends StatelessWidget {
  const UpdateProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProfileController());
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(LineAwesomeIcons.angle_left),
          onPressed: () => Get.back(),
        ),
        title: const Text(cUpdateProfile),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(cDefaultSize),
          //using future builder to load cloud data
          child: FutureBuilder(
            future: controller.getUserData(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasData) {
                  UserModel user = snapshot.data as UserModel;
                  // --- Controllers --- //
                  final email = TextEditingController(text: user.email);
                  final password = TextEditingController(text: user.password);
                  final fullName = TextEditingController(text: user.fullName);
                  final phoneNo = TextEditingController(text: user.phoneNo);
                  return Column(
                    children: [
                      Stack(
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
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: GestureDetector(
                              onTap: () {},
                              child: Container(
                                width: 35,
                                height: 35,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                  color: cPrimaryColor,
                                ),
                                child: const Icon(
                                  LineAwesomeIcons.camera,
                                  color: Colors.black,
                                  size: 18.0,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      SizedBox(
                        child: Form(
                          child: Column(
                            children: [
                              // --- full name
                              TextFormField(
                                controller: fullName,
                                decoration: const InputDecoration(
                                  label: Text(cFullName),
                                  prefixIcon: Icon(
                                    Icons.person_2_outlined,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 10),
                              // --- email
                              TextFormField(
                                controller: email,
                                decoration: const InputDecoration(
                                  label: Text(cEmail),
                                  prefixIcon: Icon(
                                    Icons.email,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 10),
                              // --- phone number
                              TextFormField(
                                controller: phoneNo,
                                decoration: const InputDecoration(
                                  label: Text(cPhone),
                                  prefixIcon: Icon(
                                    Icons.phone,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 10),
                              // --- password
                              TextFormField(
                                controller: password,
                                decoration: const InputDecoration(
                                  label: Text(cPassword),
                                  prefixIcon: Icon(
                                    Icons.fingerprint,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 20),

                              // --- Form submit button --- //
                              SizedBox(
                                
                                width: double.infinity,
                                child: ElevatedButton(
                                  onPressed: () async {
                                    final userData = UserModel(
                                      fullName: fullName.text.trim(),
                                      email: email.text.trim(),
                                      phoneNo: phoneNo.text.trim(),
                                      password: password.text.trim(),
                                    );
                                    await controller.updateRecord(userData);
                                  },
                                  child: const Text('Save'),
                                ),
                              ),
                              const SizedBox(height: 20),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text.rich(
                                    TextSpan(
                                      text: 'Joined:',
                                      style: TextStyle(fontSize: 12),
                                      children: [
                                        TextSpan(
                                          text: '31 December 2023',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor:
                                          Colors.redAccent.withOpacity(0.2),
                                      foregroundColor: Colors.red,
                                      shape: const StadiumBorder(),
                                      side: BorderSide.none,
                                    ),
                                    onPressed: () {},
                                    child: const Text('Delete'),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  );
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text(snapshot.error.toString()),
                  );
                } else {
                  return const Center(
                    child: Text('Something went wrong'),
                  );
                }
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
