import 'package:flutter/material.dart';
import 'package:mentor_academy_e_commerce/screens/modules/login.dart';
import 'package:mentor_academy_e_commerce/screens/modules/onboarding.dart';

class AppRouter {
  static Map<String, Widget Function(BuildContext)> router = {
    OnBoardingScreen.routeName: (context) => const OnBoardingScreen(),
    LoginScreen.routeName: (context) => const LoginScreen(),
  };
}
