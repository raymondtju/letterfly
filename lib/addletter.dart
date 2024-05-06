import 'dart:convert';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:Letterfly/components/letteritem.dart';
import 'package:Letterfly/components/textstylefont.dart';
import 'package:Letterfly/provider/letterfly_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_signature_pad/flutter_signature_pad.dart';
import 'package:provider/provider.dart';

Future showSignatureDialog(
    BuildContext context, GlobalKey<SignatureState> signatureKey) async {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(0))),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        title: const Text(
          'Autograph',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        content: Container(
          width: 400,
          height: 250,
          decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
          child: Column(
            children: [
              Expanded(
                child: Signature(
                  key: signatureKey,
                  strokeWidth: 2.0,
                ),
              ),
            ],
          ),
        ),
        actions: <Widget>[
          OutlinedButton(
            style: ButtonStyle(
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0)))),
            onPressed: () {
              signatureKey.currentState?.clear();
            },
            child: const Text('Reset'),
          ),
          Container(
            color: const Color.fromRGBO(40, 42, 45, 1),
            child: OutlinedButton(
              style: ButtonStyle(
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0)))),
              child: const Text('Save',
                  style: TextStyle(color: Color.fromRGBO(249, 249, 249, 1))),
              onPressed: () async {
                var data = await signatureKey.currentState?.getData();
                Navigator.of(context).pop(data);
              },
            ),
          ),
        ],
      );
    },
  );
}

class AddLetterPage extends StatefulWidget {
  final List<String> imagePaths;

  const AddLetterPage({super.key, required this.imagePaths});

  @override
  State<AddLetterPage> createState() =>
      AddLetterPageState(imagePaths: imagePaths);
}

class AddLetterPageState extends State<AddLetterPage> {
  final List<String> imagePaths;
  String selectedCategory = 'Surat Kuasa';
  String selectedDivision = 'IT';
  List<String> itemsCategory = ['Surat Kuasa', 'Surat Ajaib'];
  List<String> itemsDivision = ['IT', 'ADMN', 'LOG', 'FO'];
  Uint8List? signImage;

  TextEditingController letternumberController = TextEditingController();
  TextEditingController datepublishedController = TextEditingController();
  TextEditingController signatureimageController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  final signatureKey = GlobalKey<SignatureState>();

  AddLetterPageState({required this.imagePaths});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        leading: BackButton(
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text('Add Letter', style: subheadlineStyle),
          ],
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Letter Media',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 120,
                      decoration:
                          BoxDecoration(border: Border.all(color: Colors.grey)),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Padding(
                          padding: const EdgeInsets.all(5),
                          child: Row(
                            children: [
                              for (var imagePath in imagePaths)
                                Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: SizedBox(
                                    width: 88,
                                    height: 88,
                                    child: Image.network(
                                      imagePath,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              const SizedBox(
                                width: 10,
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.pushNamed(context, "/takeaphoto");
                                },
                                child: Container(
                                  width: 88,
                                  height: 88,
                                  color: Colors.grey[300],
                                  child: const Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.description_sharp,
                                        size: 16,
                                      ),
                                      SizedBox(height: 4),
                                      Text(
                                        'Add Letter',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize: 10,
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
                  ),
                ],
              ),
              const SizedBox(height: 20),
              const Text('Letter Number',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
              const SizedBox(height: 10),
              TextField(
                controller: letternumberController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                    borderRadius: BorderRadius.all(Radius.circular(0)),
                  ),
                  hintText: 'e.g Order/Code1/Code2/Month/Year',
                ),
              ),
              const SizedBox(height: 20),
              const Text('Date Published',
                  style: TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 10),
              TextField(
                controller: datepublishedController,
                keyboardType: TextInputType.datetime,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                      borderRadius: BorderRadius.all(Radius.circular(0)),
                    ),
                    hintText: 'dd/mm/yyyy',
                    suffixIcon: Icon(Icons.calendar_today_sharp)),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Category',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      const SizedBox(height: 10),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.44,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey)),
                        child: ButtonTheme(
                          alignedDropdown: true,
                          child: DropdownButton(
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            isExpanded: true,
                            items: itemsCategory.map((e) {
                              return DropdownMenuItem(
                                value: e,
                                child: Text(e),
                              );
                            }).toList(),
                            value: selectedCategory,
                            onChanged: (val) {
                              setState(() {
                                selectedCategory = val.toString();
                              });
                            },
                            underline: Container(),
                            focusColor: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Division',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      const SizedBox(height: 10),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.44,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey)),
                        child: ButtonTheme(
                          alignedDropdown: true,
                          child: DropdownButton(
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            isExpanded: true,
                            items: itemsDivision.map((e) {
                              return DropdownMenuItem(
                                value: e,
                                child: Text(e),
                              );
                            }).toList(),
                            value: selectedDivision,
                            onChanged: (val) {
                              setState(() {
                                selectedDivision = val.toString();
                              });
                            },
                            underline: Container(),
                            focusColor: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              const Text('Add E-Signature',
                  style: TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Container(
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: InkWell(
                        onTap: () async {
                          var data2 =
                              await showSignatureDialog(context, signatureKey);
                          data2 = await data2.toByteData(
                              format: ui.ImageByteFormat.png);
                          final encoded =
                              base64.encode(data2.buffer.asUint8List());

                          setState(() {
                            signImage = base64.decode(encoded);
                          });
                        },
                        child: Container(
                          color: Colors.grey[300],
                          child: const Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.edit,
                                size: 16,
                              ),
                              SizedBox(height: 5),
                              Text(
                                'Add Sign',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 10,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  signImage != null
                      ? Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey)),
                          child: Image.memory(
                            signImage!,
                            width: 100,
                            height: 100,
                            fit: BoxFit.cover,
                          ))
                      : Container(),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              const Text('Description',
                  style: TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(
                height: 10,
              ),
              Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(0)),
                height: 160,
                // width: 200,
                child: const Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 12.0, vertical: 4.0),
                  child: SingleChildScrollView(
                    child: TextField(
                      // expands: true,
                      maxLines: null,
                      keyboardType: TextInputType.multiline,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Write Detail Description',
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      backgroundColor: const Color.fromRGBO(40, 42, 45, 1),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0),
                      )),
                  onPressed: () {
                    final letter = Letter(
                        imagePaths: imagePaths,
                        letterNumber: letternumberController.text,
                        datePublished: datepublishedController.text,
                        category: selectedCategory,
                        division: selectedDivision,
                        signatureImage: signImage,
                        description: descriptionController.text);
                    Provider.of<LetterFlyProvider>(context, listen: false)
                        .setLetters(letter);
                    // Provider.of<LetterFlyProvider>(context, listen: false).clearTempPhoto();
                    Navigator.pushNamed(context, "/sukses");
                  },
                  child: const Text(
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
