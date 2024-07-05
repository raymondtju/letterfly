import 'package:Letterfly/components/textstylefont.dart';
import 'package:Letterfly/provider/letterfly_provider.dart';
import 'package:Letterfly/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

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
  String passwordErrorText = '';
  bool passwordErrorBool = false;
  bool obscurePassword = true;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<LetterFlyProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Login', style: subheadlineStyle),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Email',
                  style: DefaultStyles.labelStyle,
                ),
                const SizedBox(
                  height: 8,
                ),
                TextField(
                  controller: emailController,
                  decoration: DefaultStyles.inputDecoration.copyWith(
                    hintText: 'Enter your work email',
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'Password',
                  style: DefaultStyles.labelStyle,
                ),
                const SizedBox(
                  height: 8,
                ),
                TextField(
                  controller: passwordController,
                  obscureText: obscurePassword,
                  decoration: DefaultStyles.inputDecoration.copyWith(
                    errorText: passwordErrorBool ? passwordErrorText : null,
                    hintText: 'Enter your password',
                    suffixIcon: IconButton(
                      icon: Icon(
                        obscurePassword
                            ? Icons.visibility_off
                            : Icons.visibility,
                        size: 16,
                        color: Colors.black38,
                      ),
                      onPressed: () {
                        setState(() {
                          obscurePassword = !obscurePassword;
                        });
                      },
                    ),
                  ),
                  onChanged: (value) {
                    setState(
                      () {
                        if (value.length < 8) {
                          passwordErrorText =
                              'Password must be at least 8 characters';
                          passwordErrorBool = true;
                        } else {
                          passwordErrorText = '';
                          passwordErrorBool = false;
                        }
                      },
                    );
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, "/forgetPass");
                        },
                        child: const Text(
                          'Forgot Password!',
                        )),
                  ],
                )
              ],
            ),
            Column(
              children: [
                OutlinedButton(
                  onPressed: () {
                    String email = emailController.text;
                    String password = passwordController.text;

                    if (!password.isEmpty) {
                      if (email == prov.Email) {
                        if (password == prov.Password) {
                          Navigator.pushNamed(context, "/home");
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text('Password is wrong.'),
                            duration: Duration(seconds: 2),
                          ));
                        }
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Email not registered.'),
                            duration: Duration(seconds: 2),
                          ),
                        );
                      }
                    } else {
                      // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      //   content: Text('Password is wrong.'),
                      //   duration: Duration(seconds: 2),
                      // ));
                      Navigator.pushNamed(context, "/home");
                    }

                  },
                  style: OutlinedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 50),
                    backgroundColor: Colors.black,
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.zero),
                    side: const BorderSide(color: Colors.white, width: 1),
                  ),
                  child: const Text(
                    'Login',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Don't have an account?"),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, "/signup");
                      },
                      child: const Text('Create an account'),
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
