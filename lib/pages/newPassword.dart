import 'package:Letterfly/components/textstylefont.dart';
import 'package:Letterfly/provider/letterfly_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NewPasswordPage extends StatefulWidget {
  const NewPasswordPage({super.key});

  @override
  State<NewPasswordPage> createState() => _NewPasswordPageState();
}

class _NewPasswordPageState extends State<NewPasswordPage> {
  String passwordErrorText1 = '';
  String passwordErrorText2 = '';
  bool passwordErrorBool1 = false;
  bool passwordErrorBool2 = false;

  bool obscurePassword1 = true;
  bool obscurePassword2 = true;

  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController password1Controller = TextEditingController();
  TextEditingController password2Controller = TextEditingController();

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
              const Text(
                'New Password',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                controller: password1Controller,
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
                    )),
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
                height: 10,
              ),
              const Text(
                'Confirm New Password',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                controller: password2Controller,
                obscureText: obscurePassword2,
                decoration: InputDecoration(
                    border: const OutlineInputBorder(),
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
                    )),
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
                  String password1 = password1Controller.text;
                  String password2 = password2Controller.text;

                  if (password1 == password2) {
                    prov.setPassword = password1;
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Successful !!'),
                        duration: Duration(seconds: 2),
                      ),
                    );
                    Navigator.pushNamed(context, "/login");
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
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
                  'Save',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}