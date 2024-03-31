import 'package:flutter/material.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Forgot Password', style: TextStyle(fontWeight: FontWeight.bold),),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
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
            OutlinedButton(
              onPressed: () {

              }, 
              child: Text(
                'Send OTP',
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
          ],
        ),
      ),
    );
  }
}