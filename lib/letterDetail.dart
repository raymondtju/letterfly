import 'package:Letterfly/components/textstylefont.dart';
import 'package:Letterfly/provider/letterfly_provider.dart';
import 'package:Letterfly/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LetterDetailPage extends StatelessWidget {
  final int id_letter; 
  const LetterDetailPage({super.key, required this.id_letter});

  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<LetterFlyProvider>(context);
    final itemOfLetter = prov.Letters.firstWhere((letter) => letter.id == id_letter);

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
            Text('Detail Letter', style: subheadlineStyle),
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
                readOnly: true,
                decoration: DefaultStyles.inputDecoration.copyWith(
                  hintText: '${itemOfLetter.letterTitle}',
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Letter Number',
                style: DefaultStyles.labelStyle,
              ),
              const SizedBox(height: 8),
              TextField(
                readOnly: true,
                decoration: DefaultStyles.inputDecoration.copyWith(
                  hintText: '${itemOfLetter.letterNumber}',
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
                child: Container(
                  padding: const EdgeInsets.fromLTRB(12, 22, 0, 22),
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    border: Border.all(color: Colors.black38, width: 1.0),
                    borderRadius: BorderRadius.zero,
                  ),
                  child: Text(
                    itemOfLetter.datePublished != null
                        ? "${itemOfLetter.datePublished}"
                        : "Select date",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
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
                        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                        ),
                        child: Text(
                          itemOfLetter.category ?? "Select category",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
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
                        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                        ),
                        child: Text(
                          itemOfLetter.division ?? "Select division",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
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
                'E-Signature',
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
                      child: itemOfLetter.signatureImage != null
                        ? Container(
                            color: Colors.grey[300],
                            child: Image.memory(
                              itemOfLetter.signatureImage!,
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
                                  'No Signature',
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
                  padding: EdgeInsets.symmetric(
                    horizontal: 12.0,
                    vertical: 0,
                  ),
                  child: SingleChildScrollView(
                    child: TextField(
                      maxLines: null,
                      keyboardType: TextInputType.multiline,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: '${itemOfLetter.description}'
                      ),
                    ),
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