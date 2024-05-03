import 'package:Letterfly/components/textstylefont.dart';
import 'package:Letterfly/data/dummy_data.dart';
import 'package:Letterfly/provider/letterfly_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class CategoryView extends StatefulWidget {
  const CategoryView({super.key});

  @override
  State<CategoryView> createState() => _CategoryViewState();
}

class _CategoryViewState extends State<CategoryView> {
  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<LetterFlyProvider>(context);
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
              searchBar(context),
              const SizedBox(
                height: 15,
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
              const SizedBox(
                height: 15,
              ),
              Expanded(
                  child:
                      prov.CategoryViewIsGrid ? gridCategory() : listCategory())
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: const Color.fromARGB(255, 40, 42, 45),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(0),
              side: const BorderSide(color: Colors.white, width: 2)),
          // foregroundColor: const Color(0xFF282a2d),

          onPressed: () {
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    backgroundColor: Colors.white,
                    title: const Text(
                      "Category Name",
                      style: subheadlineStyle,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0),
                    ),
                    content: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.11,
                      child: Column(
                        children: [
                          // height: MediaQuery.of(context).size.height * 0.3,
                          TextField(
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.all(10),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(0),
                                  borderSide:
                                      const BorderSide(color: Colors.grey)),
                              hintText: "Enter Category Name",
                            ),
                            style: const TextStyle(fontSize: 13),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Align(
                            alignment: Alignment.bottomRight,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 10),
                                backgroundColor:
                                    const Color.fromARGB(255, 40, 42, 45),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(0),
                                ),
                              ),
                              onPressed: () {},
                              child: const Text("Add",
                                  style: TextStyle(color: Colors.white)),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                });
          },
          child: const Icon(
            Icons.add,
            color: Colors.white,
          ),
        ));
  }

  Row searchBar(context) {
    final prov = Provider.of<LetterFlyProvider>(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.70,
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
        const Icon(
          Icons.filter_alt_outlined,
          size: 40,
          color: Color(0xFFd9d9d9),
        ),
        IconButton(
          icon: Icon(
            prov.CategoryViewIsGrid ? Icons.list : Icons.grid_view,
            size: 40,
            color: const Color(0xFFd9d9d9),
          ),
          hoverColor: Colors.white.withOpacity(0),
          onPressed: () {
            prov.setCategoryViewGrid = !prov.CategoryViewIsGrid;
          },
        ),
      ],
    );
  }

  Expanded listCategory() {
    return Expanded(
      child: ListView.builder(
        itemCount: dummyDummy.length,
        itemBuilder: (context, index) => Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {
                  Navigator.pushNamed(context, "/surat_kuasa");
                },
                child: Row(
                  children: [
                    Icon(
                      Icons.folder_sharp,
                      size: MediaQuery.of(context).size.width * 0.3,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.06,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          dummyDummy[index].title,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          dummyDummy[index].durasi,
                          style: const TextStyle(fontSize: 10),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Expanded gridCategory() {
  return Expanded(
    child: GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisSpacing: 20,
        mainAxisSpacing: 10,
        crossAxisCount: 3,
        childAspectRatio: 0.6,
      ),
      // padding: const EdgeInsets.all(10),
      itemCount: dummyDummy.length,
      itemBuilder: (context, index) => InkWell(
        onTap: () {
          Navigator.pushNamed(context, "/surat_kuasa");
        },
        child: Column(
          children: [
            Icon(
              Icons.folder_sharp,
              size: MediaQuery.of(context).size.width * 0.3,
            ),
            const SizedBox(
              height: 7,
            ),
            Text(
              dummyDummy[index].title,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
              dummyDummy[index].durasi,
              style: const TextStyle(fontSize: 10),
            ),
          ],
        ),
      ),
    ),
  );
}
