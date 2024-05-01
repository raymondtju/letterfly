import 'package:Letterfly/addLetter.dart';
import 'package:Letterfly/forgotPassword.dart';
import 'package:Letterfly/home.dart';
import 'package:Letterfly/login.dart';
import 'package:Letterfly/providerPhoto.dart';
import 'package:Letterfly/signup.dart';
import 'package:Letterfly/successful.dart';
import 'package:Letterfly/takeAPhoto.dart';
import 'package:Letterfly/welcome.dart';
import 'package:flutter/material.dart';
import 'package:Letterfly/category/categoryGridView.dart';
import 'package:provider/provider.dart';

main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ProviderPage(),
      child: MaterialApp(
        initialRoute: "/main",
        routes: {
          '/main': (context) => const WelcomePage(),
          '/login': (context) => const LoginPage(),
          '/signup': (context) => const SignUpPage(),
          '/sukses': (context) => const SuccessfulPage(),
          '/forgetPass': (context) => const ForgotPasswordPage(),
          '/home': (context) => const HomePage(),
          '/category': (context) => const CategoryGridView(),
          '/takeaphoto': (context) => const TakeAPhotoPage(),
          '/addletter': (context) => const AddLetterPage(imagePaths: [],),
        },
      )
    );
  }
}
