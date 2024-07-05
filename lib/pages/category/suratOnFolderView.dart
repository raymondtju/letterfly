import "package:Letterfly/components/colors.dart";
import "package:Letterfly/components/letteritem.dart";
import "package:Letterfly/components/textstylefont.dart";
import "package:Letterfly/pages/add_letter_page/addletter.dart";
import "package:Letterfly/pages/category/add_surat_in_folder.dart";
import "package:Letterfly/pages/category/provider/My_Letter_Provider.dart";
import "package:Letterfly/pages/letterDetail.dart";
import "package:Letterfly/provider/letterfly_provider.dart";
import "package:flutter/material.dart";
import "package:provider/provider.dart";

class suratOnFolderView extends StatefulWidget {
  final String categoryId;

  const suratOnFolderView({super.key, required this.categoryId});

  @override
  State<suratOnFolderView> createState() => _suratOnFolderViewState();
}

class _suratOnFolderViewState extends State<suratOnFolderView> {
  @override
  Widget build(BuildContext context) {
    final global = GlobalThemeData().lightThemeData;
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
        child: category.listletter.isNotEmpty
            ? Column(
                children: [
                  // searchBar(context),
                  // const SizedBox(
                  //   height: 15,
                  // ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text('${letters.length} Letter',
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
                              prov.categoryViewIsGrid
                                  ? Icons.list
                                  : Icons.grid_view,
                              size: 40,
                              color: const Color(0xFFd9d9d9),
                            ),
                            hoverColor: Colors.white.withOpacity(0),
                            onPressed: () {
                              prov.setCategoryViewGrid =
                                  !prov.categoryViewIsGrid;
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
                          ? gridLetter(letters)
                          : listLetter(letters))
                ],
              )
            : Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => AddSuratInFolder(
                                  imagePaths: [],
                                  categoryId: widget.categoryId,
                                ),
                              ),
                            );
                          },
                          child: SizedBox(
                            height: 60,
                            width: 60,
                            child: Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: const Color.fromRGBO(40, 42, 45, 1),
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(0),
                              ),
                              child: const Icon(
                                Icons.add,
                                size: 28,
                                color: Color.fromRGBO(40, 42, 45, 1),
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
                      "No Recent File",
                      style: subheadlineStyle,
                    ),
                    const Text(
                      "Scan First Letter",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
      ),
      floatingActionButton: Consumer<MyLetterProvider>(
        builder: (context, prov, child) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 10),
            child: Visibility(
              visible: category.listletter.isNotEmpty,
              child: FloatingActionButton(
                elevation: 12,
                backgroundColor: global.colorScheme.primary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0),
                  side: BorderSide(color: global.colorScheme.primary, width: 2),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AddSuratInFolder(
                        imagePaths: [],
                        categoryId: widget.categoryId,
                      ),
                    ),
                  );
                },
                child: const Icon(
                  Icons.add,
                  color: Colors.white,
                ),
              ),
            ),
          );
        },
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

  Expanded listLetter(List<Letter> letters) {
    final prov = Provider.of<MyLetterProvider>(context);
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
                        child: letters[index].imagePaths.isNotEmpty
                            ? Image.network(
                                letters[index].imagePaths[0],
                                fit: BoxFit.cover,
                              )
                            : const Text(""),
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.06,
                    ),
                    Expanded(
                      child: Column(
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
                      ),
                    ),
                    PopupMenuButton<String>(
                      onSelected: (String value) {
                        if (value == 'Delete') {
                          showDeleteConfirmation(context, prov, index);
                        } else if (prov.folders.length <= 1) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              duration: Duration(seconds: 5),
                              content: Text(
                                  'No folder to move to. Try creating a folder or add more'),
                            ),
                          );
                        } else if (value == 'Move to') {
                          showMoveToDialog(context, prov, letters[index]);
                        }
                      },
                      itemBuilder: (BuildContext context) {
                        return [
                          const PopupMenuItem<String>(
                            value: 'Move to',
                            child: ListTile(
                              leading: Icon(Icons.folder),
                              title: Text("Move to"),
                            ),
                          ),
                          const PopupMenuItem<String>(
                            value: 'Delete',
                            child: ListTile(
                              leading: Icon(
                                Icons.delete,
                                color: Colors.red,
                              ),
                              title: Text(
                                'Delete',
                                style: TextStyle(color: Colors.red),
                              ),
                            ),
                          ),
                        ];
                      },
                      icon: const Icon(Icons.more_vert),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Expanded gridLetter(List<Letter> letters) {
    final prov = Provider.of<MyLetterProvider>(context);
    Offset? tapPosition;
    return Expanded(
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisSpacing: 20,
          mainAxisSpacing: 10,
          crossAxisCount: 3,
          childAspectRatio: 0.6,
        ),
        padding: const EdgeInsets.all(10),
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
          onTapDown: (TapDownDetails details) {
            tapPosition = details.globalPosition;
          },
          onLongPress: () {
            if (tapPosition == null) return;

            final Size size = MediaQuery.of(context).size;

            showMenu(
              context: context,
              position: RelativeRect.fromLTRB(
                tapPosition!.dx,
                tapPosition!.dy,
                size.width - tapPosition!.dx,
                size.height - tapPosition!.dy,
              ),
              items: [
                const PopupMenuItem<String>(
                  value: 'Move to',
                  child: ListTile(
                    leading: Icon(Icons.folder),
                    title: Text("Move to"),
                  ),
                ),
                const PopupMenuItem<String>(
                  value: 'Delete',
                  child: ListTile(
                    leading: Icon(
                      Icons.delete,
                      color: Colors.red,
                    ),
                    title: Text(
                      'Delete',
                      style: TextStyle(color: Colors.red),
                    ),
                  ),
                ),
              ],
            ).then((value) {
              if (value == 'Delete') {
                showDeleteConfirmation(context, prov, index);
              } else if (value == 'Move to') {
                showMoveToDialog(context, prov, letters[index]);
              }
            });
          },
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.05,
                child: letters[index].imagePaths.isNotEmpty
                    ? Image.network(
                        letters[index].imagePaths[0],
                        fit: BoxFit.cover,
                      )
                    : const Text(""),
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

  void showDeleteConfirmation(
      BuildContext context, MyLetterProvider prov, int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Delete Letter'),
          content: const Text('Are you sure you want to delete this letter?'),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Delete'),
              onPressed: () {
                prov.folders
                    .firstWhere((folder) => folder.id == widget.categoryId)
                    .listletter
                    .removeAt(index);
                prov.notifyListeners();
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void showMoveToDialog(
      BuildContext context, MyLetterProvider prov, Letter letter) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(0),
          ),
          title: const Text('Choose a folder to move to'),
          content: ConstrainedBox(
            constraints: BoxConstraints(
              maxHeight: MediaQuery.of(context).size.height *
                  0.6, // 60% of screen height
            ),
            child: SingleChildScrollView(
              child: SizedBox(
                width: double.maxFinite,
                child: ListView.builder(
                  shrinkWrap: true,
                  physics:
                      const NeverScrollableScrollPhysics(), // Disable scrolling for this ListView
                  itemCount: prov.folders.length,
                  itemBuilder: (context, index) {
                    final category = prov.folders[index];
                    if (category.id != widget.categoryId) {
                      return ListTile(
                        leading: const Icon(
                          Icons.folder_sharp,
                        ),
                        title: Text(category.title),
                        onTap: () {
                          prov.moveLetterToCategory(
                            fromCategoryId: widget.categoryId,
                            toCategoryId: category.id,
                            letter: letter,
                          );
                          Navigator.of(context).pop();
                        },
                      );
                    }
                    return const SizedBox.shrink();
                  },
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class MoveToSubmenu extends PopupMenuEntry<String> {
  final MyLetterProvider prov;
  final String currentCategoryId;
  final Letter letter;

  const MoveToSubmenu({
    required this.prov,
    required this.currentCategoryId,
    required this.letter,
  });

  @override
  double get height => kMinInteractiveDimension;

  @override
  bool represents(String? value) => false;

  @override
  MoveToSubmenuState createState() => MoveToSubmenuState();
}

class MoveToSubmenuState extends State<MoveToSubmenu> {
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      child: const Row(
        children: [
          Icon(Icons.folder),
          SizedBox(width: 8),
          Text("Move to"),
          Spacer(),
          Icon(Icons.arrow_right),
        ],
      ),
      onSelected: (String categoryId) {
        widget.prov.moveLetterToCategory(
          fromCategoryId: widget.currentCategoryId,
          toCategoryId: categoryId,
          letter: widget.letter,
        );
        Navigator.of(context).pop(); // Close both menus
      },
      itemBuilder: (BuildContext context) {
        return widget.prov.folders
            .where((category) => category.id != widget.currentCategoryId)
            .map((category) {
          return PopupMenuItem<String>(
            value: category.id,
            child: Text(category.title),
          );
        }).toList();
      },
    );
  }
}
