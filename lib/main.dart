import 'package:Letterfly/aboutUs.dart';
import 'package:Letterfly/addletter.dart';
import 'package:Letterfly/category/category_view.dart';
import 'package:Letterfly/category/suratkuasa_view.dart';
import 'package:Letterfly/components/colors.dart';
import 'package:Letterfly/forgotPassword.dart';
import 'package:Letterfly/home.dart';
import 'package:Letterfly/login.dart';
import 'package:Letterfly/newPassword.dart';
import 'package:Letterfly/profile.dart';
import 'package:Letterfly/provider/letterfly_provider.dart';
import 'package:Letterfly/report.dart';
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
      child: Consumer<LetterFlyProvider>(
        builder: (context, prov, child) {
          return MaterialApp(
            themeMode: ThemeMode.light,
            theme: GlobalThemeData().lightThemeData,
            debugShowCheckedModeBanner: false,
            initialRoute: "/report",
            onGenerateRoute: (settings) {
              switch (settings.name) {
                case '/welcome':
                  return _buildPageRoute(const WelcomePage());
                case '/login':
                  return _buildPageRoute(const LoginPage());
                case '/signup':
                  return _buildPageRoute(const SignUpPage());
                case '/home':
                  return _buildPageRoute(HomePage());
                case '/sukses':
                  return _buildPageRoute(const SuccessfulPage());
                case '/forgetPass':
                  return _buildPageRoute(const ForgotPasswordPage());
                case '/newPass':
                  return _buildPageRoute(const NewPasswordPage());
                case '/category':
                  return _buildPageRoute(const CategoryView());
                case '/surat_kuasa':
                  return _buildPageRoute(const SuratKuasaView());
                case '/takeaphoto':
                  return _buildPageRoute(const TakeAPhotoPage());
                case '/addletter':
                  return _buildPageRoute(const AddLetterPage(imagePaths: []));
                case '/profile':
                  return _buildPageRoute(const ProfilePage());
                case '/about_us':
                  return _buildPageRoute(const AboutUs());
                case '/report':
                  return _buildPageRoute(const ReportBug());
                default:
                  return _buildPageRoute(const WelcomePage());
              }
            },
          );
        },
      ),
    );
  }

  PageRouteBuilder _buildPageRoute(Widget page) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionDuration: const Duration(milliseconds: 100),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(1.0, 0.0);
        const end = Offset.zero;
        const curve = Curves.easeIn;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        var offsetAnimation = animation.drive(tween);

        return SlideTransition(
          position: offsetAnimation,
          child: child,
        );
      },
    );
  }
}
