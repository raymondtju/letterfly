import 'package:flutter/material.dart';
import 'package:Letterfly/login.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return MyWidget();
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

  bool obscurePassword1 = true;
  bool obscurePassword2 = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create an account', style: TextStyle(fontWeight: FontWeight.bold),),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Full Name',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: 10,),
                TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Masukkan nama lengkap anda',
                  ),
                ),
                SizedBox(height: 20,),
                Text(
                  'Email',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: 10,),
                TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter your work email',
                  ),
                ),
                SizedBox(height: 20,),
                Text(
                  'Password',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: 10,),
                TextField(
                  obscureText: obscurePassword1,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Consisting of 8 letters',
                    errorText: passwordErrorText1,
                    suffixIcon: IconButton(
                      icon: Icon(obscurePassword1 ? Icons.visibility_off : Icons.visibility),
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
                      } else {
                        passwordErrorText1 = '';
                      }
                    });
                  },
                ),
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
                    errorText: passwordErrorText2,
                    suffixIcon: IconButton(
                      icon: Icon(obscurePassword2 ? Icons.visibility_off : Icons.visibility),
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
                      } else {
                        passwordErrorText2 = '';
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

                  }, 
                  child: Text(
                    'Sign Up',
                    style: TextStyle(
                      color: Colors.white
                    ),
                  ),
                  style: OutlinedButton.styleFrom(
                    minimumSize: Size(double.infinity, 50),
                    backgroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.zero
                    ),
                    side: BorderSide(color: Colors.white, width: 1)
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Already have an account?'),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const Login()));
                      }, 
                      child: Text('Login here')
                    )
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}