import 'package:Letterfly/components/letteritem.dart';

// ignore: camel_case_types
class categoryItem {
  final String id;
  final String title;
  final List<Letter> listletter;

  const categoryItem(
      {required this.id, required this.title, required this.listletter});
}
