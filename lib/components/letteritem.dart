import 'dart:typed_data';

class Letter {
  final List<String> imagePaths;
  final String letterTitle;
  final String letterNumber;
  final String datePublished;
  final String category;
  final String division;
  Uint8List? signatureImage;
  final String description;

  Letter({
    required this.imagePaths,
    required this.letterTitle,
    required this.letterNumber,
    required this.datePublished,
    required this.category,
    required this.division,
    required this.signatureImage,
    required this.description,
  });
}
