import 'package:Letterfly/data/dummy_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:Letterfly/components/textstylefont.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class CategoryGridView extends StatefulWidget {
  const CategoryGridView({super.key});

  @override
  State<CategoryGridView> createState() => _CategoryGridViewState();
}

class _CategoryGridViewState extends State<CategoryGridView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text('Category', style: subheadlineStyle),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SearchBar(context),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text('${dummyDummy.length} Categories',
                      style: subheadlineStyle),
                ],
              ),
            ),
            Grid(),
          ],
        ),
      ),
    );
  }

  Expanded Grid() {
    return Expanded(
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisSpacing: 20,
          mainAxisSpacing: 10,
          crossAxisCount: 3,
          childAspectRatio: 0.7,
        ),
        padding: const EdgeInsets.all(10),
        itemCount: dummyDummy.length,
        itemBuilder: (context, index) => Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(0),
              ),
              child: SizedBox(
                height: MediaQuery.of(context).size.width * 0.3,
                width: MediaQuery.of(context).size.width * 0.3,
              ),
            ),
            Padding(
                padding: const EdgeInsets.only(top: 7, bottom: 0),
                child: Text(
                  dummyDummy[index].title,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                )),
            Text(
              dummyDummy[index].durasi,
              style: const TextStyle(fontSize: 10),
            ),
          ],
        ),
      ),
    );
  }
}

Row SearchBar(context) {
  return Row(
    children: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.72,
          child: TextField(
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.all(0),
              hintText: 'Search category or letter title',
              hintStyle: TextStyle(color: Colors.grey[400]),
              prefixIcon: const Padding(
                padding: EdgeInsets.only(left: 10.0),
                child: Icon(
                  Icons.search,
                  color: Colors.grey,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Colors.grey,
                ),
                borderRadius: BorderRadius.circular(0),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Colors.grey,
                ),
                borderRadius: BorderRadius.circular(0),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Colors.grey,
                ),
                borderRadius: BorderRadius.circular(0),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(0),
              ),
            ),
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(left: 0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(0),
          ),
          child: const Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(
              Icons.filter_list,
              size: 32,
            ),
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(left: 8),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(0),
          ),
          child: const Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(
              Icons.filter_list,
              size: 32,
            ),
          ),
        ),
      )
    ],
  );
}
