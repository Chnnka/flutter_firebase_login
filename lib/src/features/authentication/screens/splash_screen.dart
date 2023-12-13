import 'package:flutter/material.dart';
import 'package:flutter_firebase_login/main.dart';
import 'package:flutter_firebase_login/src/constants/images.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool animate = false;
  @override
  void initState() {
    super.initState();
    startAnimation();
  }

  Future startAnimation() async {
    await Future.delayed(const Duration(milliseconds: 500));
    setState(() => animate = true);
    await Future.delayed(const Duration(milliseconds: 4000));
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: ((context) => const AppHome())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          AnimatedPositioned(
            duration: const Duration(milliseconds: 300),
            top: animate ? 0 : -30,
            left: animate ? 0 : -30,
            child: const Image(
              height: 130,
              image: AssetImage(cSplashLogo),
            ),
          ),
          AnimatedPositioned(
            duration: const Duration(milliseconds: 300),
            top: 80,
            left: 189,
            child: AnimatedOpacity(
              opacity: animate ? 1 : 0,
              duration: const Duration(milliseconds: 300),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text('appName',
                      style: Theme.of(context).textTheme.headlineLarge),
                  Text('tagline',
                      style: Theme.of(context).textTheme.headlineSmall),
                ],
              ),
            ),
          ),
          AnimatedPositioned(
            duration: const Duration(milliseconds: 300),
            bottom: 250,
            left: animate ? 30 : -80,
            child: const Image(
              height: 330,
              image: AssetImage(cSplashImage),
            ),
          ),
          AnimatedPositioned(
            duration: const Duration(milliseconds: 300),
            bottom: animate ? 30 : 0,
            right: animate ? 30 : 0,
            child: Container(
              height: 50,
              width: 50,
              color: Colors.yellowAccent,
            ),
          ),
        ],
      ),
    );
  }
}
