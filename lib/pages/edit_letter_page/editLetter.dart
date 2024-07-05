import 'dart:convert';
import 'dart:ui' as ui;
import 'package:Letterfly/components/letteritem.dart';
import 'package:Letterfly/components/textstylefont.dart';
import 'package:Letterfly/pages/edit_letter_page/editTakeAPhoto.dart';
import 'package:Letterfly/provider/letterfly_provider.dart';
import 'package:Letterfly/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_signature_pad/flutter_signature_pad.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class EditLetterPage extends StatefulWidget {
  // ignore: non_constant_identifier_names
  final int id_letter;

  const EditLetterPage({
    super.key,
    // ignore: non_constant_identifier_names
    required this.id_letter,
  });

  @override
  State<EditLetterPage> createState() => EditLetterPageState(
        id_letter: id_letter,
      );
}

class EditLetterPageState extends State<EditLetterPage> {
  // ignore: non_constant_identifier_names
  final int id_letter;

  bool isDraft = false;
  String selectedCategory = 'Surat Kuasa';
  String selectedDivision = 'IT';
  List<String> itemsCategory = ['Surat Kuasa', 'Surat Ajaib'];
  List<String> itemsDivision = ['IT', 'ADMN', 'LOG', 'FO'];
  Uint8List? signImage;

  List<String> tempPhotos = [];

  final signatureKey = GlobalKey<SignatureState>();

  late DateTime selectedDate;
// ignore: non_constant_identifier_names
  EditLetterPageState({required this.id_letter});

  @override
  void initState() {
    super.initState();
    final prov = Provider.of<LetterFlyProvider>(context, listen: false);
    final itemOfLetter =
        prov.letters.firstWhere((letter) => letter.id == id_letter);
    String stringDate = itemOfLetter.datePublished;
    selectedDate = DateTime.parse(stringDate);
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2015, 8),
      lastDate: DateTime(2101),
    );

    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<LetterFlyProvider>(context);
    final itemOfLetter =
        prov.letters.firstWhere((letter) => letter.id == id_letter);
    TextEditingController lettertitleController =
        TextEditingController(text: itemOfLetter.letterTitle);
    TextEditingController letternumberController =
        TextEditingController(text: itemOfLetter.letterNumber);
    TextEditingController descriptionController =
        TextEditingController(text: itemOfLetter.description);

    lettertitleController.addListener(() {
      itemOfLetter.letterTitle = lettertitleController.text;
    });
    letternumberController.addListener(() {
      itemOfLetter.letterNumber = letternumberController.text;
    });
    descriptionController.addListener(() {
      itemOfLetter.description = descriptionController.text;
    });

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
            Text('Edit Letter', style: subheadlineStyle),
          ],
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 16, 20, 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Letter Media',
                style: DefaultStyles.labelStyle,
              ),
              const SizedBox(height: 8),
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
                              for (var imagePath in itemOfLetter.imagePaths)
                                Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: Stack(
                                    children: [
                                      SizedBox(
                                        width: 88,
                                        height: 88,
                                        child: Image.network(
                                          imagePath,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      Positioned(
                                        top: 0,
                                        right: 0,
                                        child: GestureDetector(
                                          onTap: () {
                                            print(itemOfLetter.imagePaths);
                                            itemOfLetter.imagePaths
                                                .remove(imagePath);
                                            setState(() {});
                                          },
                                          child: Container(
                                            decoration: const BoxDecoration(
                                              color: Colors.red,
                                              shape: BoxShape.circle,
                                            ),
                                            child: const Icon(
                                              Icons.close,
                                              color: Colors.white,
                                              size: 16,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              const SizedBox(
                                width: 10,
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => EditTakeAPhotoPage(
                                        id_letter: id_letter,
                                      ),
                                    ),
                                  );
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
                                        'Edit Letter',
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
              const Text(
                'Letter Title',
                style: DefaultStyles.labelStyle,
              ),
              const SizedBox(height: 8),
              TextField(
                controller: lettertitleController,
                decoration: DefaultStyles.inputDecoration,
              ),
              const SizedBox(height: 20),
              const Text(
                'Letter Number',
                style: DefaultStyles.labelStyle,
              ),
              const SizedBox(height: 8),
              TextField(
                controller: letternumberController,
                decoration: DefaultStyles.inputDecoration,
              ),
              const SizedBox(height: 20),
              const Text(
                'Date Published',
                style: DefaultStyles.labelStyle,
              ),
              const SizedBox(height: 8),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () async {
                    await _selectDate(context);
                  },
                  style: ButtonStyle(
                    alignment: Alignment.centerLeft,
                    backgroundColor:
                        WidgetStateProperty.all(Colors.transparent),
                    shadowColor: WidgetStateProperty.all(Colors.black38),
                    overlayColor: WidgetStateProperty.all(
                      Colors.black.withOpacity(0.1),
                    ), // Adjust opacity as needed
                    elevation: WidgetStateProperty.all(0),
                    padding: WidgetStateProperty.all(
                      const EdgeInsets.fromLTRB(12, 22, 0, 22),
                    ),
                    shape: WidgetStateProperty.all(
                      const RoundedRectangleBorder(
                        borderRadius: BorderRadius.zero,
                        side: BorderSide(color: Colors.black38, width: 1.0),
                      ),
                    ),
                  ),
                  child: Text(
                    DateFormat('yyyy-MM-dd').format(selectedDate),
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Category',
                        style: DefaultStyles.labelStyle,
                      ),
                      const SizedBox(height: 10),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.44,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                        ),
                        child: ButtonTheme(
                          alignedDropdown: true,
                          child: DropdownButton(
                            padding: EdgeInsets.zero,
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
                      const Text(
                        'Division',
                        style: DefaultStyles.labelStyle,
                      ),
                      const SizedBox(height: 10),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.44,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey)),
                        child: ButtonTheme(
                          alignedDropdown: true,
                          child: DropdownButton(
                            padding: EdgeInsets.zero,
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
              const Text(
                'Edit E-Signature',
                style: DefaultStyles.labelStyle,
              ),
              const SizedBox(
                height: 8,
              ),
              Stack(
                children: [
                  Container(
                    width: 160,
                    height: 160,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: InkWell(
                        onTap: () async {
                          var data2 =
                              await showSignatureDialog(context, signatureKey);
                          if (data2 != null) {
                            data2 = await data2.toByteData(
                                format: ui.ImageByteFormat.png);
                            final encoded =
                                base64.encode(data2.buffer.asUint8List());
                            setState(() {
                              signImage = base64.decode(encoded);
                            });
                          }
                        },
                        child: signImage != null
                            ? Container(
                                color: Colors.grey[300],
                                child: Image.memory(
                                  signImage!,
                                  width: double.infinity,
                                  height: double.infinity,
                                  fit: BoxFit.cover,
                                ),
                              )
                            : Container(
                                color: Colors.grey[300],
                                child: const Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.edit,
                                      size: 24,
                                    ),
                                    SizedBox(height: 5),
                                    Text(
                                      'Edit Sign',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: -4,
                    right: -4,
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: const Color.fromRGBO(40, 42, 45, 1),
                          borderRadius: BorderRadius.circular(0),
                        ),
                        child: IconButton(
                          onPressed: () async {
                            var data2 = await showSignatureDialog(
                                context, signatureKey);
                            if (data2 != null) {
                              data2 = await data2.toByteData(
                                  format: ui.ImageByteFormat.png);
                              final encoded =
                                  base64.encode(data2.buffer.asUint8List());
                              setState(() {
                                signImage = base64.decode(encoded);
                              });
                            }
                          },
                          icon: const Icon(Icons.edit),
                          iconSize: 24,
                          color: Colors.grey[200],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Description',
                style: DefaultStyles.labelStyle,
              ),
              const SizedBox(
                height: 8,
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(0),
                ),
                height: 160,
                // width: 200,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12.0,
                    vertical: 0,
                  ),
                  child: SingleChildScrollView(
                    child: TextField(
                      controller: descriptionController,
                      maxLines: null,
                      keyboardType: TextInputType.multiline,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Write Detail Description',
                      ),
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Save as draft'),
                  Switch(
                      value: itemOfLetter.isDraft,
                      onChanged: (value) {
                        final updatedLetter = Letter(
                          id: itemOfLetter.id,
                          imagePaths: itemOfLetter.imagePaths,
                          letterTitle: lettertitleController.text,
                          letterNumber: letternumberController.text,
                          datePublished: "$selectedDate".split(' ')[0],
                          category: selectedCategory,
                          division: selectedDivision,
                          signatureImage: signImage,
                          description: descriptionController.text,
                          isDraft: value,
                        );

                        Provider.of<LetterFlyProvider>(context, listen: false)
                            .editLetter(updatedLetter);
                        Navigator.pushNamed(context, "/sukses");
                      })
                ],
              ),
              const SizedBox(height: 30),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    backgroundColor: const Color.fromRGBO(40, 42, 45, 1),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0),
                    ),
                  ),
                  onPressed: () {
                    print(selectedDate);
                    final updatedLetter = Letter(
                      id: itemOfLetter.id,
                      imagePaths: itemOfLetter.imagePaths,
                      letterTitle: lettertitleController.text,
                      letterNumber: letternumberController.text,
                      datePublished: "$selectedDate".split(' ')[0],
                      category: selectedCategory,
                      division: selectedDivision,
                      signatureImage: signImage,
                      description: descriptionController.text,
                      isDraft: itemOfLetter.isDraft,
                    );

                    Provider.of<LetterFlyProvider>(context, listen: false)
                        .editLetter(updatedLetter);
                    Navigator.pushNamed(context, "/sukses");
                  },
                  child: const Text(
                    'Edit Letter',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

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
          style: DefaultStyles.labelStyle,
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
              shape: WidgetStateProperty.all(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0),
                ),
              ),
            ),
            onPressed: () {
              signatureKey.currentState?.clear();
            },
            child: const Text('Reset'),
          ),
          Container(
            color: const Color.fromRGBO(40, 42, 45, 1),
            child: OutlinedButton(
              style: ButtonStyle(
                  shape: WidgetStateProperty.all(RoundedRectangleBorder(
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
