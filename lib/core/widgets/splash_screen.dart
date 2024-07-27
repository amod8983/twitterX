import 'package:flutter/material.dart';
import 'package:twitterx/core/constants/constant.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(color: kPrimaryColor),
        child: Center(
          child: Image.asset(
            'assets/icons/twitter-app-icon.png',
            width: 100,
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
