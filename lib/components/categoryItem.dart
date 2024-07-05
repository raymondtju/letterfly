import 'package:Letterfly/components/letteritem.dart';

class CategoryItem {
  final String id;
  final String title;
  final List<Letter> listletter;

  const CategoryItem(
      {required this.id, required this.title, required this.listletter});
}
