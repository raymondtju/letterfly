import "package:Letterfly/components/letteritem.dart";
import "package:Letterfly/components/textstylefont.dart";
import "package:Letterfly/pages/category/provider/My_Letter_Provider.dart";
import "package:Letterfly/pages/letterDetail.dart";
import "package:flutter/material.dart";
import "package:provider/provider.dart";

class SuratKuasaView extends StatefulWidget {
  final String categoryId;

  const SuratKuasaView({super.key, required this.categoryId});

  @override
  State<SuratKuasaView> createState() => _SuratKuasaViewState();
}

class _SuratKuasaViewState extends State<SuratKuasaView> {
  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<MyLetterProvider>(context);
    final category =
        prov.folders.firstWhere((folder) => folder.id == widget.categoryId);
    final letters = category.listletter;
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        leading: BackButton(
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(category.title, style: subheadlineStyle),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            // searchBar(context),
            // const SizedBox(
            //   height: 15,
            // ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text('${letters.length} Letter', style: subheadlineStyle),
                    ],
                  ),
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.filter_alt_outlined,
                      size: 40,
                      color: Color(0xFFd9d9d9),
                    ),
                    IconButton(
                      icon: Icon(
                        prov.categoryViewIsGrid ? Icons.list : Icons.grid_view,
                        size: 40,
                        color: const Color(0xFFd9d9d9),
                      ),
                      hoverColor: Colors.white.withOpacity(0),
                      onPressed: () {
                        prov.setCategoryViewGrid = !prov.categoryViewIsGrid;
                      },
                    ),
                  ],
                )
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Expanded(
                child: prov.categoryViewIsGrid
                    ? gridSuratKuasa(letters)
                    : listSuratKuasa(letters))
          ],
        ),
      ),
    );
  }

  Row searchBar(context) {
    final prov = Provider.of<MyLetterProvider>(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.70,
          child: TextField(
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.all(0),
              hintText: 'Search category',
              hintStyle: TextStyle(color: Colors.grey[400]),
              prefixIcon: Padding(
                padding: const EdgeInsets.only(left: 12.0),
                child: Padding(
                  padding: const EdgeInsets.only(right: 16.0),
                  child: Icon(
                    Icons.search,
                    size: 30,
                    color: Colors.grey[400],
                  ),
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.grey, width: 1.5),
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
            prov.categoryViewIsGrid ? Icons.list : Icons.grid_view,
            size: 40,
            color: const Color(0xFFd9d9d9),
          ),
          hoverColor: Colors.white.withOpacity(0),
          onPressed: () {
            prov.setCategoryViewGrid = !prov.categoryViewIsGrid;
          },
        ),
      ],
    );
  }

  Expanded listSuratKuasa(List<Letter> letters) {
    return Expanded(
      child: ListView.builder(
        itemCount: letters.length,
        itemBuilder: (context, index) => Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          LetterDetailPage(id_letter: letters[index].id),
                    ),
                  );
                },
                child: Row(
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
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.06,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          letters[index].letterTitle,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          letters[index].datePublished,
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

Expanded gridSuratKuasa(List<Letter> letters) {
  return Expanded(
    child: GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisSpacing: 20,
        mainAxisSpacing: 10,
        crossAxisCount: 3,
        childAspectRatio: 0.6,
      ),
      // padding: const EdgeInsets.all(10),
      itemCount: letters.length,
      itemBuilder: (context, index) => InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  LetterDetailPage(id_letter: letters[index].id),
            ),
          );
        },
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.width * 0.05,
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(0),
              ),
              child: SizedBox(
                height: MediaQuery.of(context).size.width * 0.25,
                width: MediaQuery.of(context).size.width * 0.25,
              ),
            ),
            const SizedBox(
              height: 7,
            ),
            Text(
              letters[index].letterTitle,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
              letters[index].datePublished,
              style: const TextStyle(fontSize: 10),
            ),
          ],
        ),
      ),
    ),
  );
}
