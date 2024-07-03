import 'package:Letterfly/components/colors.dart';
import 'package:Letterfly/components/textstylefont.dart';
import 'package:Letterfly/pages/drawer/support_us.dart';
import 'package:Letterfly/pages/edit_letter_page/editLetter.dart';
import 'package:Letterfly/pages/letterDetail.dart';
import 'package:Letterfly/provider/letterfly_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final global = GlobalThemeData().lightThemeData;
  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<LetterFlyProvider>(context);

    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(40, 42, 45, 1),
        automaticallyImplyLeading: false,
        title: Padding(
          padding: const EdgeInsets.only(top: 30, left: 12
              //MediaQuery.of(context).size.width * 0.01
              ),
          child: Row(
            children: [
              SvgPicture.asset(
                'assets/logo/Logo.svg',
                height: 29,
                color: Colors.white,
              ),
              const SizedBox(
                width: 10,
              ),
              const Text(
                'Letterfly',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        actions: [
          Padding(
              padding: const EdgeInsets.only(
                top: 20,
                right: 20,
              ),
              child: IconButton(
                  onPressed: () {
                    _scaffoldKey.currentState?.openDrawer();
                  },
                  icon: const Icon(
                    Icons.settings_sharp,
                    size: 24,
                    color: Colors.white,
                  )))
        ],
        // actions: [
        //   Switch(
        //       value: prov.switchThemeto,
        //       onChanged: (val) {
        //         prov.setSwitchThemeto = val;
        //       }),
        // ],
      ),
      drawer: HomeDrawer(context, prov),
      backgroundColor: const Color.fromRGBO(40, 42, 45, 1),
      body: Column(
        children: [
          Padding(
            padding:
                const EdgeInsets.only(left: 20, right: 20, top: 24, bottom: 24),
            child: homeNavBar(context),
          ),
          Expanded(
            child: Container(
              color: Colors.white,
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Recents",
                          style: subheadlineStyle,
                        ),
                        TextButton(
                          onPressed: () {
                            prov.setSelectedChipSuratAjaib = false;
                            prov.setSelectedChipSuratKuasa = false;
                          },
                          child: const Text(
                            "View All",
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    prov.Letters.isNotEmpty ? const Chips() : const SizedBox(),
                    Expanded(
                      child: prov.Letters.isNotEmpty
                          ? ListView.builder(
                              itemCount: prov.Letters.length,
                              itemBuilder: (context, index) {
                                if ((prov.selectedChipSuratKuasa &&
                                        prov.Letters[index].category ==
                                            'Surat Kuasa') ||
                                    (prov.selectedChipSuratAjaib &&
                                        prov.Letters[index].category ==
                                            'Surat Ajaib')) {
                                  return ListTile(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  LetterDetailPage(
                                                      id_letter: prov
                                                          .Letters[index].id)));
                                    },
                                    contentPadding:
                                        const EdgeInsets.fromLTRB(0, 5, 5, 5),
                                    leading: Container(
                                      height:
                                          MediaQuery.of(context).size.width *
                                              0.1,
                                      width: MediaQuery.of(context).size.width *
                                          0.1,
                                      color: Colors.grey,
                                    ),
                                    title:
                                        Text(prov.Letters[index].letterNumber),
                                    subtitle: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          '${prov.Letters[index].category} / ${prov.Letters[index].division} / ${prov.Letters[index].imagePaths.length} file',
                                          style: const TextStyle(fontSize: 10),
                                        ),
                                        Text(
                                          prov.Letters[index].datePublished,
                                          style: const TextStyle(fontSize: 10),
                                        ),
                                      ],
                                    ),
                                    trailing: IconButton(
                                        onPressed: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      EditLetterPage(
                                                          id_letter: prov
                                                              .Letters[index]
                                                              .id)));
                                        },
                                        icon: const Icon(Icons.edit)),
                                  );
                                } else if (!prov.selectedChipSuratKuasa &&
                                    !prov.selectedChipSuratAjaib) {
                                  return ListTile(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  LetterDetailPage(
                                                      id_letter: prov
                                                          .Letters[index].id)));
                                    },
                                    contentPadding:
                                        const EdgeInsets.fromLTRB(0, 5, 5, 5),
                                    leading: Container(
                                      height:
                                          MediaQuery.of(context).size.width *
                                              0.1,
                                      width: MediaQuery.of(context).size.width *
                                          0.1,
                                      color: Colors.grey,
                                    ),
                                    title:
                                        Text(prov.Letters[index].letterNumber),
                                    subtitle: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          '${prov.Letters[index].category} / ${prov.Letters[index].division} / ${prov.Letters[index].imagePaths.length} file',
                                          style: const TextStyle(fontSize: 10),
                                        ),
                                        Text(
                                          prov.Letters[index].datePublished,
                                          style: const TextStyle(fontSize: 10),
                                        ),
                                      ],
                                    ),
                                    trailing: IconButton(
                                        onPressed: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      EditLetterPage(
                                                          id_letter: prov
                                                              .Letters[index]
                                                              .id)));
                                        },
                                        icon: const Icon(Icons.edit)),
                                  );
                                } else {
                                  return Container();
                                }
                              },
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
                                          Navigator.pushNamed(
                                              context, "/addletter");
                                        },
                                        child: SizedBox(
                                          height: 60,
                                          width: 60,
                                          child: Container(
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                color: const Color.fromRGBO(
                                                    40, 42, 45, 1),
                                                width: 2,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(0),
                                            ),
                                            child: const Icon(
                                              Icons.add,
                                              size: 28,
                                              color:
                                                  Color.fromRGBO(40, 42, 45, 1),
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
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Drawer HomeDrawer(BuildContext context, LetterFlyProvider prov) {
    return Drawer(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.zero,
      ),
      width: MediaQuery.of(context).size.width * 0.75,
      child: Column(
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.fromLTRB(16, 44, 0, 0),
              children: [
                Container(
                    padding: const EdgeInsets.fromLTRB(16, 0, 0, 0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        prov.imageProfile == null
                            ? Container(
                                width: MediaQuery.of(context).size.width * 0.25,
                                height:
                                    MediaQuery.of(context).size.width * 0.25,
                                decoration: BoxDecoration(
                                  color: global.colorScheme.primary,
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(28),
                                  child: SvgPicture.asset(
                                    'assets/logo/Logo.svg',
                                    color: Colors.white,
                                  ),
                                ),
                              )
                            : CircleAvatar(
                                radius: 50,
                                backgroundImage:
                                    NetworkImage(prov.imageProfile!.path),
                              ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02,
                        ),
                        Text('Hi, ${prov.Username}', style: headlineStyle),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.005,
                        ),
                        Text(prov.Email, style: subheadlineStyle),
                      ],
                    )),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                ListTile(
                  leading: Icon(Icons.person),
                  title: Text(
                    'Profile',
                    style: textlineStyle,
                  ),
                  onTap: () {
                    Navigator.pushNamed(context, "/profile");
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.report),
                  title: const Text(
                    'Report',
                    style: textlineStyle,
                  ),
                  onTap: () {
                    Navigator.pushNamed(context, "/report");
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.info_rounded),
                  title: const Text(
                    'About us',
                    style: textlineStyle,
                  ),
                  onTap: () {
                    Navigator.pushNamed(context, "/about_us");
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.support),
                  title: const Text(
                    'Support us',
                    style: textlineStyle,
                  ),
                  onTap: () {
                    Navigator.pop(context);
                    showSupportUsSheet(context);
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.logout),
                  title: const Text(
                    'Logout',
                    style: textlineStyle,
                  ),
                  onTap: () {
                    Navigator.pushNamed(context, "/login");
                  },
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(
                0, 0, 0, MediaQuery.of(context).size.height * 0.1),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      'assets/logo/Logo.svg',
                      width: 24, // Adjust size as needed
                      height: 24,
                    ),
                    const SizedBox(width: 10),
                    const Text('Letterfly', style: headlineStyle),
                  ],
                ),
                const SizedBox(height: 5),
                const Text('All rights Reserved 2024', style: subtextLineStyle),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Column homeNavBar(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: InkWell(
                onTap: () {
                  Navigator.pushNamed(context, "/addletter");
                },
                child: Container(
                  height: 44,
                  margin: const EdgeInsets.symmetric(horizontal: 8),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: global.colorScheme.onPrimary,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(0),
                    color: global.colorScheme.onPrimary,
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.add,
                        size: 24,
                      ),
                      SizedBox(
                        width: 6,
                      ),
                      Text(
                        "Add Letter",
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: InkWell(
                onTap: () {
                  Navigator.pushNamed(context, "/category");
                },
                child: Container(
                  height: 44,
                  margin: const EdgeInsets.symmetric(horizontal: 8),
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: global.colorScheme.onPrimary, width: 2),
                    borderRadius: BorderRadius.circular(0),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.grid_view_sharp,
                        size: 20,
                        color: global.colorScheme.onPrimary,
                      ),
                      const SizedBox(
                        width: 6,
                      ),
                      Text(
                        "My Letter",
                        style: TextStyle(
                            fontSize: 16, color: global.colorScheme.onPrimary),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        )
      ],
    );
  }

  Column homeNavbarOriginal(BuildContext context) {
    return Column(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // homeSearchBar(),
            // const SizedBox(
            //   height: 16,
            // ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
              child: Row(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, "/addletter");
                        },
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            SizedBox(
                              height: 52,
                              width: 52,
                              child: Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: const Color.fromRGBO(
                                          219, 219, 219, 1),
                                      width: 2),
                                  borderRadius: BorderRadius.circular(0),
                                ),
                              ),
                            ),
                            const Icon(
                              Icons.add,
                              size: 24,
                              color: Colors.white,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        "Add Letter",
                        style: TextStyle(color: Colors.white, fontSize: 12),
                      )
                    ],
                  ),
                  const SizedBox(
                    width: 43,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, "/category");
                        },
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            SizedBox(
                              height: 52,
                              width: 52,
                              child: Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: const Color.fromRGBO(
                                          219, 219, 219, 1),
                                      width: 2),
                                  borderRadius: BorderRadius.circular(0),
                                ),
                              ),
                            ),
                            const Icon(
                              Icons.grid_view_sharp,
                              size: 24,
                              color: Colors.white,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        "Category",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    width: 43,
                  ),
                  // Column(
                  //   mainAxisAlignment: MainAxisAlignment.center,
                  //   children: [
                  //     InkWell(
                  //       onTap: () {},
                  //       child: Stack(
                  //         alignment: Alignment.center,
                  //         children: [
                  //           SizedBox(
                  //             height: 52,
                  //             width: 52,
                  //             child: Container(
                  //               decoration: BoxDecoration(
                  //                 border: Border.all(
                  //                     color: const Color.fromRGBO(
                  //                         219, 219, 219, 1),
                  //                     width: 2),
                  //                 borderRadius: BorderRadius.circular(0),
                  //               ),
                  //             ),
                  //           ),
                  //           const Icon(
                  //             Icons.settings_sharp,
                  //             size: 24,
                  //             color: Colors.white,
                  //           ),
                  //         ],
                  //       ),
                  //     ),
                  //     const SizedBox(height: 10),
                  //     const Text(
                  //       "Settings",
                  //       style: TextStyle(
                  //         color: Colors.white,
                  //         fontSize: 12,
                  //       ),
                  //     )
                  //   ],
                  // )
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  SizedBox homeSearchBar() {
    return SizedBox(
      height: 38,
      child: TextField(
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(0),
          hintText: 'Search category or letter title',
          hintStyle: TextStyle(color: Colors.grey[400], fontSize: 14),
          fillColor: const Color.fromRGBO(249, 249, 249, 1),
          filled: true,
          prefixIcon: const Padding(
            padding: EdgeInsets.only(left: 10.0),
            child: Padding(
              padding: EdgeInsets.only(right: 16.0),
              child: Icon(
                Icons.search,
                // color: Colors.grey,
              ),
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
                // color: Colors.grey,
                ),
            borderRadius: BorderRadius.circular(0),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
                // color: Colors.grey,
                ),
            borderRadius: BorderRadius.circular(0),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: const BorderSide(
                // color: Colors.grey,
                ),
            borderRadius: BorderRadius.circular(0),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(0),
          ),
        ),
      ),
    );
  }
}

class Chips extends StatefulWidget {
  const Chips({super.key});

  @override
  State<Chips> createState() => _ChipsState();
}

class _ChipsState extends State<Chips> {
  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<LetterFlyProvider>(context);
    return Row(
      children: [
        ChoiceChip(
          labelPadding: const EdgeInsets.symmetric(horizontal: 15),
          label: const Text(
            "Surat Kuasa",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          side: const BorderSide(color: Colors.black, width: 1),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
          showCheckmark: false,
          selectedColor: const Color.fromRGBO(219, 219, 219, 100),
          selected: prov.selectedChipSuratKuasa,
          onSelected: (val) {
            prov.setSelectedChipSuratKuasa = val;
            prov.setSelectedChipSuratAjaib = false;
          },
        ),
        const SizedBox(width: 10),
        ChoiceChip(
          labelPadding: const EdgeInsets.symmetric(horizontal: 15),
          label: const Text(
            "Surat Ajaib",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          side: const BorderSide(color: Colors.black, width: 1),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
          showCheckmark: false,
          selectedColor: const Color.fromRGBO(219, 219, 219, 100),
          selectedShadowColor: Colors.black,
          selected: prov.selectedChipSuratAjaib,
          onSelected: (val) {
            prov.setSelectedChipSuratAjaib = val;
            prov.setSelectedChipSuratKuasa = false;
          },
        ),
      ],
    );
  }
}
