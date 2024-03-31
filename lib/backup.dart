import 'package:flutter/material.dart';

main() => runApp(
  MyApp()
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const MyWidget(),
    );
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
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.mail, color: Colors.green,),
                          SizedBox(width: 10,),
                          Text(
                            'Letterfly',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20
                            ),
                          ),
                        ],
                      ),
                      Text('Akses surat lebih mudah')
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.language),
                      Text('EN')
                    ],
                  )
                ],
              ),
              Padding(padding: EdgeInsets.symmetric(vertical: 150)),
              Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Selamat Datang di Letterfly',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20
                      ),
                    ),
                    Text('Your go to app for a hassle -free life. We’re here to help with all your needs anytime, anywhere.')
                  ],
                ),
              Padding(padding: EdgeInsets.symmetric(vertical: 10)),
              ElevatedButton(
                onPressed: () {

                }, 
                child: Text(
                  'Login',
                  style: TextStyle(
                    color: Colors.white
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(double.infinity, 50),
                  backgroundColor: Colors.green,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.zero
                  )
                ),
              ),
              Padding(padding: EdgeInsets.symmetric(vertical: 10)),
              ElevatedButton(
                onPressed: () {

                }, 
                child: Text(
                  'Login',
                  style: TextStyle(
                    color: Colors.white
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(double.infinity, 50),
                  backgroundColor: Colors.green,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.zero
                  )
                ),
              ),
            ],
          ),
        )
    );
  }
}