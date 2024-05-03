import 'package:Letterfly/addletter.dart';
import 'package:Letterfly/category/category_view.dart';
import 'package:Letterfly/category/suratkuasa_view.dart';
import 'package:Letterfly/editletter.dart';
import 'package:Letterfly/forgotPassword.dart';
import 'package:Letterfly/home.dart';
import 'package:Letterfly/login.dart';
import 'package:Letterfly/provider/letterfly_provider.dart';
import 'package:Letterfly/signup.dart';
import 'package:Letterfly/successful.dart';
import 'package:Letterfly/takeAPhoto.dart';
import 'package:Letterfly/welcome.dart';
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
        initialRoute: "/welcome",
        routes: {
          '/welcome': (context) => const WelcomePage(),
          '/login': (context) => const LoginPage(),
          '/signup': (context) => const SignUpPage(),
          '/home': (context) => const HomePage(),
          '/sukses': (context) => const SuccessfulPage(),
          '/forgetPass': (context) => const ForgotPasswordPage(),
          '/category': (context) => const CategoryView(),
          '/surat_kuasa': (context) => const SuratKuasaView(),
          '/takeaphoto': (context) => const TakeAPhotoPage(),
          '/addletter': (context) => const AddLetterPage(imagePaths: [],),
          '/editletter': (context) => const EditLetterPage(imagePaths: [],),
        },
      ),
    );
  }
}
