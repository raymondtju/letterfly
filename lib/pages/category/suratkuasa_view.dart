import "package:Letterfly/components/textstylefont.dart";
import "package:Letterfly/data/dummy_suratkuasa.dart";
import "package:Letterfly/pages/category/provider/My_Letter_Provider.dart";
import "package:flutter/material.dart";
import "package:provider/provider.dart";

class SuratKuasaView extends StatefulWidget {
  const SuratKuasaView({super.key});

  @override
  State<SuratKuasaView> createState() => _SuratKuasaViewState();
}

class _SuratKuasaViewState extends State<SuratKuasaView> {
  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<MyLetterProvider>(context);
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
            Text('Surat Kuasa', style: subheadlineStyle),
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
                      Text('${dummySuratKuasa.length} Letter',
                          style: subheadlineStyle),
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
                )
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Expanded(
                child: prov.CategoryViewIsGrid
                    ? gridSuratKuasa()
                    : listSuratKuasa())
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

  Expanded listSuratKuasa() {
    return Expanded(
      child: ListView.builder(
        itemCount: dummySuratKuasa.length,
        itemBuilder: (context, index) => Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {},
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
                          dummySuratKuasa[index].title,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          dummySuratKuasa[index].durasi,
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

Expanded gridSuratKuasa() {
  return Expanded(
    child: GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisSpacing: 20,
        mainAxisSpacing: 10,
        crossAxisCount: 3,
        childAspectRatio: 0.6,
      ),
      // padding: const EdgeInsets.all(10),
      itemCount: dummySuratKuasa.length,
      itemBuilder: (context, index) => InkWell(
        onTap: () {},
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
              dummySuratKuasa[index].title,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
              dummySuratKuasa[index].durasi,
              style: const TextStyle(fontSize: 10),
            ),
          ],
        ),
      ),
    ),
  );
}
