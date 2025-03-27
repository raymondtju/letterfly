//Import - Import
import 'package:Letterfly/pages/category/provider/My_Letter_Provider.dart';
import 'package:Letterfly/pages/category/suratOnFolderView.dart';
import 'package:Letterfly/pages/category/view_my_letter.dart';
import 'package:Letterfly/pages/drawer/aboutUs.dart';
import 'package:Letterfly/pages/add_letter_page/addletter.dart';
import 'package:Letterfly/components/colors.dart';
import 'package:Letterfly/pages/drawer/editProfile.dart';
import 'package:Letterfly/pages/forgotPassword.dart';
import 'package:Letterfly/pages/home.dart';
import 'package:Letterfly/pages/login.dart';
import 'package:Letterfly/pages/newPassword.dart';
import 'package:Letterfly/pages/drawer/profile.dart';
import 'package:Letterfly/provider/letterfly_provider.dart';
import 'package:Letterfly/pages/drawer/report.dart';
import 'package:Letterfly/pages/signup.dart';
import 'package:Letterfly/pages/add_letter_page/successful.dart';
import 'package:Letterfly/pages/add_letter_page/takeAPhoto.dart';
import 'package:Letterfly/pages/edit_letter_page/editTakeAPhoto.dart';
import 'package:Letterfly/pages/welcome.dart';
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
        ChangeNotifierProvider(create: (_) => MyLetterProvider()),
      ],
      child: Consumer<LetterFlyProvider>(
        builder: (context, prov, child) {
          return MaterialApp(
            themeMode: ThemeMode.light,
            theme: GlobalThemeData().lightThemeData,
            debugShowCheckedModeBanner: false,
            initialRoute: "/welcome",
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
                  final String categoryId = settings.arguments as String;
                  return _buildPageRoute(
                      suratOnFolderView(categoryId: categoryId));
                case '/takeaphoto':
                  return _buildPageRoute(const TakeAPhotoPage());
                case '/edit_takeaphoto':
                  return _buildPageRoute(EditTakeAPhotoPage(
                      id_letter:
                          ModalRoute.of(context)?.settings.arguments as int));
                case '/addletter':
                  return _buildPageRoute(const AddLetterPage(imagePaths: []));
                case '/profile':
                  return _buildPageRoute(const ProfilePage());
                case '/about_us':
                  return _buildPageRoute(const AboutUs());
                case '/report':
                  return _buildPageRoute(const ReportBug());
                case '/edit_profile':
                  return _buildPageRoute(const EditProfilePage());
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
