import 'package:Letterfly/components/textstylefont.dart';
import 'package:Letterfly/pages/category/provider/My_Letter_Provider.dart';
import 'package:Letterfly/provider/letterfly_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  void initState() {
    super.initState();
    addAdmin();
    addingRecentFolder();
  }

  void addingRecentFolder() {
    final prov = Provider.of<MyLetterProvider>(context, listen: false);
    if (!prov.folders.any((CategoryItem) => CategoryItem.title == "Recent")) {
      prov.addItem(title: "Recent");
    }
  }

  void addAdmin() {
    final prov = Provider.of<LetterFlyProvider>(context, listen: false);
    prov.setUsername = "admin";
    prov.setEmail = "admin@gmail.com";
    prov.setPassword = "adminadmin";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Row(
            children: [
              SvgPicture.asset(
                'assets/logo/Logo.svg',
                height: 25,
              ),
              const SizedBox(
                width: 10,
              ),
              const Text('Letterfly', style: headlineStyle),
            ],
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Column(
                children: [
                  SvgPicture.asset(
                    'assets/images/undraw_software_engineer_re_tnjc 1.svg',
                    height: 300,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(right: 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(right: 0),
                          child: Text('Welcome To Letterfly',
                              style: headlineStyle),
                        ),
                        Text(
                          'The place where you can document and archive your physical mail is flexible and secure!',
                          style: TextStyle(
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Padding(padding: EdgeInsets.symmetric(vertical: 10)),
                  OutlinedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, "/login");
                    },
                    style: OutlinedButton.styleFrom(
                        minimumSize: const Size(double.infinity, 50),
                        backgroundColor: Colors.black,
                        shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.zero),
                        side: const BorderSide(
                            color: Color.fromRGBO(40, 42, 45, 1), width: 1)),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Start Creating Letter',
                          style: TextStyle(color: Colors.white),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Icon(
                          Icons.arrow_right_alt,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                  const Padding(padding: EdgeInsets.only(bottom: 30))
                ],
              ),
            ],
          ),
        ));
  }
}
