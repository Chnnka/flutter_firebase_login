import 'package:flutter/material.dart';
import 'package:flutter_firebase_login/src/features/authentication/screens/splash_screen.dart';
import 'package:flutter_firebase_login/src/utils/theme/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: CAppTheme.lightTheme,
      darkTheme: CAppTheme.darkTheme,
      themeMode: ThemeMode.system,
      home: const SplashScreen(),
    );
  }
}

class AppHome extends StatelessWidget {
  const AppHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('App Home'),
      ),
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: ListView(
            children: [
              Text(
                "Heading",
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              Text(
                'Sub-Heading',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              Text(
                'Paragraph',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              ElevatedButton(
                onPressed: () {},
                child: const Text('Elevated'),
              ),
              OutlinedButton(
                onPressed: () {},
                child: const Text('Outlined'),
              ),
              const Padding(
                padding: EdgeInsets.all(20),
                child: Image(
                  image: AssetImage('assets/images/b.jpg'),
                ),
              )
            ],
          )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Text(
          '+',
          style: TextStyle(fontSize: 25),
        ),
      ),
    );
  }
}
