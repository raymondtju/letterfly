import 'dart:typed_data';

class Letter {
  final int id;
  final List<String> imagePaths;
  final String letterTitle;
  final String letterNumber;
  final String datePublished;
  final String category;
  final String division;
  Uint8List? signatureImage;
  final String description;
  final bool isDraft;

  Letter({
    required this.id,
    required this.imagePaths,
    required this.letterTitle,
    required this.letterNumber,
    required this.datePublished,
    required this.category,
    required this.division,
    required this.signatureImage,
    required this.description,
    required this.isDraft,
  });
}
