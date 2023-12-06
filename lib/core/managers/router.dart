import 'package:flutter/material.dart';
import 'package:mentor_academy_e_commerce/screens/modules/home.dart';
import 'package:mentor_academy_e_commerce/screens/modules/login.dart';
import 'package:mentor_academy_e_commerce/screens/modules/onboarding.dart';
import 'package:mentor_academy_e_commerce/screens/modules/product_detail.dart';
import 'package:mentor_academy_e_commerce/screens/modules/register.dart';

class AppRouter {
  static Map<String, Widget Function(BuildContext)> router = {
    OnBoardingScreen.routeName: (context) => const OnBoardingScreen(),
    LoginScreen.routeName: (context) => const LoginScreen(),
    RegisterScreen.routeName: (context) => const RegisterScreen(),
    HomeScreen.routeName: (context) => const HomeScreen(),
    ProductDetail.routeName: (context) => const ProductDetail(),
  };
}
