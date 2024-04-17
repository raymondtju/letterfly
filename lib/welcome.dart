import 'package:Letterfly/components/textstylefont.dart';
import 'package:flutter/material.dart';
import 'package:Letterfly/login.dart';
import 'package:flutter_svg/flutter_svg.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //  appBar: AppBar(
        //   centerTitle: true,
        //   backgroundColor: Colors.black,
        //   title: Text(
        //       'E-MAIL FOR NEWBIE',
        //       style: TextStyle(
        //         color: Colors.white
        //       ),
        //     ),
        //  ),
        body: Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
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
                    ],
                  ),
                ],
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(padding: EdgeInsets.symmetric(vertical: 120)),
              const Padding(
                padding: EdgeInsets.only(right: 120),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(right: 20),
                      child: Text('Welcome To Letterfly', style: headlineStyle),
                    ),
                    Text(
                      'Tempat kamu bisa dokumentasi dan sortir suratmu suratmu fleksibel sesuai keinginan.',
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
                    side: const BorderSide(color: Colors.black, width: 1)),
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
