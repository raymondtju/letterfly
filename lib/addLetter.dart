import 'package:flutter/material.dart';
import 'package:flutter_signature_pad/flutter_signature_pad.dart';

void showSignatureDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        title: Text('Autograph', style: TextStyle(fontWeight: FontWeight.bold),),
        content: Container(
          width: 1000,
          height: 250,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey)
          ),
          child: Column(
            children: [
              Expanded(
                child: Signature(
                  strokeWidth: 2.0,
                ),
              ),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: Text('Cancel'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          TextButton(
            child: Text('Save'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}

class AddLetterPage extends StatefulWidget {
  final List<String> imagePaths;

  const AddLetterPage({Key? key, required this.imagePaths}) : super(key: key);

  @override
  State<AddLetterPage> createState() => AddLetterPageState(imagePaths: imagePaths);
}

class AddLetterPageState extends State<AddLetterPage> {
  final List<String> imagePaths; 
  String selectedCategory = 'Uncathegorized';
  String selectedDivision = 'No Division';
  List <String> itemsCategory = ['Uncathegorized','A', 'B', 'C'];
  List <String> itemsDivision = ['No Division','A', 'B', 'C'];

  AddLetterPageState({required this.imagePaths});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Letter'),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Letter Media', style: TextStyle(fontWeight: FontWeight.bold)),
              SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black)
                      ),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            for (var imagePath in imagePaths)
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 10),
                                child: Image.network(imagePath, width: 150, height: 150),
                              ),
                            GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(context, "/takeaphoto");
                              },
                              child: Container(
                                width: 85,
                                height: 85,
                                color: Colors.grey[300],
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.description),
                                    SizedBox(height: 5),
                                    Text(
                                      'Add Letter',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              const Text('Letter Number', style: TextStyle(fontWeight: FontWeight.bold)),
              SizedBox(height: 10),
              const TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'e.g Order/Code1/Code2/Month/Year',
                ),
              ),
              SizedBox(height: 10),
              const Text('Date Published', style: TextStyle(fontWeight: FontWeight.bold)),
              SizedBox(height: 10),
              TextField(
                keyboardType: TextInputType.datetime,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'dd/mm/yyyy',
                  suffixIcon: Icon(Icons.calendar_today)
                ),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Category', style: TextStyle(fontWeight: FontWeight.bold)),
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black)
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: DropdownButton(
                            items: itemsCategory.map((e) { 
                              return DropdownMenuItem(
                                child: Text(e),
                                value: e,
                              );
                            }).toList(), 
                            value: selectedCategory,
                            onChanged: (val) {
                              setState(() {
                                selectedCategory = val.toString();
                              });
                            }
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Division', style: TextStyle(fontWeight: FontWeight.bold)),
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black)
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: DropdownButton(
                            items: itemsDivision.map((e) { 
                              return DropdownMenuItem(
                                child: Text(e),
                                value: e,
                              );
                            }).toList(), 
                            value: selectedDivision,
                            onChanged: (val) {
                              setState(() {
                                selectedDivision = val.toString();
                              });
                            }
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 10,),
              const Text('Add E-Signature', style: TextStyle(fontWeight: FontWeight.bold)),
              SizedBox(height: 10,),
              Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () {
                      showSignatureDialog(context);
                    },
                    child: Container(
                      color: Colors.grey[300],
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.create),
                          SizedBox(height: 5),
                          Text(
                            'Add Sign',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10,),
              const Text('Description', style: TextStyle(fontWeight: FontWeight.bold)),
              SizedBox(height: 10,),
              TextField(
                maxLines: null, 
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Write Detail Description',
                ),
              ),
              SizedBox(height: 30,),
              Container(
                width: double.infinity, 
                decoration: BoxDecoration(
                  color: Colors.black,
                ),
                child: TextButton( 
                  onPressed: () {
          
                  },
                  child: Text(
                    'Add Letter',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}