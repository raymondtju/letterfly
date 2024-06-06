import 'package:Letterfly/components/textstylefont.dart';
import 'package:Letterfly/editLetter.dart';
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
              Row(
                children: [
                  Expanded(
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
                                  width: 200,
                                  height: 200,
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
                ],
              ),
              const SizedBox(height: 20),
              const Text(
                'Letter Detail',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold
                ),
              ),
              const SizedBox(height: 20),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 16,
                    height: 16,
                    decoration: BoxDecoration(
                      color: Colors.grey[400],
                      borderRadius: BorderRadius.zero,
                    ),
                  ),
                  const SizedBox(width: 8),
                  const Text(
                    'Letter Title',
                    style: DefaultStyles.labelStyle,
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  SizedBox(width: 25),
                  Text('${itemOfLetter.letterTitle}'),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 16,
                    height: 16,
                    decoration: BoxDecoration(
                      color: Colors.grey[400],
                      borderRadius: BorderRadius.zero,
                    ),
                  ),
                  const SizedBox(width: 8),
                  const Text(
                    'Letter Number',
                    style: DefaultStyles.labelStyle,
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  SizedBox(width: 25),
                  Text('${itemOfLetter.letterNumber}'),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 16,
                    height: 16,
                    decoration: BoxDecoration(
                      color: Colors.grey[400],
                      borderRadius: BorderRadius.zero,
                    ),
                  ),
                  const SizedBox(width: 8),
                  const Text(
                    'Date Published',
                    style: DefaultStyles.labelStyle,
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  SizedBox(width: 25),
                  Text('${itemOfLetter.datePublished}'),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 16,
                    height: 16,
                    decoration: BoxDecoration(
                      color: Colors.grey[400],
                      borderRadius: BorderRadius.zero,
                    ),
                  ),
                  const SizedBox(width: 8),
                  const Text(
                    'Category',
                    style: DefaultStyles.labelStyle,
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  SizedBox(width: 25),
                  Text(itemOfLetter.category ?? "No category"),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 16,
                    height: 16,
                    decoration: BoxDecoration(
                      color: Colors.grey[400],
                      borderRadius: BorderRadius.zero,
                    ),
                  ),
                  const SizedBox(width: 8),
                  const Text(
                    'Division',
                    style: DefaultStyles.labelStyle,
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  SizedBox(width: 25),
                  Text(itemOfLetter.division ?? "No division"),
                ],
              ),
              const SizedBox(height: 20),
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
              const SizedBox(height: 20,),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 16,
                    height: 16,
                    decoration: BoxDecoration(
                      color: Colors.grey[400],
                      borderRadius: BorderRadius.zero,
                    ),
                  ),
                  const SizedBox(width: 8),
                  const Text(
                    'Description',
                    style: DefaultStyles.labelStyle,
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  SizedBox(width: 25),
                  Text(itemOfLetter.description),
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
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>EditLetterPage(id_letter: id_letter)));
                  },
                  child: const Text(
                    'Edit Letter',
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