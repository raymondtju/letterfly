import 'package:flutter/material.dart';
import 'package:Letterfly/forgotPassword.dart';
import 'package:Letterfly/login.dart';
import 'package:Letterfly/signup.dart';

main() => runApp(
  MyApp()
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const WelcomePage(),
    );
  }
}

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
       body: 
        Padding(
          padding: EdgeInsets.all(20),
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
                              Icon(Icons.mail),
                              SizedBox(width: 10,),
                              Text(
                                'Letterfly',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 24
                                ),
                              ),
                            ],
                          ),
                          Text(
                            'Akses surat lebih mudah',
                            style: TextStyle(
                              fontWeight: FontWeight.w200,
                              fontSize: 16
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(padding: EdgeInsets.symmetric(vertical: 120)),
                  Padding(
                    padding: EdgeInsets.only(right: 120), 
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(right: 20),
                          child: Text(
                            'Welcome To Letterfly',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 28
                            ),
                          ),
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
                  Padding(padding: EdgeInsets.symmetric(vertical: 10)),
                  OutlinedButton(
                    onPressed: () {
                      Navigator.push(
                        context, 
                        MaterialPageRoute(builder: (context) => const Login()));
                    }, 
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Start Creating Letter',
                          style: TextStyle(
                            color: Colors.white
                          ),
                        ),
                        SizedBox(width: 10,),
                        Icon(Icons.arrow_right_alt, color: Colors.white,),
                      ],
                    ),
                    style: OutlinedButton.styleFrom(
                      minimumSize: Size(double.infinity, 50),
                      backgroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.zero
                      ),
                      side: BorderSide(color: Colors.black, width: 1)
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(bottom: 30))
                ],
              ),
            ],
          ),
        )
    );
  }
}