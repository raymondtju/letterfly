import 'package:Letterfly/components/textstylefont.dart';
import 'package:Letterfly/provider/letterfly_provider.dart';
import 'package:Letterfly/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

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

  TextEditingController UsernameController = TextEditingController();
  TextEditingController EmailController = TextEditingController();
  TextEditingController Password1Controller = TextEditingController();
  TextEditingController Password2Controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<LetterFlyProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text('Create an account', style: subheadlineStyle),
          ],
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Full Name',
                style: DefaultStyles.labelStyle,
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                controller: UsernameController,
                decoration: DefaultStyles.inputDecoration.copyWith(
                  hintText: 'Masukkan nama lengkap anda',
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Email',
                style: DefaultStyles.labelStyle,
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                controller: EmailController,
                decoration: DefaultStyles.inputDecoration.copyWith(
                  hintText: 'Enter your work email',
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Password',
                style: DefaultStyles.labelStyle,
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                controller: Password1Controller,
                obscureText: obscurePassword1,
                decoration: DefaultStyles.inputDecoration.copyWith(
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
                  ),
                ),
                onChanged: (value) {
                  setState(() {
                    if (value.length < 8) {
                      passwordErrorText1 =
                          'Password must be at least 8 characters';
                      passwordErrorBool1 = true;
                    } else {
                      passwordErrorText1 = '';
                      passwordErrorBool1 = false;
                    }
                  });
                },
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Password Confirmation',
                style: DefaultStyles.labelStyle,
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                controller: Password2Controller,
                obscureText: obscurePassword2,
                decoration: DefaultStyles.inputDecoration.copyWith(
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
                  ),
                ),
                onChanged: (value) {
                  setState(() {
                    if (value.length < 8) {
                      passwordErrorText2 =
                          'Password must be at least 8 characters';
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
          const SizedBox(
            height: 20,
          ),
          Column(
            children: [
              OutlinedButton(
                onPressed: () {
                  String username = UsernameController.text;
                  String email = EmailController.text;
                  String password1 = Password1Controller.text;
                  String password2 = Password2Controller.text;

                  if (password1 == password2) {
                    prov.setUsername = username;
                    prov.setEmail = email;
                    prov.setPassword = password1;
                    Navigator.pushNamed(context, "/login");
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Passwords do not match.'),
                        duration: Duration(seconds: 2),
                      ),
                    );
                  }
                },
                style: OutlinedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 50),
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
                      Navigator.pushNamed(context, "/login");
                    },
                    child: const Text('Login here'),
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
