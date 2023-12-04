import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  static String routeName = "login-screen";
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Login",
              style: TextStyle(color: Colors.black),
            )
          ],
        ),
      ),
    );
  }
}
