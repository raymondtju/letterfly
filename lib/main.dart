import 'package:Letterfly/category/category_view.dart';
import 'package:Letterfly/category/suratkuasa_view.dart';
import 'package:Letterfly/forgotPassword.dart';
import 'package:Letterfly/login.dart';
import 'package:Letterfly/provider/letterfly_provider.dart';
import 'package:Letterfly/signup.dart';
import 'package:Letterfly/successful.dart';
import 'package:Letterfly/welcome.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LetterFlyProvider()),
      ],
      child: MaterialApp(
        initialRoute: "/home",
        routes: {
          '/home': (context) => const WelcomePage(),
          '/login': (context) => const LoginPage(),
          '/signup': (context) => const SignUpPage(),
          '/sukses': (context) => const SuccessfulPage(),
          '/forgetPass': (context) => const ForgotPasswordPage(),
          '/category': (context) => const CategoryView(),
          '/surat_kuasa': (context) => const SuratKuasaView(),
        },
      ),
    );
  }
}
