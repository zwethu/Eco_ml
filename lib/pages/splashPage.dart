import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:eco_ml/pages/onboardPage.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AnimatedSplashScreen(
          splash: Image.asset('assets/images/appLogo.png'),
          nextScreen: OnboardPage(),
          ),
    );
  }
}
