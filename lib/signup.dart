import 'package:Letterfly/main.dart';
import 'package:flutter/material.dart';
import 'package:Letterfly/login.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MyWidget();
  }
}

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  String passwordErrorText1 = '';
  String passwordErrorText2 = '';
  bool passwordErrorBool1 = false;
  bool passwordErrorBool2 = false;

  bool obscurePassword1 = true;
  bool obscurePassword2 = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'Create an account',
              style: TextStyle(
                  fontFamily: "SF",
                  letterSpacing: -1,
                  fontWeight: FontWeight.w700,
                  fontSize: 24),
            ),
          ],
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Full Name',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Masukkan nama lengkap anda',
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'Email',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter your work email',
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'Password',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                obscureText: obscurePassword1,
                decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    hintText: 'Consisting of 8 letters',
                    errorText: passwordErrorBool1 ? passwordErrorText1 : null,
                    suffixIcon: IconButton(
                      icon: Icon(obscurePassword1
                          ? Icons.visibility_off
                          : Icons.visibility),
                      onPressed: () {
                        setState(() {
                          obscurePassword1 = !obscurePassword1;
                        });
                      },
                    )
                  ),
                  onChanged: (value) {
                    setState(() {
                      if (value.length < 8) {
                        passwordErrorText1 = 'Password must be at least 8 characters';
                        passwordErrorBool1 = true;
                      } else {
                        passwordErrorText1 = '';
                        passwordErrorBool1 = false;
                      }
                    });
                  },
                ),
                SizedBox(height: 10,),
                Text(
                  'Password Confirmation',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: 10,),
                TextField(
                  obscureText: obscurePassword2,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Consisting of 8 letters',
                    errorText: passwordErrorBool2 ? passwordErrorText2 : null,
                    suffixIcon: IconButton(
                      icon: Icon(obscurePassword2
                          ? Icons.visibility_off
                          : Icons.visibility),
                      onPressed: () {
                        setState(() {
                          obscurePassword2 = !obscurePassword2;
                        });
                      },
                    )
                  ),
                  onChanged: (value) {
                    setState(() {
                      if (value.length < 8) {
                        passwordErrorText2 = 'Password must be at least 8 characters';
                        passwordErrorBool2 = true;
                      } else {
                        passwordErrorText2 = '';
                        passwordErrorBool2 = false;
                      }
                    });
                  },
                ),
              ],
            ),
            Column(
              children: [
                OutlinedButton(
                  onPressed: () {
                    Navigator.push(
                      context, 
                      MaterialPageRoute(builder: (context) => Login()));
                  }, 
                  style: OutlinedButton.styleFrom(
                    minimumSize: Size(double.infinity, 50),
                    backgroundColor: Colors.black,
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.zero),
                    side: const BorderSide(color: Colors.white, width: 1)),
                child: const Text(
                  'Sign Up',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Already have an account?'),
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Login()));
                      },
                      child: const Text('Login here'))
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
