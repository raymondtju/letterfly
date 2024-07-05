import 'package:Letterfly/components/categoryItem.dart';
import 'package:Letterfly/components/colors.dart';
import 'package:Letterfly/components/textstylefont.dart';
import 'package:Letterfly/pages/category/provider/My_Letter_Provider.dart';
import 'package:Letterfly/pages/category/suratOnFolderView.dart';
import 'package:Letterfly/provider/letterfly_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:flutter/rendering.dart';

enum SortOption { normal, nameAZ, nameZA }

class CategoryView extends StatefulWidget {
  const CategoryView({super.key});

  @override
  State<CategoryView> createState() => _CategoryViewState();
}

class _CategoryViewState extends State<CategoryView> {
  String title = '';
  SortOption currentSortOption = SortOption.normal;
  bool isAscending = true;
  @override
  Widget build(BuildContext context) {
    final global = GlobalThemeData().lightThemeData;
    final prov = Provider.of<MyLetterProvider>(context);

    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        leading: BackButton(onPressed: () => Navigator.pop(context)),
        title: const Text('My Letter', style: subheadlineStyle),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            _buildHeader(prov),
            prov.folders.isEmpty
                ? _buildEmptyState(context, prov)
                : const SizedBox(height: 15),
            Expanded(
              child: prov.CategoryViewIsGrid ? gridCategory() : listCategory(),
            ),
          ],
        ),
      ),
      floatingActionButton: _buildFloatingActionButton(prov, global),
    );
  }

  Widget _buildHeader(MyLetterProvider prov) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: Text(
            prov.folders.isNotEmpty ? '${prov.folders.length} Folder' : '',
            style: subheadlineStyle,
          ),
        ),
        Row(
          children: [
            _buildSortButton(),
            _buildViewToggleButton(prov),
          ],
        ),
      ],
    );
  }

  Widget _buildSortButton() {
    return PopupMenuButton<SortOption>(
      icon: const Icon(Icons.sort_outlined, size: 40, color: Color(0xFFd9d9d9)),
      onSelected: (SortOption result) {
        setState(() => currentSortOption = result);
      },
      itemBuilder: (BuildContext context) => <PopupMenuEntry<SortOption>>[
        const PopupMenuItem<SortOption>(
          value: SortOption.normal,
          child: Text('Default'),
        ),
        const PopupMenuItem<SortOption>(
          value: SortOption.nameAZ,
          child: Text('Ascending'),
        ),
        const PopupMenuItem<SortOption>(
          value: SortOption.nameZA,
          child: Text('Descending'),
        ),
      ],
    );
  }

  Widget _buildViewToggleButton(MyLetterProvider prov) {
    return IconButton(
      icon: Icon(
        prov.CategoryViewIsGrid ? Icons.list : Icons.grid_view,
        size: 40,
        color: const Color(0xFFd9d9d9),
      ),
      hoverColor: Colors.white.withOpacity(0),
      onPressed: () => prov.setCategoryViewGrid = !prov.CategoryViewIsGrid,
    );
  }

  Widget _buildEmptyState(BuildContext context, MyLetterProvider prov) {
    return Column(
      children: [
        SizedBox(height: MediaQuery.of(context).size.height * 0.30),
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () => addFolderDialog(context, prov),
                child: Container(
                  height: 60,
                  width: 60,
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
              const SizedBox(height: 20),
              const Text("No Recent Folder", style: subheadlineStyle),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildFloatingActionButton(MyLetterProvider prov, ThemeData global) {
    return Consumer<MyLetterProvider>(
      builder: (context, prov, child) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 10),
          child: Visibility(
            visible: prov.folders.isNotEmpty,
            child: FloatingActionButton(
              elevation: 12,
              backgroundColor: global.colorScheme.primary,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(0),
                side: BorderSide(color: global.colorScheme.primary, width: 2),
              ),
              onPressed: () => addFolderDialog(context, prov),
              child: const Icon(Icons.add, color: Colors.white),
            ),
          ),
        );
      },
    );
  }

  Future<dynamic> addFolderDialog(BuildContext context, MyLetterProvider prov) {
    String errorMessage = '';
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return StatefulBuilder(builder: (context, setState) {
            return AlertDialog(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0),
                ),
                backgroundColor: Colors.white,
                title: const Text(
                  "Category Name",
                  style: headlineStyle,
                ),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: TextField(
                        maxLines: 1,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(0),
                              borderSide: const BorderSide(color: Colors.grey)),
                          hintText: "Enter Category Name",
                        ),
                        onChanged: (value) => title = value,
                        style: const TextStyle(fontSize: 12),
                      ),
                    ),
                    if (errorMessage.isNotEmpty)
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Text(
                          errorMessage,
                          style: const TextStyle(color: Colors.red),
                        ),
                      ),
                  ],
                ),
                contentPadding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
                actions: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      backgroundColor: const Color.fromARGB(255, 40, 42, 45),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0),
                      ),
                    ),
                    onPressed: () {
                      if (title.isNotEmpty) {
                        prov.addItem(
                          title: title,
                        );
                        Navigator.of(context).pop();
                      } else {
                        setState(() {
                          errorMessage = 'Folder name has not yet been defined';
                        });
                      }
                    },
                    child: const Text("Add",
                        style: TextStyle(color: Colors.white)),
                  ),
                ],
                actionsPadding: const EdgeInsets.fromLTRB(20, 0, 20, 20));
          });
        });
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
            prov.CategoryViewIsGrid ? Icons.grid_view : Icons.list,
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

//  int customCompare(String a, String b) {
//    int caseInsensitiveCompare = a.toLowerCase().compareTo(b.toLowerCase());
//    if (caseInsensitiveCompare != 0) {
//      return caseInsensitiveCompare;
//    }
//    return b.compareTo(a);
//  }

  int customCompare(String a, String b) {
    // Compare case-insensitive
    int caseInsensitiveCompare = a.toLowerCase().compareTo(b.toLowerCase());

    // If case-insensitive comparison is different, return it
    if (caseInsensitiveCompare != 0) {
      return caseInsensitiveCompare;
    }

    // Otherwise, prioritize uppercase letters before lowercase letters
    return a.compareTo(b);
  }

  List<CategoryItem> getSortedFolders(List<CategoryItem> folders) {
    switch (currentSortOption) {
      case SortOption.normal:
        return folders; // Return the original order
      case SortOption.nameAZ:
        return List.from(folders)
          ..sort((a, b) => customCompare(a.title, b.title));
      case SortOption.nameZA:
        return List.from(folders)
          ..sort((a, b) => customCompare(b.title, a.title));
    }
  }

  Widget listCategory() {
    final prov = Provider.of<MyLetterProvider>(context);
    final sortedFolders = getSortedFolders(prov.folders);

    return Expanded(
      child: ListView.builder(
        itemCount: sortedFolders.length,
        itemBuilder: (context, index) => Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => suratOnFolderView(
                          categoryId: sortedFolders[index].id),
                    ),
                  );
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
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            sortedFolders[index].title,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    PopupMenuButton<String>(
                      onSelected: (String value) {
                        if (value == 'Delete') {
                          // Show confirmation dialog
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return deleteDialog(context, prov, index);
                            },
                          );
                        }
                      },
                      itemBuilder: (BuildContext context) {
                        return [
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
                              )),
                        ];
                      },
                      icon: const Icon(Icons.more_vert), // Three dots icon
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

  Expanded gridCategory() {
    final prov = Provider.of<MyLetterProvider>(context);
    final sortedFolders = getSortedFolders(prov.folders);
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
        itemCount: sortedFolders.length,
        itemBuilder: (context, index) => GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    suratOnFolderView(categoryId: sortedFolders[index].id),
              ),
            );
          },
          onTapDown: (TapDownDetails details) {
            tapPosition = details.globalPosition;
          },
          onLongPress: () {
            if (tapPosition == null) {
              print('Tap position is null');
              return;
            }

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
                  value: 'Favorite',
                  child: ListTile(
                    leading: Icon(Icons.star_border),
                    title: Text("Favorite"),
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
                    )),
              ],
            ).then((value) {
              if (value == 'Delete') {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return deleteDialog(context, prov, index);
                  },
                );
              }
            });
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
                sortedFolders[index].title,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              //Text(
              //  dummyDummy[index].durasi,
              //  style: const TextStyle(fontSize: 10),
              //),
            ],
          ),
        ),
      ),
    );
  }

  AlertDialog deleteDialog(
      BuildContext context, MyLetterProvider prov, int index) {
    final global = GlobalThemeData().lightThemeData;
    return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(0),
        ),
        backgroundColor: Colors.white,
        title: const Text(
          "Delete This Letter",
          style: subheadlineStyle,
        ),
        content: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: const Text(
              "This Letter will be deleted Permanently, Are you sure?"),
        ),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        actions: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              backgroundColor: global.colorScheme.onPrimary,
              side: const BorderSide(width: 1, color: Colors.grey),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(0),
              ),
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text("Cancel",
                style: TextStyle(
                  color: global.colorScheme.primary,
                )),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              side: const BorderSide(width: 1, color: Colors.grey),
              backgroundColor: const Color.fromARGB(255, 40, 42, 45),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(0),
              ),
            ),
            onPressed: () {
              final prov =
                  Provider.of<MyLetterProvider>(context, listen: false);
              final letterFlyProv =
                  Provider.of<LetterFlyProvider>(context, listen: false);

              final deletedItem = prov.folders[index];
              final deletedIndex = index;

              // Remove all letters in this folder from the main letter list in LetterFlyProvider
              for (var letter in deletedItem.listletter) {
                letterFlyProv.removeLetter(letter);
              }

              // Delete the folder and its contents
              prov.deleteItem(prov.folders[index].id);

              Navigator.of(context).pop();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  duration: const Duration(seconds: 5),
                  content: const Text('Folder and its contents deleted'),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0)),
                  action: SnackBarAction(
                    label: const Text(
                      'UNDO',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ).data!,
                    onPressed: () {
                      prov.insertItem(deletedIndex, deletedItem);
                      // Restore letters to LetterFlyProvider
                      for (var letter in deletedItem.listletter) {
                        letterFlyProv.setLetters(letter);
                      }
                    },
                  ),
                ),
              );
            },
            child: const Text("Delete", style: TextStyle(color: Colors.white)),
          ),
        ],
        actionsPadding: const EdgeInsets.fromLTRB(20, 10, 20, 20));
  }
}
