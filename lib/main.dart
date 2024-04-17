// ignore_for_file: prefer_const_constructors
import 'package:Letterfly/forgotPassword.dart';
import 'package:Letterfly/login.dart';
import 'package:Letterfly/signup.dart';
import 'package:Letterfly/successful.dart';
import 'package:Letterfly/welcome.dart';
import 'package:flutter/material.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget {
   MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "/sukses",
      routes: {
        '/home': (context) => WelcomePage(),
        '/login': (context) => LoginPage(),
        '/signup': (context) => SignUpPage(),
        '/sukses': (context) => SuccessfulPage(),
        '/forgetPass': (context) => ForgotPasswordPage(),
      },
    );
  }
}
