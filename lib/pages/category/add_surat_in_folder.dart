import 'dart:convert';
import 'dart:ui' as ui;
import 'package:Letterfly/components/letteritem.dart';
import 'package:Letterfly/components/textstylefont.dart';
import 'package:Letterfly/pages/category/provider/My_Letter_Provider.dart';
import 'package:Letterfly/pages/category/successful_add_surat_in_folder.dart';
import 'package:Letterfly/provider/letterfly_provider.dart';
import 'package:Letterfly/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
              shape: MaterialStateProperty.all(
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
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0)))),
              child: const Text('Save',
                  style: TextStyle(color: Color.fromRGBO(249, 249, 249, 1))),
              onPressed: () async {
                var data = await signatureKey.currentState?.getData();
                // ignore: use_build_context_synchronously
                Navigator.of(context).pop(data);
              },
            ),
          ),
        ],
      );
    },
  );
}

class AddSuratInFolder extends StatefulWidget {
  final List<String> imagePaths;
  final String categoryId;

  const AddSuratInFolder({
    super.key,
    required this.imagePaths,
    required this.categoryId,
  });

  @override
  State<AddSuratInFolder> createState() =>
      // ignore: no_logic_in_create_state
      AddSuratInFolderState(imagePaths: imagePaths);
}

class AddSuratInFolderState extends State<AddSuratInFolder> {
  final List<String> imagePaths;
  bool isDraft = false;
  String selectedCategory = 'Surat Kuasa';
  String selectedDivision = 'IT';
  List<String> itemsCategory = ['Surat Kuasa', 'Surat Ajaib'];
  List<String> itemsDivision = ['IT', 'ADMN', 'LOG', 'FO'];
  Uint8List? signImage;

  List<String> tempPhotos = [];

  TextEditingController lettertitleController = TextEditingController();
  TextEditingController letternumberController = TextEditingController();
  TextEditingController datepublishedController = TextEditingController();
  TextEditingController signatureimageController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  final signatureKey = GlobalKey<SignatureState>();

  AddSuratInFolderState({required this.imagePaths});

  DateTime selectedDate = DateTime.now();
  Future<void> _selectDate(BuildContext context) async {
    final picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2015, 8),
      lastDate: DateTime(DateTime.now().year + 10),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

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
              const Text(
                'Letter Title',
                style: DefaultStyles.labelStyle,
              ),
              const SizedBox(height: 8),
              TextField(
                controller: lettertitleController,
                decoration: DefaultStyles.inputDecoration.copyWith(
                  hintText: 'Title',
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Letter Number',
                style: DefaultStyles.labelStyle,
              ),
              const SizedBox(height: 8),
              TextField(
                controller: letternumberController,
                decoration: DefaultStyles.inputDecoration.copyWith(
                  hintText: 'e.g Order/Code1/Code2/Month/Year',
                ),
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
                  onPressed: () => _selectDate(context),
                  style: ButtonStyle(
                    alignment: Alignment.centerLeft,
                    backgroundColor:
                        MaterialStateProperty.all(Colors.transparent),
                    shadowColor: MaterialStateProperty.all(Colors.black38),
                    overlayColor: MaterialStateProperty.all(
                      Colors.black.withOpacity(0.1),
                    ), // Adjust opacity as needed
                    elevation: MaterialStateProperty.all(0),
                    padding: MaterialStateProperty.all(
                      const EdgeInsets.fromLTRB(12, 22, 0, 22),
                    ),
                    shape: MaterialStateProperty.all(
                      const RoundedRectangleBorder(
                        borderRadius: BorderRadius.zero,
                        side: BorderSide(color: Colors.black38, width: 1.0),
                      ),
                    ),
                  ),
                  child: Text(
                    // ignore: unnecessary_null_comparison
                    selectedDate != null
                        ? "${selectedDate.toLocal()}".split(' ')[0]
                        : "Select date",
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
              // TextField(
              //   controller: datepublishedController,
              //   keyboardType: TextInputType.datetime,
              //   decoration: DefaultStyles.inputDecoration.copyWith(
              //     hintText: 'dd/mm/yyyy',
              //     suffixIcon: const Icon(
              //       Icons.calendar_today_sharp,
              //       size: 16,
              //     ),
              //   ),
              // ),
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
                'Add E-Signature',
                style: DefaultStyles.labelStyle,
              ),
              const SizedBox(
                height: 8,
              ),
              // Stack(
              //   children: [
              //     Container(
              //       width: 120,
              //       height: 120,
              //       decoration: BoxDecoration(
              //         border: Border.all(color: Colors.grey),
              //       ),
              //       child: Padding(
              //         padding: const EdgeInsets.all(12.0),
              //         child: InkWell(
              //           onTap: () async {
              //             var data2 =
              //                 await showSignatureDialog(context, signatureKey);
              //             data2 = await data2.toByteData(
              //                 format: ui.ImageByteFormat.png);
              //             final encoded =
              //                 base64.encode(data2.buffer.asUint8List());

              //             setState(() {
              //               signImage = base64.decode(encoded);
              //             });
              //           },
              //           child: Container(
              //             color: Colors.grey[300],
              //             child: const Column(
              //               mainAxisAlignment: MainAxisAlignment.center,
              //               children: [
              //                 Icon(
              //                   Icons.edit,
              //                   size: 16,
              //                 ),
              //                 SizedBox(height: 5),
              //                 Text(
              //                   'Add Sign',
              //                   textAlign: TextAlign.center,
              //                   style: TextStyle(
              //                     fontSize: 10,
              //                     color: Colors.black,
              //                   ),
              //                 ),
              //               ],
              //             ),
              //           ),
              //         ),
              //       ),
              //     ),
              //     // const SizedBox(
              //     //   width: 20,
              //     // ),
              //     // signImage != null
              //     //     ? Container(
              //     //         width: 100,
              //     //         height: 100,
              //     //         decoration: BoxDecoration(
              //     //             border: Border.all(color: Colors.grey)),
              //     //         child: Image.memory(
              //     //           signImage!,
              //     //           width: 100,
              //     //           height: 100,
              //     //           fit: BoxFit.cover,
              //     //         ))
              //     //     : Container(),
              //     Align(
              //       alignment: Alignment.bottomRight,
              //       child: signImage != null
              //           ? Container(
              //               width: 100,
              //               height: 100,
              //               decoration: BoxDecoration(
              //                   border: Border.all(color: Colors.grey)),
              //               child: Image.memory(
              //                 signImage!,
              //                 width: 100,
              //                 height: 100,
              //                 fit: BoxFit.cover,
              //               ))
              //           : Container(),
              //     )
              //   ],
              // ),
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
                                      'Add Sign',
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
                          // boxShadow: [
                          //   BoxShadow(
                          //     color: Colors.black.withOpacity(0.5),
                          //     spreadRadius: 1,
                          //     blurRadius: 3,
                          //     offset: const Offset(0, 3),
                          //   ),
                          // ],
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
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Save as draft'),
                  Switch(
                      value: isDraft,
                      onChanged: (value) {
                        setState(() {
                          isDraft = value;
                        });
                      })
                ],
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
                    DateTime currentDate = DateTime.now();
                    String defaultDate =
                        "${currentDate.day}/${currentDate.month}/${currentDate.year}";
                    for (var gmbr in imagePaths) {
                      tempPhotos.add(gmbr);
                    }
                    final letterProvider =
                        Provider.of<LetterFlyProvider>(context, listen: false);
                    final letter = Letter(
                        id: letterProvider.letterCounts + 1,
                        imagePaths: tempPhotos,
                        letterTitle: lettertitleController.text,
                        letterNumber: letternumberController.text,
                        // ignore: unnecessary_null_comparison
                        datePublished: selectedDate != null
                            ? "${selectedDate.toLocal()}".split(' ')[0]
                            : defaultDate,
                        category: selectedCategory,
                        division: selectedDivision,
                        signatureImage: signImage,
                        description: descriptionController.text,
                        isDraft: false);
                    Provider.of<LetterFlyProvider>(context, listen: false)
                        .setLetters(letter);
                    Provider.of<MyLetterProvider>(context, listen: false)
                        .addLetterToCategory(
                            categoryId: widget.categoryId, letter: letter);

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              const SuccessfulAddSuratInFolder()),
                    );

                    imagePaths.clear();
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
