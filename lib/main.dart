import 'package:Letterfly/forgotPassword.dart';
import 'package:Letterfly/login.dart';
import 'package:Letterfly/signup.dart';
import 'package:Letterfly/successful.dart';
import 'package:Letterfly/welcome.dart';
import 'package:flutter/material.dart';
import 'package:Letterfly/category/categoryGridView.dart';

main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "/home",
      routes: {
        '/home': (context) => const WelcomePage(),
        '/login': (context) => const LoginPage(),
        '/signup': (context) => const SignUpPage(),
        '/sukses': (context) => const SuccessfulPage(),
        '/forgetPass': (context) => const ForgotPasswordPage(),
        '/category': (context) => const CategoryGridView(),
      },
    );
  }
}
