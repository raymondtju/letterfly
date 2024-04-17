import 'package:Letterfly/components/textstylefont.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key});

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text('Forgot Password', style: subheadlineStyle),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
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
              height: 20,
            ),
            OutlinedButton(
              onPressed: () {
                _showOTPMenu(context);
              },
              style: OutlinedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 50),
                  backgroundColor: Colors.black,
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.zero),
                  side: const BorderSide(color: Colors.white, width: 1)),
              child: const Text(
                'Send OTP',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void _showOTPMenu(BuildContext context) {
  showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 450,
          decoration: const BoxDecoration(color: Colors.white),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                const Padding(padding: EdgeInsets.only(top: 20)),
                const ListTile(
                  title: Text('Enter your code send to name@email.com',
                      style: subheadlineStyle),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    for (int i = 0; i < 6; i++)
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: TextField(
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(1),
                            ],
                            textAlign: TextAlign.center,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: '-',
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: OutlinedButton(
                        onPressed: () {},
                        style: OutlinedButton.styleFrom(
                            minimumSize: const Size(300, 50),
                            backgroundColor: Colors.white,
                            shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.zero),
                            side: const BorderSide(
                                color: Colors.black, width: 1)),
                        child: const Text(
                          'Resend',
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: OutlinedButton(
                        onPressed: () {},
                        style: OutlinedButton.styleFrom(
                            minimumSize: const Size(300, 50),
                            backgroundColor: Colors.black,
                            shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.zero),
                            side: const BorderSide(
                                color: Colors.white, width: 1)),
                        child: const Text(
                          'Confirm',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        );
      });
}
